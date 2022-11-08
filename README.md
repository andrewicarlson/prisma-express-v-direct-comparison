# Setup
1. `npm i`
2. Create a `.env` file with a database connection string
3. Run `npx prisma migrate dev --name init`
4. Run `npx run seed` to create 50 records.

# Script

Run `npm run query` and observe returned time. I observed the following results after running 10 times.

481ms
444ms
518ms
556ms
457ms
519ms
550ms
462ms
549ms
509ms

Average: 505ms

# Express

Run `npm run express` to start the server and make a get request to `localhost:3000/query` and observe the returned time. I observed the following results after running 10 times.

516ms
67ms
34ms
67ms
45ms
36ms
34ms
34ms
36ms
38ms

Average: 91ms

This result makes sense to me as it re-uses an existing connection after the first request.

# Express with Explicit Disconnects

Run `npm run express-disconnect` to start the server and make a get request to `localhost:3000/query` and observe the returned time. I observed the following results after running 10 times.

506ms
447ms
442ms
435ms
454ms
444ms
489ms
487ms
500ms
438ms

Average: 464ms