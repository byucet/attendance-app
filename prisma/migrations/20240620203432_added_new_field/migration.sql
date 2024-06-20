-- DropForeignKey
ALTER TABLE `EventAttendance` DROP FOREIGN KEY `EventAttendance_personID_fkey`;

-- AddForeignKey
ALTER TABLE `EventAttendance` ADD CONSTRAINT `EventAttendance_personID_fkey` FOREIGN KEY (`personID`) REFERENCES `Person`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
