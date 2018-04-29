package uk.co.novinet.service.mail;

import org.apache.commons.io.IOUtils;
import org.codemonkey.simplejavamail.Mailer;
import org.codemonkey.simplejavamail.TransportStrategy;
import org.codemonkey.simplejavamail.email.Email;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import uk.co.novinet.service.member.Member;

import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Scanner;

@Service
public class MailSenderService {

    private static final Logger LOGGER = LoggerFactory.getLogger(MailSenderService.class);

    @Value("${smtpHost}")
    private String smtpHost;

    @Value("${smtpPort}")
    private int smtpPort;

    @Value("${smtpUsername}")
    private String smtpUsername;

    @Value("${smtpPassword}")
    private String smtpPassword;

    @Value("${emailSourceUrl}")
    private String emailSourceUrl;

    @Value("${emailAttachmentId}")
    private String emailAttachmentId;

    @Value("${emailSubject}")
    private String emailSubject;

    @Value("${emailFromName}")
    private String emailFromName;

    @Value("#{'${bccEmailRecipients}'.split(',')}")
    private List<String> bccEmailRecipients;

    public void sendFollowUpEmail(Member member) throws Exception {
        Email email = new Email();

        email.setFromAddress(emailFromName, smtpUsername);

        if (bccEmailRecipients != null && !bccEmailRecipients.isEmpty()) {
            bccEmailRecipients.forEach(bccEmailRecipient -> {
                if (bccEmailRecipient != null && !bccEmailRecipient.trim().isEmpty()) {
                    email.addRecipient(bccEmailRecipient, bccEmailRecipient, MimeMessage.RecipientType.BCC);
                }
            });
        }

        email.addRecipient(member.getEmailAddress(), member.getEmailAddress(), MimeMessage.RecipientType.TO);
        email.setTextHTML(replaceTokens(retrieveEmailBodyHtmlFromGoogleDocs(), member));
        email.setSubject(emailSubject);
        byte[] pdfBytes = retrievePdfFromGoogleDrive();

        if (pdfBytes != null) {
            email.addAttachment("Response for Membership Request.pdf", pdfBytes, "application/pdf");
        } else {
            LOGGER.error("Could not get pdf bytes from google drive!");
        }

        LOGGER.error("Going to try sending email to new memeber {}", member.getEmailAddress());
        new Mailer(smtpHost, smtpPort, smtpUsername, smtpPassword, TransportStrategy.SMTP_TLS).sendMail(email);
        LOGGER.error("Email successfully sent to new member {}", member.getEmailAddress());
    }

    private byte[] retrievePdfFromGoogleDrive() {
        try {
            return IOUtils.toByteArray(new URL("https://drive.google.com/uc?export=download&id=" + emailAttachmentId));
        } catch (IOException e) {
            LOGGER.error("Error occurred trying to download attachment", e);
        }

        return null;
    }

    private String replaceTokens(String emailTemplate, Member member) {
        return emailTemplate.replace("$USERNAME", member.getUsername())
                .replace("$PASSWORD", member.getPasswordDetails().getPassword())
                .replace("$NAME", member.getName());
    }

    private String retrieveEmailBodyHtmlFromGoogleDocs() throws IOException {
        try (Scanner scanner = new Scanner(new URL(emailSourceUrl).openStream(), StandardCharsets.UTF_8.toString())) {
            scanner.useDelimiter("\\A");
            return scanner.hasNext() ? scanner.next() : "";
        }
    }
}