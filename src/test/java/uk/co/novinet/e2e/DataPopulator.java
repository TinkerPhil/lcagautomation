package uk.co.novinet.e2e;

import static java.lang.Thread.sleep;
import static uk.co.novinet.e2e.TestUtils.insertUser;
import static uk.co.novinet.e2e.TestUtils.runSqlScript;

public class DataPopulator {

    public static void main(String[] args) throws Exception {
        int sqlRetryCounter = 0;
        boolean needToRetry = true;

        while (needToRetry && sqlRetryCounter < 20) {
            try {
                runSqlScript("drop_user_table.sql");
                runSqlScript("create_user_table.sql");
                runSqlScript("create_usergroups_table.sql");
                runSqlScript("populate_usergroups_table.sql");
                needToRetry = false;
            } catch (Exception e) {
                sqlRetryCounter++;
                sleep(1000);
            }
        }

        for (int i = 1; i <= 200; i++) {
            insertUser(i, "testuser" + i, "user" + i + "@something.com");
        }
    }

}
