import { NextResponse } from "next/server";
import prisma from "../../../lib/db";

export async function GET({ params }) {
  const { id } = params;
  console.log(id);
  const user = await prisma.person.findUnique({
    where: {
      netid: id,
    },
  });

  if (!user) return NextResponse.error({ status: 404 });

  return NextResponse.json({ message: "User found!" }, { status: 200 });
}
