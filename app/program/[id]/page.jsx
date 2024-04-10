import Form from "../../components/Form";
import { notFound } from "next/navigation";
import prisma from "../../lib/db";

export default async function Page({ params }) {
  const { id } = params;
  const program = await prisma.organization.findUnique({
    where: {
      orgID: parseInt(id),
    },
  });

  if (!program) notFound();

  return <Form {...program} />;
}
