/*
  Warnings:

  - A unique constraint covering the columns `[netid]` on the table `Person` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX `Person_netid_key` ON `Person`(`netid`);

-- AddForeignKey
ALTER TABLE `EventAttendance` ADD CONSTRAINT `EventAttendance_eventId_fkey` FOREIGN KEY (`eventId`) REFERENCES `Event`(`eventID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `EventAttendance` ADD CONSTRAINT `EventAttendance_personID_fkey` FOREIGN KEY (`personID`) REFERENCES `Person`(`personID`) ON DELETE RESTRICT ON UPDATE CASCADE;
