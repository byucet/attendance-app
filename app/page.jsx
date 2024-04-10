import Link from "next/link";

export default function Home() {
  return (
    <>
      <span className="text-teal-800">
        Click on your event sponsor to check in!
      </span>
      <div className="mt-4 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        <Link
          href={`/program/1`}
          className="bg-teal-800 text-white px-4 py-3 rounded-md"
        >
          The Slab
        </Link>

        <Link
          href={`program/2`}
          className="bg-teal-700 text-white px-4 py-3 rounded-md"
        >
          Creators
        </Link>
        <Link
          href={`program/3`}
          className="bg-teal-600 text-white px-4 py-3 rounded-md"
        >
          Women in Entrepreneurship
        </Link>
        <Link
          href={`program/4`}
          className="bg-teal-500 text-white px-4 py-3 rounded-md"
        >
          Seed
        </Link>
        <Link
          href={`program/5`}
          className="bg-yellow-500 text-white px-4 py-3 rounded-md"
        >
          Launchpad
        </Link>
      </div>
    </>
  );
}
