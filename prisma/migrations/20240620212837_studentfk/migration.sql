-- CreateIndex
CREATE INDEX `Student_person___fk` ON `Student`(`personId`);

-- AddForeignKey
ALTER TABLE `Student` ADD CONSTRAINT `Student_person___fk` FOREIGN KEY (`personId`) REFERENCES `Person`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
