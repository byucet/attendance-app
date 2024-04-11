import { NextResponse } from "next/server";
import prisma from "../../../lib/db";

export async function GET(request, { params }) {
  try {
    const netid = params?.id;
    if (!netid) {
      return NextResponse.json(
        { message: "ID parameter is missing" },
        { status: 400 }
      );
    }

    // Fetch user from database
    const user = await prisma.person.findUnique({
      where: {
        NetID: netid,
      },
    });

    // User not found
    if (!user) {
      return NextResponse.json({ message: "User not found" }, { status: 404 });
    }

    // Return user
    return NextResponse.json({ message: user });
  } catch (error) {
    // Handle errors
    console.error("Error in GET request:", error);
    return NextResponse.json(
      { message: "Internal server error" },
      { status: 500 }
    );
  }
}
