/*
  Warnings:

  - You are about to drop the column `role` on the `user` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `user` DROP COLUMN `role`;

-- CreateTable
CREATE TABLE `UserRole` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userId` INTEGER NOT NULL,
    `role` ENUM('admin', 'teacher', 'student', 'parent') NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `UserRole_userId_role_key`(`userId`, `role`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `RolePermission` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `role` ENUM('admin', 'teacher', 'student', 'parent') NOT NULL,
    `permission` ENUM('VIEW_DASHBOARD', 'MANAGE_PROFILE', 'MANAGE_USERS', 'MANAGE_ROLES', 'MANAGE_PERMISSIONS', 'MANAGE_STUDENTS', 'MANAGE_GRADES', 'MANAGE_SCHEDULES', 'VIEW_GRADES', 'VIEW_SCHEDULES', 'VIEW_CHILD_GRADES', 'VIEW_CHILD_SCHEDULES') NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `RolePermission_role_permission_key`(`role`, `permission`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `UserRole` ADD CONSTRAINT `UserRole_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
