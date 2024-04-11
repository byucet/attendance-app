import { NextResponse } from "next/server";
import prisma from "../../lib/db";

export async function POST(request) {
  console.log("POST request made (create attendance)");
  const res = await request.json();
  console.log(res);
  try {
    const data = {
      firstName: res.FirstName,
      personID: res.personID,
      NetID: res.netid,
      orgID: Number(res.orgID),
    };

    const timeAttended = new Date();

    console.log(data);
    const attendance = await prisma.eventAttendance.create({
      data: {
        Event: { connect: { eventID: data.orgID } },
        Person: { connect: { personID: data.personID } },
      },
    });

    console.log(attendance);

    return NextResponse.json({ data, message: "Success" }, { status: 200 });
  } catch (error) {
    console.error("Error in GET request:", error);
    return NextResponse.json(
      { message: "Internal server error" },
      { status: 500 }
    );
  }
}
