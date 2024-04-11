"use client";
import Link from "next/link";

export default function Page({ params }) {
  const orgID = params.id;

  const handleSubmit = () => {};

  return (
    <>
      <div className="h-full flex flex-col justify-center items-center">
        <h1 className="text-3xl font-bold"> Register!</h1>
        <div className="text-info my-4">
          Thanks for joining us! Please enter your information below.
        </div>
        <div id="box" className="flex flex-col w-full md:w-2/3">
          <div id="netid-message" className=""></div>
          <form onSubmit={handleSubmit}>
            <label htmlFor="first-name" className="block mb-2">
              First Name:
            </label>
            <input
              id="first-name"
              type="text"
              placeholder="eg. Albert"
              className="w-full border border-gray-300 rounded-3xl py-3 px-4 mb-4"
            />
            <label htmlFor="last-name" className="block mb-2">
              Last Name:
            </label>
            <input
              id="last-name"
              type="text"
              placeholder="eg. Einstein"
              className="w-full border border-gray-300 rounded-3xl py-3 px-4 mb-4"
            />
            <label htmlFor="first-name" className="block mb-2">
              NetID:
            </label>
            <input
              id="first-name"
              type="text"
              placeholder="eg. aeisntein123"
              className="w-full border border-gray-300 rounded-3xl py-3 px-4 mb-4"
            />
            <button
              type="submit" // Changed to type="submit" for the submit button
              className="my-2 block bg-teal-700 w-1/3 text-white py-3 px-4 rounded-3xl"
            >
              Submit
            </button>
            <Link
              className="my-2 block text-center bg-gray-400 w-1/3 text-white py-3 px-4 rounded-3xl"
              href={`/program/${orgID}`}
            >
              Go Back
            </Link>{" "}
          </form>
        </div>
      </div>
    </>
  );
}
