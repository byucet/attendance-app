"use client";
import { useRef, useEffect } from "react";
import { useRouter } from "next/navigation";
import Link from "next/link";

export default function Form({ orgID, orgName }) {
  const netidRef = useRef(null);
  const router = useRouter();

  useEffect(() => {
    // check if user is already in local storage
    const firstName = localStorage.getItem("firstName");
    const netid = localStorage.getItem("netid");
    const personID = localStorage.getItem("personID");

    if (firstName && netid && personID) {
      netidRef.current.value = netid;
      handleSubmit();
    }
  });

  async function handleSubmit(event) {
    if (event) event.preventDefault();
    const netid = netidRef.current.value;

    try {
      // see if user is in database
      const response = await fetch(`/api/user/${netid}`);
      const data = await response.json();

      // if user is in database, create attendance, add to local
      if (response.ok) {
        const { personID, FirstName } = data.message;
        const body = { personID, FirstName, netid, orgID };

        await fetch(`/api/attendance`, {
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
      }
      // if user is not in database, redirect to signup
      else {
        console.log("User not found!");
        router.push("/program/confirmation/new");
      }
    } catch (error) {
      console.error("Error occurred:", error);
    }
  }

  return (
    <>
      <h1 className="text-3xl font-bold">{orgName} Event!</h1>
      <div className="text-info my-4">
        Thanks for joining us! Please enter your information below.
      </div>
      <div id="box" className="flex flex-col w-2/3">
        <div id="netid-message" className=""></div>
        <form onSubmit={handleSubmit}>
          <label htmlFor="netid" className="block mb-2">
            Net ID:
          </label>
          <input
            id="netid"
            type="text"
            placeholder="eg. aeinstein123"
            pattern="^[a-zA-Z][a-zA-Z0-9]*$"
            className="w-full border border-gray-300 rounded-3xl py-3 px-4 mb-4"
            autoCorrect="off"
            required
            ref={netidRef}
          />
          <button
            type="submit"
            className="button bg-teal-700 w-1/3 text-white py-3 px-4 rounded-3xl"
          >
            Submit
          </button>
        </form>

        <div className="text-info mt-4">
          First time attending a Rollins Center event?{" "}
          <Link
            className="text-teal-500 cursor-pointer"
            href={`/program/${orgID}/signup`}
          >
            Register
          </Link>{" "}
          to continue!
        </div>
      </div>
    </>
  );
}
