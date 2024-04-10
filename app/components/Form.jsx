"use client";

export default function Form(program) {
  const { orgID, orgName } = program;

  return (
    <>
      <h1 className="text-3xl font-bold">{orgName} Event!</h1>
      <div id="box" className="flex flex-col w-2/3">
        <div className="text-info my-4">
          Thanks for joining us! Please enter your information below.
        </div>
        <div id="netid-message" className=""></div>
        <label htmlFor="netid" className="block mb-2">
          Net ID:
        </label>
        <input
          id="netid"
          type="text"
          placeholder="eg. aeinstein123"
          className="w-full border border-gray-300 rounded-3xl py-3 px-4 mb-4"
          autoCorrect="off"
        />

        <button className="button bg-teal-700 w-1/3 text-white py-3 px-4 rounded-3xl">
          Submit
        </button>

        <div className="text-info mt-4">
          If this is your first time attending, check your byu email for a
          confirmation email. We&apos;re excited to have you join us!
        </div>
      </div>
    </>
  );
}