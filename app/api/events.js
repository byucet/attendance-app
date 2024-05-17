// pages/api/events.js
import prisma from '../../lib/prisma';

export default async function handler(req, res) {
  const events = await prisma.event.findMany();
  res.json(events);
}
