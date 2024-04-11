"use client";
import Link from "next/link";
import { useRef } from "react";
import { useRouter } from "next/navigation";

export default function Page({ params }) {
  const netidRef = useRef(null);
  const firstNameRef = useRef(null);
  const lastNameRef = useRef(null);
  const orgID = params.id;
  const router = useRouter();

  async function handleSubmit(event) {
    if (event) event.preventDefault();

    try {
      const body = {
        firstName: firstNameRef.current.value,
        lastName: lastNameRef.current.value,
        netid: netidRef.current.value,
        orgID: orgID,
      };

      await fetch(`/api/user`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(body),
      })
        .then((response) => response.json())
        .then((data) => {
          console.log(data);
          localStorage.setItem("firstName", data.data.firstName);
          localStorage.setItem("netid", data.data.netid);
          localStorage.setItem("personID", data.data.personID);
        });

      router.push("/program/confirmation");
    } catch (error) {
      // if user is not in database, redirect to signup

      console.error("Error occurred:", error);
    }
  }

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
              required
              ref={firstNameRef}
            />
            <label htmlFor="last-name" className="block mb-2">
              Last Name:
            </label>
            <input
              id="last-name"
              type="text"
              placeholder="eg. Einstein"
              className="w-full border border-gray-300 rounded-3xl py-3 px-4 mb-4"
              required
              ref={lastNameRef}
            />
            <label htmlFor="first-name" className="block mb-2">
              NetID:
            </label>
            <input
              id="first-name"
              type="text"
              placeholder="eg. aeinstein123"
              pattern="^[a-zA-Z][a-zA-Z0-9]*$"
              className="w-full border border-gray-300 rounded-3xl py-3 px-4 mb-4"
              required
              ref={netidRef}
            />
            <button
              type="submit"
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
