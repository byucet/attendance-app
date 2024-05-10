import Link from "next/link";
import prisma from "./lib/db";

export default function Home() {
  return (
    <>
      <div className="h-full flex flex-col justify-start md:justify-center items-center">
        <h1 className="text-3xl font-bold w-2/3">Welcome to our Event!</h1>
        <span className="text-slate-700 py-2 w-2/3">
          Click on your event sponsor to check in!
        </span>
        <div className="mt-4 w-2/3 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
          <Link
            href={`/program/1000`}
            className="bg-teal-900 text-white px-4 py-3 rounded-md"
          >
            The Slab
          </Link>

          <Link
            href={`program/200`}
            className="bg-teal-800 text-white px-4 py-3 rounded-md"
          >
            Creators
          </Link>

          <Link
            href={`program/700`}
            className="bg-teal-700 text-white px-4 py-3 rounded-md"
          >
            Women in Entrepreneurship
          </Link>

          <Link
            href={`program/400`}
            className="bg-teal-600 text-white px-4 py-3 rounded-md"
          >
            Seed
          </Link>

          <Link
            href={`program/600`}
            className="bg-slate-600 text-white px-4 py-3 rounded-md"
          >
            Entrepreneurship Association
          </Link>

          <Link
            href={`program/500`}
            className="bg-slate-500 text-white px-4 py-3 rounded-md"
          >
            Seed Launchpad - Bright Bulding
          </Link>

          <Link
            href={`program/501`}
            className="bg-slate-500 text-white px-4 py-3 rounded-md"
          >
            Seed Launchpad - TNRB
          </Link>

          <Link
            href={`program/800`}
            className="bg-slate-400 text-white px-4 py-3 rounded-md"
          >
            Graduate Entrepreneurship Association
          </Link>
        </div>
      </div>
    </>
  );
}
