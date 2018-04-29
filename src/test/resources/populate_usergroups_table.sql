INSERT INTO `i7b0_usergroups` (`gid`, `type`, `title`, `description`, `namestyle`, `usertitle`, `stars`, `starimage`, `image`, `disporder`, `isbannedgroup`, `canview`, `canviewthreads`, `canviewprofiles`, `candlattachments`, `canviewboardclosed`, `canpostthreads`, `canpostreplys`, `canpostattachments`, `canratethreads`, `modposts`, `modthreads`, `mod_edit_posts`, `modattachments`, `caneditposts`, `candeleteposts`, `candeletethreads`, `caneditattachments`, `canviewdeletionnotice`, `canpostpolls`, `canvotepolls`, `canundovotes`, `canusepms`, `cansendpms`, `cantrackpms`, `candenypmreceipts`, `pmquota`, `maxpmrecipients`, `cansendemail`, `cansendemailoverride`, `maxemails`, `emailfloodtime`, `canviewmemberlist`, `canviewcalendar`, `canaddevents`, `canbypasseventmod`, `canmoderateevents`, `canviewonline`, `canviewwolinvis`, `canviewonlineips`, `cancp`, `issupermod`, `cansearch`, `canusercp`, `canuploadavatars`, `canratemembers`, `canchangename`, `canbereported`, `canchangewebsite`, `showforumteam`, `usereputationsystem`, `cangivereputations`, `candeletereputations`, `reputationpower`, `maxreputationsday`, `maxreputationsperuser`, `maxreputationsperthread`, `candisplaygroup`, `attachquota`, `cancustomtitle`, `canwarnusers`, `canreceivewarnings`, `maxwarningsday`, `canmodcp`, `showinbirthdaylist`, `canoverridepm`, `canusesig`, `canusesigxposts`, `signofollow`, `edittimelimit`, `maxposts`, `showmemberlist`, `canmanageannounce`, `canmanagemodqueue`, `canmanagereportedcontent`, `canviewmodlogs`, `caneditprofiles`, `canbanusers`, `canviewwarnlogs`, `canuseipsearch`)
VALUES
	(1,1,'Guests','The default group that all visitors are assigned to unless they\'re logged in.','{username}','Unregistered',0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,0,0,5,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(2,1,'Registered','After registration, all users are placed in this group by default.','{username}','',0,'images/star.png','',0,0,1,1,1,1,0,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,0,1,1,1,1,200,5,1,0,5,5,1,1,1,0,0,1,0,0,0,0,1,1,1,1,0,1,1,0,1,1,1,1,5,0,0,1,0,1,0,1,0,0,1,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0),
	(3,1,'Super Moderators','These users can moderate any forum.','<span style=\"color: #CC00CC;\"><strong>{username}</strong></span>','Super Moderator',6,'images/star.png','',0,0,1,1,1,1,0,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,250,5,1,0,10,5,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,0,1,1,1,1,1,1,10,0,0,1,0,1,1,1,3,1,1,0,1,0,0,0,0,1,1,1,1,1,1,1,1,1),
	(4,1,'Administrators','The group all administrators belong to.','<span style=\"color: green;\"><strong><em>{username}</em></strong></span>','Administrator',7,'images/star.png','',0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,2,0,0,0,1,0,1,1,1,0,1,1,0,1,0,0,0,0,1,1,1,1,1,1,1,1,1),
	(5,1,'Awaiting Activation','Users that have not activated their account by email or manually been activated yet.','{username}','Account not Activated',0,'images/star.png','',0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,20,5,0,0,5,5,1,1,0,0,0,1,0,0,0,0,1,1,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0),
	(6,1,'Moderators','These users moderate specific forums.','<span style=\"color: #CC00CC;\"><strong>{username}</strong></span>','Moderator',5,'images/star.png','',0,0,1,1,1,1,0,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,0,1,1,1,1,250,5,1,0,5,5,1,1,0,0,0,1,0,0,0,0,1,1,1,1,1,0,1,1,1,1,1,1,10,0,0,1,0,1,1,1,3,1,1,0,1,0,0,0,0,1,1,1,1,1,1,1,1,1),
	(7,1,'Banned','The default user group to which members that are banned are moved to.','<s>{username}</s>','Banned',0,'images/star.png','',0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,5,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0),
	(8,2,'LCAG Guests','Temporary / trial membership to LCAG and limited access to forum','{username}','',0,'images/star.png','',0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,0,1,1,1,1,100,5,1,0,4,5,1,1,1,0,0,1,0,0,0,0,1,1,1,1,0,0,1,0,1,1,1,1,5,0,0,0,5000,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0);