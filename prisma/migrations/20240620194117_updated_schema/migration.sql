/*
  Warnings:

  - The primary key for the `EventAttendance` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Major` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `MajorName` on the `Major` table. All the data in the column will be lost.
  - You are about to drop the column `majorID` on the `Major` table. All the data in the column will be lost.
  - The primary key for the `Person` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `City` on the `Person` table. All the data in the column will be lost.
  - You are about to drop the column `Country` on the `Person` table. All the data in the column will be lost.
  - You are about to drop the column `Email` on the `Person` table. All the data in the column will be lost.
  - You are about to drop the column `Ethnicity` on the `Person` table. All the data in the column will be lost.
  - You are about to drop the column `FirstName` on the `Person` table. All the data in the column will be lost.
  - You are about to drop the column `Gender` on the `Person` table. All the data in the column will be lost.
  - You are about to drop the column `LastName` on the `Person` table. All the data in the column will be lost.
  - You are about to drop the column `LinkedInURL` on the `Person` table. All the data in the column will be lost.
  - You are about to drop the column `NetID` on the `Person` table. All the data in the column will be lost.
  - You are about to drop the column `Phone` on the `Person` table. All the data in the column will be lost.
  - You are about to drop the column `PreferredName` on the `Person` table. All the data in the column will be lost.
  - You are about to drop the column `State` on the `Person` table. All the data in the column will be lost.
  - You are about to drop the column `personID` on the `Person` table. All the data in the column will be lost.
  - The primary key for the `Student` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `ClassStanding` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `College` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `EventTerm` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `ExpectedGradYear` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `GraduationYear` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `Major` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `NetID` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `UniversityEmail` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `UniversityID` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `personID` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `DateEnd` on the `StudentMajorsHistory` table. All the data in the column will be lost.
  - You are about to drop the column `DateStart` on the `StudentMajorsHistory` table. All the data in the column will be lost.
  - You are about to drop the column `majorID` on the `StudentMajorsHistory` table. All the data in the column will be lost.
  - You are about to drop the column `personID` on the `StudentMajorsHistory` table. All the data in the column will be lost.
  - You are about to drop the `GrantHistory` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `TeamMembership` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `TeamMentor` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `team` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `temp_grant` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[majorName]` on the table `Major` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[netId]` on the table `Person` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[netId]` on the table `Student` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `id` to the `Major` table without a default value. This is not possible if the table is not empty.
  - Added the required column `majorName` to the `Major` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `Person` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `Student` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `StudentMajorsHistory` table without a default value. This is not possible if the table is not empty.
  - Added the required column `majorId` to the `StudentMajorsHistory` table without a default value. This is not possible if the table is not empty.
  - Added the required column `studentId` to the `StudentMajorsHistory` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `MentorUpdate` DROP FOREIGN KEY `teamMentor_FK`;

-- DropForeignKey
ALTER TABLE `Student` DROP FOREIGN KEY `Student_ibfk_1`;

-- DropForeignKey
ALTER TABLE `temp_grant` DROP FOREIGN KEY `fk_contactId`;

-- DropIndex
DROP INDEX `MajorName` ON `Major`;

-- DropIndex
DROP INDEX `ByuID` ON `Student`;

-- DropIndex
DROP INDEX `NetID` ON `Student`;

-- AlterTable
ALTER TABLE `EventAttendance` DROP PRIMARY KEY,
    MODIFY `TimeAttended` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD PRIMARY KEY (`eventId`, `personID`, `TimeAttended`);

-- AlterTable
ALTER TABLE `Major` DROP PRIMARY KEY,
    DROP COLUMN `MajorName`,
    DROP COLUMN `majorID`,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `majorName` VARCHAR(130) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `Person` DROP PRIMARY KEY,
    DROP COLUMN `City`,
    DROP COLUMN `Country`,
    DROP COLUMN `Email`,
    DROP COLUMN `Ethnicity`,
    DROP COLUMN `FirstName`,
    DROP COLUMN `Gender`,
    DROP COLUMN `LastName`,
    DROP COLUMN `LinkedInURL`,
    DROP COLUMN `NetID`,
    DROP COLUMN `Phone`,
    DROP COLUMN `PreferredName`,
    DROP COLUMN `State`,
    DROP COLUMN `personID`,
    ADD COLUMN `city` VARCHAR(50) NULL,
    ADD COLUMN `country` CHAR(10) NULL,
    ADD COLUMN `email` VARCHAR(100) NULL,
    ADD COLUMN `firstName` VARCHAR(50) NULL,
    ADD COLUMN `gender` ENUM('MALE', 'FEMALE', 'OTHER') NULL,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `lastName` VARCHAR(50) NULL,
    ADD COLUMN `linkedInUrl` VARCHAR(200) NULL,
    ADD COLUMN `needsUpdate` BOOLEAN NULL,
    ADD COLUMN `netId` VARCHAR(20) NULL,
    ADD COLUMN `phone` VARCHAR(14) NULL,
    ADD COLUMN `preferredName` VARCHAR(255) NULL,
    ADD COLUMN `state` CHAR(20) NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `Student` DROP PRIMARY KEY,
    DROP COLUMN `ClassStanding`,
    DROP COLUMN `College`,
    DROP COLUMN `EventTerm`,
    DROP COLUMN `ExpectedGradYear`,
    DROP COLUMN `GraduationYear`,
    DROP COLUMN `Major`,
    DROP COLUMN `NetID`,
    DROP COLUMN `UniversityEmail`,
    DROP COLUMN `UniversityID`,
    DROP COLUMN `personID`,
    ADD COLUMN `classStanding` VARCHAR(20) NULL,
    ADD COLUMN `college` VARCHAR(150) NULL,
    ADD COLUMN `ethnicity` VARCHAR(50) NULL,
    ADD COLUMN `gender` ENUM('MALE', 'FEMALE', 'OTHER') NULL,
    ADD COLUMN `graduationYear` INTEGER NULL,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `netId` VARCHAR(20) NULL,
    ADD COLUMN `personId` INTEGER NULL,
    ADD COLUMN `universityID` INTEGER NULL,
    ADD COLUMN `userId` INTEGER NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `StudentMajorsHistory` DROP COLUMN `DateEnd`,
    DROP COLUMN `DateStart`,
    DROP COLUMN `majorID`,
    DROP COLUMN `personID`,
    ADD COLUMN `dateEnd` DATE NULL,
    ADD COLUMN `dateStart` DATE NULL,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `majorId` INTEGER NOT NULL,
    ADD COLUMN `studentId` INTEGER NOT NULL,
    ADD PRIMARY KEY (`id`);

-- DropTable
DROP TABLE `GrantHistory`;

-- DropTable
DROP TABLE `TeamMembership`;

-- DropTable
DROP TABLE `TeamMentor`;

-- DropTable
DROP TABLE `team`;

-- DropTable
DROP TABLE `temp_grant`;

-- CreateTable
CREATE TABLE `Business` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `businessName` VARCHAR(200) NULL,
    `companyCategory` VARCHAR(100) NULL,
    `companyIndustry` VARCHAR(100) NULL,
    `model` VARCHAR(20) NULL,
    `websiteURL` VARCHAR(300) NULL,
    `dateFounded` DATETIME(0) NULL,
    `dateEnded` DATETIME(0) NULL,
    `description` LONGTEXT NULL,
    `isPublic` BIT(1) NULL,
    `stage` VARCHAR(100) NULL,
    `currentMetricId` INTEGER NULL,
    `linkedInUrl` VARCHAR(500) NULL,
    `logo` VARCHAR(255) NULL,
    `businessStatus` ENUM('ACTIVE', 'DEACTIVATED', 'SOFT_DELETED') NOT NULL DEFAULT 'ACTIVE',
    `activityLogs` JSON NOT NULL,
    `createdById` INTEGER NOT NULL,
    `createdAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `BusinessMember` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userId` INTEGER NOT NULL,
    `businessId` INTEGER NOT NULL,
    `firstName` VARCHAR(50) NULL,
    `lastName` VARCHAR(50) NULL,
    `role` ENUM('FOUNDER', 'COFOUNDER', 'EMPLOYEE', 'INTERN', 'MENTOR') NOT NULL,
    `primaryContact` BOOLEAN NOT NULL DEFAULT false,
    `ownership` DOUBLE NULL,
    `notes` VARCHAR(300) NULL,
    `dateLeft` DATETIME(0) NULL,
    `dateJoined` DATETIME(0) NULL,
    `membershipStatus` ENUM('ACTIVE', 'LEFT', 'DEACTIVATED', 'SOFT_DELETED') NOT NULL DEFAULT 'ACTIVE',
    `invitedById` INTEGER NULL,
    `activityLogs` JSON NOT NULL,
    `createdAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `BusinessMember_businessId_userId_membershipStatus_key`(`businessId`, `userId`, `membershipStatus`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Funding` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `contactName` VARCHAR(150) NOT NULL,
    `contactEmail` VARCHAR(100) NOT NULL,
    `contactPhone` VARCHAR(14) NOT NULL,
    `companyName` VARCHAR(255) NOT NULL,
    `approvedAmount` DOUBLE NOT NULL,
    `approvedDatetime` DATETIME(0) NOT NULL,
    `grantRequestId` INTEGER NOT NULL,
    `businessId` INTEGER NOT NULL,
    `contactId` INTEGER NOT NULL,
    `approvedById` INTEGER NOT NULL,
    `activityLogs` JSON NOT NULL,
    `createdAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `GrantApplication` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `description` LONGTEXT NOT NULL,
    `grantTypeId` INTEGER NOT NULL,
    `formId` INTEGER NOT NULL,
    `startDate` DATE NOT NULL,
    `endDate` DATE NULL,
    `applicationStatus` ENUM('ACTIVE', 'INACTIVE', 'EXPIRED') NOT NULL DEFAULT 'ACTIVE',
    `createdById` INTEGER NOT NULL,
    `createdAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `GrantRequest` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `businessId` INTEGER NOT NULL,
    `submissionId` INTEGER NOT NULL,
    `grantApplicationId` INTEGER NOT NULL,
    `reviewStageId` INTEGER NULL,
    `applicationStatus` ENUM('SUBMITTED', 'REJECTED', 'CANCELLED', 'REVIEW', 'PENDING', 'FEEDBACK', 'ACCEPTED') NOT NULL DEFAULT 'SUBMITTED',
    `submittedById` INTEGER NOT NULL,
    `activityLogs` JSON NOT NULL,
    `createdAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` DATETIME(0) NOT NULL,

    UNIQUE INDEX `GrantRequest_submissionId_key`(`submissionId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `GrantType` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `status` ENUM('ACTIVE', 'INACTIVE') NOT NULL DEFAULT 'ACTIVE',
    `createdAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `GrantType_name_key`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OLD_GrantHistory` (
    `grantID` INTEGER NOT NULL AUTO_INCREMENT,
    `teamId` INTEGER NOT NULL,
    `AwardAmount` INTEGER NULL,
    `GrantType` VARCHAR(50) NULL,
    `DateAwarded` DATETIME(0) NULL,

    PRIMARY KEY (`grantID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OLD_Major` (
    `majorID` INTEGER NOT NULL AUTO_INCREMENT,
    `MajorName` VARCHAR(130) NULL,

    UNIQUE INDEX `MajorName`(`MajorName`),
    PRIMARY KEY (`majorID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OLD_Person` (
    `personID` INTEGER NOT NULL AUTO_INCREMENT,
    `FirstName` VARCHAR(50) NULL,
    `LastName` VARCHAR(50) NULL,
    `PreferredName` VARCHAR(255) NULL,
    `NetID` VARCHAR(20) NULL,
    `Gender` VARCHAR(32) NULL,
    `Email` VARCHAR(100) NULL,
    `Phone` VARCHAR(14) NULL,
    `Ethnicity` VARCHAR(255) NULL,
    `City` VARCHAR(50) NULL,
    `State` CHAR(20) NULL,
    `Country` CHAR(10) NULL,
    `LinkedInURL` VARCHAR(200) NULL,
    `needsUpdate` BOOLEAN NULL,

    UNIQUE INDEX `Person_NetID_key`(`NetID`),
    PRIMARY KEY (`personID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OLD_Student` (
    `personID` INTEGER NOT NULL,
    `NetID` VARCHAR(20) NULL,
    `UniversityID` INTEGER NULL,
    `ClassStanding` VARCHAR(20) NULL,
    `College` VARCHAR(150) NULL,
    `GraduationYear` INTEGER NULL,
    `Major` VARCHAR(255) NULL,
    `ExpectedGradYear` INTEGER NULL,
    `EventTerm` VARCHAR(255) NULL,
    `UniversityEmail` VARCHAR(255) NULL,

    UNIQUE INDEX `NetID`(`NetID`),
    UNIQUE INDEX `ByuID`(`UniversityID`),
    PRIMARY KEY (`personID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OLD_StudentMajorsHistory` (
    `majorID` INTEGER NOT NULL,
    `personID` INTEGER NOT NULL,
    `DateStart` DATE NULL,
    `DateEnd` DATE NULL
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OLD_TeamMembership` (
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
CREATE TABLE `OLD_TeamMentor` (
    `personID` INTEGER NOT NULL,
    `teamID` INTEGER NOT NULL,
    `StartDate` DATE NULL,
    `EndDate` DATE NULL,

    PRIMARY KEY (`personID`, `teamID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OLD_team` (
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

-- CreateTable
CREATE TABLE `OLD_temp_grant` (
    `ContactName` VARCHAR(150) NULL,
    `ContactEmail` VARCHAR(100) NULL,
    `CompanyName` VARCHAR(255) NULL,
    `ContactPhone` VARCHAR(14) NULL,
    `ApprovalAmount` DECIMAL(10, 2) NULL,
    `GrantDate` DATE NULL,
    `grantID` INTEGER NOT NULL AUTO_INCREMENT,
    `teamId` INTEGER NULL DEFAULT 0,
    `contactId` INTEGER NULL,
    `ContactFirstName` VARCHAR(255) NULL,
    `ContactLastName` VARCHAR(255) NULL,

    INDEX `fk_contactId`(`contactId`),
    PRIMARY KEY (`grantID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `firstName` VARCHAR(50) NOT NULL,
    `lastName` VARCHAR(50) NOT NULL,
    `email` VARCHAR(100) NULL,
    `byuEmail` VARCHAR(100) NULL,
    `phone` VARCHAR(14) NULL,
    `password` VARCHAR(100) NOT NULL,
    `photoUrl` VARCHAR(200) NULL,
    `address` VARCHAR(200) NULL,
    `linkedInUrl` VARCHAR(200) NULL,
    `preferredName` VARCHAR(255) NULL,
    `byuVerified` BIT(1) NOT NULL DEFAULT b'0',
    `emailVerified` BIT(1) NOT NULL DEFAULT b'0',
    `userType` ENUM('USER', 'MENTOR', 'ADMIN', 'SUPER_ADMIN') NOT NULL DEFAULT 'USER',
    `accountStatus` ENUM('NON_VERIFIED', 'VERIFIED', 'DEACTIVATED', 'SOFT_DELETED') NOT NULL DEFAULT 'NON_VERIFIED',
    `personId` INTEGER NULL,
    `accountLogs` JSON NOT NULL,
    `lastAccessDate` DATETIME(0) NULL,
    `createdAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `User_email_accountStatus_key`(`email`, `accountStatus`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE INDEX `EventAttendance_personID_fkey` ON `EventAttendance`(`personID`);

-- CreateIndex
CREATE UNIQUE INDEX `Major_majorName_key` ON `Major`(`majorName`);

-- CreateIndex
CREATE UNIQUE INDEX `Person_netId_key` ON `Person`(`netId`);

-- CreateIndex
CREATE UNIQUE INDEX `Student_netId_key` ON `Student`(`netId`);

-- AddForeignKey
ALTER TABLE `EventAttendance` ADD CONSTRAINT `EventAttendance_eventId_fkey` FOREIGN KEY (`eventId`) REFERENCES `Event`(`eventID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `EventAttendance` ADD CONSTRAINT `EventAttendance_personID_fkey` FOREIGN KEY (`personID`) REFERENCES `Person`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MentorUpdate` ADD CONSTRAINT `teamMentor_FK` FOREIGN KEY (`personID`, `teamID`) REFERENCES `OLD_TeamMentor`(`personID`, `teamID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `OLD_Student` ADD CONSTRAINT `OLD_Student_ibfk_1` FOREIGN KEY (`personID`) REFERENCES `OLD_Person`(`personID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `OLD_temp_grant` ADD CONSTRAINT `fk_contactId` FOREIGN KEY (`contactId`) REFERENCES `OLD_Person`(`personID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
