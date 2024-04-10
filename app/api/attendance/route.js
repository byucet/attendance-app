import { NextResponse } from "next/server";
import prisma from "../../lib/db";

export async function POST(request) {
  console.log("POST request made");
  const res = await request.json();
  console.log(res);
  try {
    const data = {
      firstName: res.FirstName,
      personID: res.personID,
      netid: res.netid,
    };

    return NextResponse.json({ data, message: "Success" }, { status: 200 });
  } catch (error) {
    console.error("Error in GET request:", error);
    return NextResponse.json(
      { message: "Internal server error" },
      { status: 500 }
    );
  }
}
