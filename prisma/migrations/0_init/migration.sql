-- CreateTable
CREATE TABLE `Event` (
    `eventID` INTEGER NOT NULL AUTO_INCREMENT,
    `EventName` VARCHAR(50) NULL,
    `DateStart` DATETIME(0) NULL,
    `DateEnd` DATETIME(0) NULL,
    `EventType` VARCHAR(20) NULL,
    `recurringEventID` INTEGER NULL,

    PRIMARY KEY (`eventID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `EventAttendance` (
    `eventId` INTEGER NOT NULL,
    `personID` INTEGER NOT NULL,
    `TimeAttended` DATETIME(0) NOT NULL,
    `Notes` VARCHAR(500) NULL,

    PRIMARY KEY (`eventId`, `personID`, `TimeAttended`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `GrantHistory` (
    `grantID` INTEGER NOT NULL AUTO_INCREMENT,
    `teamId` INTEGER NOT NULL,
    `AwardAmount` INTEGER NULL,
    `GrantType` VARCHAR(50) NULL,
    `DateAwarded` DATETIME(0) NULL,

    PRIMARY KEY (`grantID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Major` (
    `majorID` INTEGER NOT NULL AUTO_INCREMENT,
    `MajorName` VARCHAR(130) NULL,

    UNIQUE INDEX `MajorName`(`MajorName`),
    PRIMARY KEY (`majorID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Mentor` (
    `personID` INTEGER NOT NULL,
    `StartDate` DATE NULL,
    `EndDate` DATE NULL,
    `IsDonor` BIT(1) NULL,
    `CompanyName` VARCHAR(200) NULL,
    `Role` VARCHAR(100) NULL,
    `Notes` VARCHAR(500) NULL,

    PRIMARY KEY (`personID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `MentorUpdate` (
    `mentorUpdateID` INTEGER NOT NULL AUTO_INCREMENT,
    `TeamHealth` INTEGER NULL,
    `Notes` VARCHAR(500) NULL,
    `personID` INTEGER NULL,
    `teamID` INTEGER NULL,

    INDEX `teamMentor_FK`(`personID`, `teamID`),
    PRIMARY KEY (`mentorUpdateID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Metric` (
    `metricID` INTEGER NOT NULL AUTO_INCREMENT,
    `MetricName` VARCHAR(200) NULL,
    `Description` VARCHAR(500) NULL,

    PRIMARY KEY (`metricID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OrgMembership` (
    `orgID` INTEGER NOT NULL,
    `personID` INTEGER NOT NULL,
    `DateJoined` DATE NULL,
    `DateExpired` DATE NULL,
    `isPaid` BIT(1) NULL,

    PRIMARY KEY (`orgID`, `personID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OrgTeamMembership` (
    `teamID` INTEGER NOT NULL,
    `orgID` INTEGER NOT NULL,
    `DateJoined` DATE NULL,
    `DateEnded` DATE NULL,

    PRIMARY KEY (`teamID`, `orgID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Organization` (
    `orgID` INTEGER NOT NULL AUTO_INCREMENT,
    `orgName` VARCHAR(50) NULL,
    `DateFounded` DATE NULL,

    PRIMARY KEY (`orgID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OrganizationEventLink` (
    `orgID` INTEGER NOT NULL,
    `eventID` INTEGER NOT NULL,

    PRIMARY KEY (`orgID`, `eventID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Person` (
    `personID` INTEGER NOT NULL AUTO_INCREMENT,
    `FirstName` VARCHAR(50) NULL,
    `LastName` VARCHAR(50) NULL,
    `City` VARCHAR(50) NULL,
    `State` CHAR(20) NULL,
    `Country` CHAR(10) NULL,
    `Phone` VARCHAR(14) NULL,
    `Email` VARCHAR(100) NULL,
    `LinkedInURL` VARCHAR(200) NULL,
    `netid` VARCHAR(20) NULL,
    `NeedsUpdate` BOOLEAN NULL,
    `PreferredName` VARCHAR(25) NULL,

    PRIMARY KEY (`personID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `RecurringEvent` (
    `recurringEventID` INTEGER NOT NULL AUTO_INCREMENT,
    `eventName` VARCHAR(100) NULL,
    `eventDescription` VARCHAR(150) NULL,

    PRIMARY KEY (`recurringEventID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Student` (
    `personID` INTEGER NOT NULL,
    `NetID` VARCHAR(20) NULL,
    `ByuID` INTEGER NULL,
    `ClassStanding` VARCHAR(20) NULL,
    `Ethnicity` VARCHAR(50) NULL,
    `College` VARCHAR(150) NULL,
    `GraduationYear` INTEGER NULL,
    `Gender` VARCHAR(1) NULL,
    `NeedsUpdate` BIT(1) NULL,
    `Major` VARCHAR(255) NULL,
    `ExpectedGradYear` INTEGER NULL,

    UNIQUE INDEX `NetID`(`NetID`),
    UNIQUE INDEX `ByuID`(`ByuID`),
    PRIMARY KEY (`personID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `StudentMajorsHistory` (
    `majorID` INTEGER NOT NULL,
    `personID` INTEGER NOT NULL,
    `DateStart` DATE NULL,
    `DateEnd` DATE NULL
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TeamEventAttendance` (
    `eventId` INTEGER NOT NULL,
    `teamID` INTEGER NOT NULL,
    `TimeAttended` DATETIME(0) NULL,

    PRIMARY KEY (`eventId`, `teamID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TeamMembership` (
    `personID` INTEGER NOT NULL,
    `teamID` INTEGER NOT NULL,
    `DateJoined` DATETIME(0) NULL,
    `DateLeft` DATETIME(0) NULL,
    `Role` VARCHAR(100) NULL,
    `CoFounder` BIT(1) NULL,
    `Notes` VARCHAR(300) NULL,
    `id` INTEGER NULL,

    PRIMARY KEY (`personID`, `teamID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TeamMentor` (
    `personID` INTEGER NOT NULL,
    `teamID` INTEGER NOT NULL,
    `StartDate` DATE NULL,
    `EndDate` DATE NULL,

    PRIMARY KEY (`personID`, `teamID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TeamUpdate` (
    `updateID` INTEGER NOT NULL AUTO_INCREMENT,
    `teamID` INTEGER NOT NULL,
    `UpdateDate` DATETIME(0) NULL,
    `MetWithMentor` BIT(1) NULL,
    `MentorNotes` VARCHAR(500) NULL,
    `metricID` INTEGER NULL,
    `metricValue` VARCHAR(100) NULL,
    `metricNotes` VARCHAR(1000) NULL,
    `Notes` VARCHAR(500) NULL,
    `submitter_id` INTEGER NULL,
    `created_by` VARCHAR(20) NULL,

    INDEX `TeamUpdate_submitter_id_6425d1c5_fk_auth_user_id`(`submitter_id`),
    PRIMARY KEY (`updateID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `UpdateTopic` (
    `topicID` INTEGER NOT NULL AUTO_INCREMENT,
    `topicName` VARCHAR(100) NULL,
    `Description` VARCHAR(2000) NULL,

    PRIMARY KEY (`topicID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `UpdateTopicData` (
    `topicID` INTEGER NOT NULL,
    `updateID` INTEGER NOT NULL,
    `Response` VARCHAR(300) NULL,

    PRIMARY KEY (`topicID`, `updateID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `auth_group` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(150) NOT NULL,

    UNIQUE INDEX `name`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `auth_group_permissions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `group_id` INTEGER NOT NULL,
    `permission_id` INTEGER NOT NULL,

    INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`),
    UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `auth_permission` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `content_type_id` INTEGER NOT NULL,
    `codename` VARCHAR(100) NOT NULL,

    UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `auth_user` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `password` VARCHAR(128) NOT NULL,
    `last_login` DATETIME(6) NULL,
    `is_superuser` BOOLEAN NOT NULL,
    `username` VARCHAR(150) NOT NULL,
    `first_name` VARCHAR(150) NOT NULL,
    `last_name` VARCHAR(150) NOT NULL,
    `email` VARCHAR(254) NOT NULL,
    `is_staff` BOOLEAN NOT NULL,
    `is_active` BOOLEAN NOT NULL,
    `date_joined` DATETIME(6) NOT NULL,

    UNIQUE INDEX `username`(`username`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `auth_user_groups` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `group_id` INTEGER NOT NULL,

    INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`),
    UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `auth_user_user_permissions` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `permission_id` INTEGER NOT NULL,

    INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`),
    UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `django_admin_log` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `action_time` DATETIME(6) NOT NULL,
    `object_id` LONGTEXT NULL,
    `object_repr` VARCHAR(200) NOT NULL,
    `action_flag` SMALLINT UNSIGNED NOT NULL,
    `change_message` LONGTEXT NOT NULL,
    `content_type_id` INTEGER NULL,
    `user_id` INTEGER NOT NULL,

    INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`),
    INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `django_content_type` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `app_label` VARCHAR(100) NOT NULL,
    `model` VARCHAR(100) NOT NULL,

    UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `django_migrations` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `app` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `applied` DATETIME(6) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `django_session` (
    `session_key` VARCHAR(40) NOT NULL,
    `session_data` LONGTEXT NOT NULL,
    `expire_date` DATETIME(6) NOT NULL,

    INDEX `django_session_expire_date_a5c62663`(`expire_date`),
    PRIMARY KEY (`session_key`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `team` (
    `teamID` INTEGER NOT NULL AUTO_INCREMENT,
    `TeamName` VARCHAR(200) NULL,
    `CompanyCategory` VARCHAR(100) NULL,
    `CompanyIndustry` VARCHAR(100) NULL,
    `Model` VARCHAR(20) NULL,
    `WebsiteURL` VARCHAR(300) NULL,
    `DateFounded` DATETIME(0) NULL,
    `DateEnded` DATETIME(0) NULL,
    `Description` VARCHAR(400) NULL,
    `IsPublic` BIT(1) NULL,
    `Stage` VARCHAR(100) NULL,
    `CurrentMetricID` INTEGER NULL,
    `LinkedInURL` VARCHAR(500) NULL,
    `Logo` VARCHAR(255) NULL,
    `created_by` VARCHAR(20) NOT NULL,
    `created_at` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` DATETIME(0) NULL,

    PRIMARY KEY (`teamID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `MentorUpdate` ADD CONSTRAINT `teamMentor_FK` FOREIGN KEY (`personID`, `teamID`) REFERENCES `TeamMentor`(`personID`, `teamID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Student` ADD CONSTRAINT `Student_ibfk_1` FOREIGN KEY (`personID`) REFERENCES `Person`(`personID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `TeamUpdate` ADD CONSTRAINT `TeamUpdate_submitter_id_6425d1c5_fk_auth_user_id` FOREIGN KEY (`submitter_id`) REFERENCES `auth_user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `auth_group_permissions` ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `auth_group_permissions` ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `auth_permission` ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `auth_user_groups` ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `auth_user_groups` ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `auth_user_user_permissions` ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `auth_user_user_permissions` ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `django_admin_log` ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `django_admin_log` ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

