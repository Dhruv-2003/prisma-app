/*
  Warnings:

  - You are about to drop the column `blob` on the `User` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_User" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    "email" TEXT,
    "isValid" BOOLEAN NOT NULL
);
INSERT INTO "new_User" ("age", "email", "id", "isValid", "name") SELECT "age", "email", "id", "isValid", "name" FROM "User";
DROP TABLE "User";
ALTER TABLE "new_User" RENAME TO "User";
CREATE INDEX "User_email_idx" ON "User"("email");
CREATE UNIQUE INDEX "User_age_name_key" ON "User"("age", "name");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
