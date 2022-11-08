-- DropForeignKey
ALTER TABLE "libraries" DROP CONSTRAINT "libraries_companyId_fkey";

-- AlterTable
ALTER TABLE "libraries" ALTER COLUMN "companyId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "libraries" ADD CONSTRAINT "libraries_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "companies"("id") ON DELETE SET NULL ON UPDATE CASCADE;
