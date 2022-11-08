-- CreateEnum
CREATE TYPE "LibraryType" AS ENUM ('GENERAL', 'PERSONAL');

-- CreateTable
CREATE TABLE "components" (
    "id" SERIAL NOT NULL,
    "alias" TEXT NOT NULL,
    "archived" BOOLEAN NOT NULL,
    "category" TEXT NOT NULL,
    "companyId" INTEGER NOT NULL,
    "created" INTEGER NOT NULL,
    "libraryId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "revision" TEXT,
    "status" TEXT,

    CONSTRAINT "components_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "companies" (
    "id" SERIAL NOT NULL,
    "archived" BOOLEAN NOT NULL,
    "created" INTEGER NOT NULL,
    "creatorId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "companies_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "libraries" (
    "id" SERIAL NOT NULL,
    "archived" BOOLEAN NOT NULL,
    "companyId" INTEGER NOT NULL,
    "created" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "type" "LibraryType",

    CONSTRAINT "libraries_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "components" ADD CONSTRAINT "components_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "companies"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "components" ADD CONSTRAINT "components_libraryId_fkey" FOREIGN KEY ("libraryId") REFERENCES "libraries"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "libraries" ADD CONSTRAINT "libraries_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "companies"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
