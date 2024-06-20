import { NextResponse } from "next/server";
import prisma from "../../lib/db";

export async function POST(request) {
  //console.log("POST request made (create attendance)");
  const res = await request.json();
  //console.log(res);
  try {
    const data = {
      firstName: res.firstName,
      personID: res.id,
      NetID: res.netid,
      eventID: Number(res.eventID) /* * 100 */,
    };
    console.log('Atteendance-Checkpoint1');
    console.log('Data',data);
    const timeAttended = new Date();
    const attendance = await prisma.eventAttendance.create({
      data: {
        Event: { connect: { eventID: data.eventID } },
        Person: { connect: { id: data.personID } },
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

// export async function GET(request) {
//   const { searchParams } = new URL(request.url);
//   const eventId = searchParams.get('eventId');
//   const date = searchParams.get('date');

//   try {
//     const attendance = await prisma.eventAttendance.findMany({
//       where: {
//         eventId: Number(eventId),
//         TimeAttended: {
//           gte: new Date(date).toISOString(),
//           lt: new Date(new Date(date).setDate(new Date(date).getDate() + 1)).toISOString()
//         }
//       },
//       include: {
//         Person: {
//           select: {
//             firstName: true,
//             lastName: true,
//             netId: true
//           }
//         }
//       },
//       orderBy: {
//         TimeAttended: 'desc' // Order by TimeAttended in descending order
//       }
//     });

//     return NextResponse.json(attendance);
//   } catch (error) {
//     console.error('Error fetching attendance:', error);
//     return NextResponse.json({ message: 'Internal server error' }, { status: 500 });
//   }
// }

export async function GET(request) {
  const { searchParams } = new URL(request.url);
  const eventId = searchParams.get('eventId');
  const startDate = searchParams.get('startDate');
  const endDate = searchParams.get('endDate');

  try {
    const attendance = await prisma.eventAttendance.findMany({
      where: {
        eventId: Number(eventId),
        TimeAttended: {
          gte: new Date(startDate).toISOString(),
          lt: new Date(new Date(endDate).setDate(new Date(endDate).getDate() + 1)).toISOString()
        }
      },
      include: {
        Person: {
          select: {
            firstName: true,
            lastName: true,
            netId: true
          }
        }
      },
      orderBy: {
        TimeAttended: 'desc' // Order by TimeAttended in descending order
      }
    });

    return NextResponse.json(attendance);
  } catch (error) {
    console.error('Error fetching attendance:', error);
    return NextResponse.json({ message: 'Internal server error' }, { status: 500 });
  }
}