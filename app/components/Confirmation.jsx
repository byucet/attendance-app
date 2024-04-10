"use client";
import Link from "next/link";
import { useEffect, useState } from "react";

export default function Confirmation() {
  const [name, setName] = useState("");
  useEffect(() => {
    if (typeof window === "undefined" || !window.localStorage) return;

    const name = localStorage.getItem("firstName") || "Guest ";
    setName(name);
  }, []);

  return (
    <>
      <div className="text-xl mt-4">
        Thanks for coming,{" "}
        <span className="font-bold text-orange-600">{`${name}`}</span>. Your
        attendance is confirmed
      </div>
      <p className="py-4 text-gray-600">
        Not you? Click{" "}
        <Link
          className="text-orange-500"
          href="/"
          onClick={() => {
            localStorage.setItem("netid", "");
          }}
        >
          here
        </Link>{" "}
        to correct the entry
      </p>
    </>
  );
}
