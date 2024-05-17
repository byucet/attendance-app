import { NextResponse } from 'next/server';
import prisma from "../../lib/db";

export async function GET() {
  try {
    const events = await prisma.event.findMany({
      where: {
        eventID: {
          gte: 100, // Greater than or equal to 100
        },
      },
    });
    return NextResponse.json(events);
  } catch (error) {
    console.error('Error fetching events:', error);
    return NextResponse.json({ message: 'Internal server error' }, { status: 500 });
  }
}
