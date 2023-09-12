import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
  await deleteRecords();
  await create();
}

async function create() {
  const user = await prisma.user.create({
    data: {
      name: "john",
      email: "john@gmail.com",
      age: 27,
      isValid: true,
      userPreference: {
        create: {
          emailUpdates: true,
        },
      },
    },
  });
  console.log(user);
}

async function read() {
  const user = await prisma.user.findMany();
  console.log(user);
}

async function deleteRecords() {
  await prisma.user.deleteMany();
}

main()
  .catch((e) => {
    console.error(e.message);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
