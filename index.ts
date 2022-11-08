import { PrismaClient } from "@prisma/client";

(async () => {
    const prisma = new PrismaClient();
    const start = Date.now();

    await prisma.$connect();

    const result = await prisma.component.findMany({
        take: 21,
        where: {
            libraryObj: { type: 'GENERAL' }
        }
    });

    await prisma.$disconnect();

    console.log(`${result.length} results returned in ${Date.now() - start}ms`);
})();