import Form from "../../components/Form";
import { notFound } from "next/navigation";
import prisma from "../../lib/db";

export default async function Page({ params }) {
  const { id } = params;
  const program = await prisma.event.findUnique({
    where: {
      eventID: parseInt(id),
    },
  });
  if (!program) notFound();

  return <Form eventID={program.eventID} eventName={program.EventName}/>;
}
