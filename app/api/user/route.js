import { NextResponse } from "next/server";
import prisma from "../../lib/db";

export async function POST(request) {
  console.log("POST request made (create user)");
  const res = await request.json();
  const jsDate = new Date();
  const isoDatetime = jsDate.toISOString(); // "2024-04-11T05:06:23.000Z"
  console.log(isoDatetime);
  // Format the datetime string without milliseconds
  const formattedDatetime = isoDatetime.slice(0, 19).replace("T", " ");

  // Now you can use formattedDatetime in your Prisma query

  try {
    const data = {
      firstName: res.firstName,
      lastName: res.lastName,
      netId: res.netid,
      eventID: Number(res.eventID),
    };

    const person = await prisma.person.create({
      data: {
        firstName: data.firstName,
        lastName: data.lastName,
        netId: data.netId,
      },
    });

    //console.log("Person created:", person);

    const student = await prisma.student.create({
      data: {
        Person: { connect: { id: person.id, } },
        netId: data.netId,
      },
    });

    //console.log("Student created:", student);

    const attendance = await prisma.eventAttendance.create({
      data: {
        Event: { connect: { eventID: data.eventID } },
        Person: { connect: { id: person.id } },
      },
    });

    //console.log(attendance);

    return NextResponse.json({ data, message: "Success" }, { status: 200 });
  } catch (error) {
    console.error("Error in GET request:", error);
    return NextResponse.json(
      { message: "Internal server error" },
      { status: 500 }
    );
  }
}
