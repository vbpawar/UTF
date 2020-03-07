CREATE TABLE `algomaster` (
  `algoid` int(9) UNIQUE NOT NULL AUTO_INCREMENT,
  `topicid` int(9),
  `algoname` varchar(100) NOT NULL,
  `description` text,
  `isactive` int(1) NOT NULL,
  PRIMARY KEY (`algoid`)
);

CREATE TABLE `algosteps` (
  `algoid` int(9) UNIQUE NOT NULL AUTO_INCREMENT,
  `nodeid` int(9) NOT NULL,
  `nodetype` varchar(10) NOT NULL,
  `nodecontent` varchar(500) NOT NULL,
  `nextnode` varchar(100) NOT NULL,
  PRIMARY KEY (`algoid`, `nodeid`)
);

CREATE TABLE `quiz_master` (
  `quizid` int(11) UNIQUE NOT NULL AUTO_INCREMENT,
  `userId` int(11),
  `topicid` int(11),
  `title` varchar(150) NOT NULL,
  `details` varchar(350) NOT NULL,
  `passingScore` int(11),
  `questionTimeout` int(5),
  `quizTimeout` int(5),
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `isActive` int(11),
  PRIMARY KEY (`quizid`)
);

CREATE TABLE `quiz_questions_master` (
  `questionid` int(11) UNIQUE NOT NULL AUTO_INCREMENT,	 
  `questiontype` int(11),
  `quizid` int(11),
  `question` varchar(500),
  `option1` varchar(200),
  `option1answer` boolean,
  `option2` varchar(200),
  `option2answer` boolean,
  `option3` varchar(200),
  `option3answer` boolean,
  `option4` varchar(200),
  `option4answer` boolean,
  `answerdetails` text,
  `mediaUrl` varchar(250),
  `isActive` int(1),
  PRIMARY KEY (`questionid`)
);

CREATE TABLE `quiz_answers` (
  `answerid` int(11) UNIQUE NOT NULL AUTO_INCREMENT,	 
  `quizid` int(11),
  `userid` int(11),
  `score` int(11),
  `quizDate` datetime,
  PRIMARY KEY (`answerid`)
);

CREATE TABLE `subsheader` (
  `productid` int(9) UNIQUE NOT NULL AUTO_INCREMENT,
  `branch` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `cost` int(4) NOT NULL,
  `validity` int(2) NOT NULL,
  `created` int(9),
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` int(9),
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`productid`)
);

CREATE TABLE `subsdetail` (
  `productid` int(9) NOT NULL AUTO_INCREMENT,
  `userid` int(9) NOT NULL,
  `soid` int(9) NOT NULL,
  `discountid` int(9), 
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `created` int(9),
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` int(9),
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (`productid`)
);

CREATE TABLE `courseheader` (
  `productid` int(9) UNIQUE NOT NULL AUTO_INCREMENT,
  `description` varchar(200) NOT NULL,
  `cost` int(4) NOT NULL,
  `branch` varchar(100) NOT NULL,
  `topicid` varchar(250) NOT NULL,
  `subtopicid` int(9),
  `lifethreatning` int(1) NOT NULL,
  `credits` int(4) NOT NULL,
  `startdate` datetime NOT NULL,
  `enddate` datetime,
  `addressline1` varchar(250) NOT NULL,
  `addressline2` varchar(250) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(75) NOT NULL,
  `pin` int(9) NOT NULL,
  `landmark` varchar(350) NOT NULL,
  `longitude` int(9) NOT NULL,
  `latitude` int(9) NOT NULL,
  `created` int(9),
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` int(9),
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP,
  `isactive` int(1),
  PRIMARY KEY (`productid`)
);

CREATE TABLE `coursedetail` (
  `productid` int(9) NOT NULL AUTO_INCREMENT,
  `userid` int(9) NOT NULL,
  `soid` int(9) NOT NULL,
  `created` int(9),
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` int(9),
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`productid`)
);

CREATE TABLE `subjects` (
  `topicid` int(9) UNIQUE NOT NULL AUTO_INCREMENT,
  `branch` varchar(100) NOT NULL,
  `topicname` varchar(250),
  `subtopicid` int(9),
  `subtopicname` varchar(250),
  `lifethreatning` int(1),
  `algorithmid` int(1),  
  `aetiology` text,
  `diagnosis` text,
  `classification` text,
  `clinicalfeatures` text,
  `labfindings` text,
  `considerations` text,
  `differentialdiagnosis` text,
  `emergencytreatment` text,
  `posttraumarecoveryplan` text,
  `created` int(9),
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` int(9),
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP,
  `isactive` int(1),
  PRIMARY KEY (`topicid`)
);

CREATE TABLE `expertsoncall` (
  `topicid` int(9) UNIQUE NOT NULL,
  `subtopicid` int(9) NOT NULL,
  `expertid` int (9) NOT NULL
);

CREATE TABLE `usernotes` (
  `userid` int(9) NOT NULL,
  `topicid` int(9),
  `noteid` int(9),
  `note` text,
  `starred` int(1),  
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `products` (
  `productid` int(9) NOT NULL AUTO_INCREMENT,
  `sku` varchar(50) NOT NULL,
  `tradename` varchar(250),
  `longname` text,
  `uom` varchar(50),
  `packageqty` float,
  `productinfo` varchar(450),
  `availableqty` float,
  `safetystockqty` float,
  `procurementleadtime` int(9),
  `minbuyqty` float,
  `maxbuyqty` float,
  `created` int(9),
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` int(9),
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP,
  `isactive` int(1),
  PRIMARY KEY (`productid`, `sku`)
);

CREATE TABLE `kitcontents` (
  `productid` int(9) NOT NULL AUTO_INCREMENT,
  `sku` varchar(50) NOT NULL,
  `item` varchar(150) NOT NULL,
  `description` varchar(500) NOT NULL,
  `quantity` int(9) NOT NULL,
  `expirydate` Date,
  PRIMARY KEY (`productid`, `item`)
);

CREATE TABLE `productbydealer` (
  `productid` int(9) NOT NULL,
  `dealerid` int(9) NOT NULL,
  PRIMARY KEY (`productid`, `dealerid`)
);

CREATE TABLE `discounts` (
  `productid` int(9) NOT NULL AUTO_INCREMENT,
  `discountid` int(9) NOT NULL,
  `promoname` varchar(250),
  `promoimage` text,
  `percentdiscount` int(9),
  `promostartdate` Date,
  `promoenddate` Date,
  `created` int(9),
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` int(9),
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP,
  `isactive` int(1),
  PRIMARY KEY (`productid`, `discountid`)
);

CREATE TABLE `dealer` (
  `dealerid` int(9) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `businessname` varchar(350),
  `contactname` varchar(150),
  `contactmobile` int(10),
  `altcontactname` varchar(150),
  `altcontactmobile` int(10),
  `addressline1` varchar(250),
  `addressline2` varchar(250),
  `city` varchar(100),
  `state` varchar(75),
  `pin` int(9),
  `landmark` varchar(350),
  `longitude` int(9),
  `latitude` int(9),
  `dealergst` int(15),
  `dealerrank` int(1),
  `created` int(9),
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` int(9),
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP,
  `isactive` int(1)
);

CREATE TABLE `soheader` (
  `soid` int(9) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `dealerid` int,
  `userid` int,
  `shiptoid` int,
  `salesdate` date,
  `currency` varchar(255),
  `invoiceamount` float,
  `discount` float,
  `remarks` varchar(255),
  `created` int(9),
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` int(9),
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `sodetails` (
  `soid` int(9),
  `solineid` int(9) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `sku` varchar(100),
  `uom` varchar(100),
  `price` float,
  `discount` float,
  `expecteddate` date,
  `deliverydate` date,
  `created` int(9),
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` int(9),
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `invoiceheader` (
  `invoiceid` int(9) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `dealerid` int(9),
  `userid` int(9),
  `businessname` varchar(350),
  `invoicedate` date,
  `due_date` date,
  `shiptoid` int(9),
  `remarks` varchar(350),
  `created` int(9),
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` int(9),
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `invoicedetails` (
  `invoiceid` int(9),
  `itemdescription` varchar(350),
  `HSNSACcode` int(9),
  `sku` varchar(100),
  `quanity` float,
  `rate` float,
  `cgstpercent` float,
  `cgstamount` float,
  `sgstpercent` float,
  `sgstamount` float,
  `totalinvoiceamount` float,
  `created` int(9),
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` int(9),
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `deliverydetail` (
  `soid` int(9) UNIQUE PRIMARY KEY NOT NULL,
  `dealerid` int(9) NOT NULL,
  `userid` int(9) NOT NULL,
  `shiptoid` int(9) NOT NULL,
  `deliverydate` date NOT NULL,
  `deliveredby` int(9) NOT NULL,
  `created` int(9),
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` int(9),
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `otpdetail` (
  `otpid` int(9) NOT NULL,
  `mobile` varchar(10),
  `uuid` varchar(200),
  `email` varchar(255),
  `isverified` boolean,
  `logindatetime` datetime DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `userdevices` (
  `mobile` int(10) UNIQUE PRIMARY KEY NOT NULL,
  `uuid` varchar(200),
  `devicetype` varchar(30),
  `model` varchar(50),
  `imei` varchar(30)
);

CREATE TABLE `advertisements` (
  `adid` int(9) UNIQUE PRIMARY KEY NOT NULL,
  `title` varchar(150),
  `imageurl` varchar(250),
  `websitelink` varchar(250),
  `typeofad` int(3),
  `adlocation` varchar(20),
  `areaid` int(9),
  `addestination` varchar(15)
);

CREATE TABLE `adreferrals` (
  `adid` int(9),
  `userid` int(9)
);

CREATE TABLE `servicearea` (
  `areaid` int(9) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `district` varchar(250) UNIQUE,
  `suburb` varchar(25),
  `areaname` varchar(250),
  `isActive` boolean
);

CREATE TABLE `feedback` (
  `userid` int(9) NOT NULL,
  `rate1` int(1),
  `rate2` int(1),
  `rate3` int(1),
  `rate4` int(1),
  `rate5` int(1),
  `comments` varchar(255),
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `users` (
  `userid` int(9) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `password` varchar(20) NOT NULL,
  `roleid` int(9),
  `categoryid` int(9),
  `businessname` varchar(255),
  `firstname` varchar(150),
  `lastname` varchar(150),
  `whatsappmobile` int(10),
  `email` varchar(255),
  `joiningdate` date,
  `subscriptionid` int(9),
  `birthdate` date,
  `altcontactname` varchar(150),
  `altcontactmobile` int(10),
  `created` int(9),
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` int(9),
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP,
  `isactive` int(1)
);


CREATE TABLE `usergroup` (
  `groupid` int(9) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `groupname` varchar(150) NOT NULL,  
  `userid` int(9)
);

CREATE TABLE `usershipto` (
  `shiptoid` int(9) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `userid` int(9),
  `addressline1` varchar(250),
  `addressline2` varchar(250),
  `city` varchar(100),
  `state` varchar(75),
  `pin` int(9),
  `landmark` varchar(250),
  `longitude` int(9),
  `latitude` int(9),
  `created` int(9),
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` int(9),
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP,
  `isactive` int(1),
  `isprimary` int(1)
);

CREATE TABLE `userroles` (
  `roleid` int(9) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255),
  `description` varchar(255),
  `created` int(9),
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` int(9),
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP,
  `isactive` int(1)
);

ALTER TABLE `algosteps` ADD FOREIGN KEY (`algoid`) REFERENCES `algomaster` (`algoid`);

ALTER TABLE `users` ADD FOREIGN KEY (`roleid`) REFERENCES `userroles` (`roleid`);

ALTER TABLE `productbydealer` ADD FOREIGN KEY (`dealerid`) REFERENCES `dealer` (`dealerid`);

ALTER TABLE `productbydealer` ADD FOREIGN KEY (`productid`) REFERENCES `products` (`productid`);

ALTER TABLE `kitcontents` ADD FOREIGN KEY (`productid`) REFERENCES `products` (`productid`);

ALTER TABLE `soheader` ADD FOREIGN KEY (`dealerid`) REFERENCES `users` (`userid`);

ALTER TABLE `soheader` ADD FOREIGN KEY (`shiptoid`) REFERENCES `usershipto` (`shiptoid`);

ALTER TABLE `sodetails` ADD FOREIGN KEY (`soid`) REFERENCES `soheader` (`soid`);

ALTER TABLE `sodetails` ADD FOREIGN KEY (`sku`) REFERENCES `products` (`sku`);

ALTER TABLE `invoiceheader` ADD FOREIGN KEY (`dealerid`) REFERENCES `users` (`userid`);

ALTER TABLE `invoiceheader` ADD FOREIGN KEY (`shiptoid`) REFERENCES `usershipto` (`shiptoid`);

ALTER TABLE `invoicedetails` ADD FOREIGN KEY (`invoiceid`) REFERENCES `invoiceheader` (`invoiceid`);

ALTER TABLE `invoicedetails` ADD FOREIGN KEY (`sku`) REFERENCES `products` (`sku`);

ALTER TABLE `deliverydetail` ADD FOREIGN KEY (`soid`) REFERENCES `soheader` (`soid`);

ALTER TABLE `deliverydetail` ADD FOREIGN KEY (`dealerid`) REFERENCES `users` (`userid`);

ALTER TABLE `deliverydetail` ADD FOREIGN KEY (`shiptoid`) REFERENCES `usershipto` (`shiptoid`);

ALTER TABLE `deliverydetail` ADD FOREIGN KEY (`deliveredby`) REFERENCES `users` (`userid`);

ALTER TABLE `advertisements` ADD FOREIGN KEY (`areaid`) REFERENCES `servicearea` (`areaid`);

ALTER TABLE `adreferrals` ADD FOREIGN KEY (`adid`) REFERENCES `advertisements` (`adid`);

ALTER TABLE `quiz_master` ADD FOREIGN KEY (`topicid`) REFERENCES `subjects` (`topicid`);

ALTER TABLE `coursedetail` ADD FOREIGN KEY (`productid`) REFERENCES `courseheader` (`productid`);

ALTER TABLE `subsdetail` ADD FOREIGN KEY (`productid`) REFERENCES `subsheader` (`productid`);

ALTER TABLE `quiz_answers` ADD FOREIGN KEY (`quizid`) REFERENCES `quiz_master` (`quizid`);

CREATE UNIQUE INDEX `users_index_0` ON `users` (`userid`, `email`);

CREATE UNIQUE INDEX `users_index_1` ON `users` (`email`);

CREATE UNIQUE INDEX `userroles_index_2` ON `userroles` (`roleid`);

CREATE UNIQUE INDEX `products_index_4` ON `products` (`productid`);

CREATE INDEX `products_index_5` ON `products` (`tradename`);

CREATE UNIQUE INDEX `soheader_index_13` ON `soheader` (`soid`);

CREATE UNIQUE INDEX `sodetails_index_14` ON `sodetails` (`soid`, `solineid`);

CREATE UNIQUE INDEX `invoiceheader_index_15` ON `invoiceheader` (`invoiceid`);

CREATE UNIQUE INDEX `invoicedetails_index_16` ON `invoicedetails` (`invoiceid`);

CREATE UNIQUE INDEX `deliverydetail_index_17` ON `deliverydetail` (`soid`, `dealerid`, `shiptoid`, `deliverydate`);

CREATE INDEX `servicearea_index_18` ON `servicearea` (`areaid`);

CREATE UNIQUE INDEX `servicearea_index_19` ON `servicearea` (`district`, `suburb`);

CREATE INDEX `servicearea_index_20` ON `servicearea` (`areaname`);

CREATE INDEX `quiz_master_index_1` ON `quiz_master` (`quizid`);

CREATE INDEX `quiz_master_index_2` ON `quiz_master` (`topicid`);

CREATE INDEX `quiz_master_index_3` ON `quiz_master` (`userId`);

CREATE INDEX `quiz_question_master_index_1` ON `quiz_questions_master` (`questionid`);

CREATE UNIQUE INDEX `quiz_questions_master_0` ON `quiz_questions_master` (`quizid`);

CREATE INDEX `quiz_question_master_index_2` ON `quiz_master` (`quizid`);