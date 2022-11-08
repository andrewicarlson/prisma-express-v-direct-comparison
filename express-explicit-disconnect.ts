import express from 'express';
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();
const app = express();

app.get('/query', async (req: any, res: any) => {
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

    res.json(true);
});

const server = app.listen(3000);