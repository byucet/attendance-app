// "use client";

// import useSWR from 'swr';
// import { useState, useEffect } from 'react';
// import { EventSelector, DateSelector } from '../components/EventSelector'; // Adjust path if necessary
// import PasswordForm from '../components/PasswordForm'; // Adjust path if necessary

// const fetcher = (url) => fetch(url).then((res) => res.json());

// const AttendancePage = () => {
//   const [authenticated, setAuthenticated] = useState(false);
//   const [selectedEventId, setSelectedEventId] = useState(null);
//   const [selectedDate, setSelectedDate] = useState(new Date().toISOString().split('T')[0]); // Default to today's date
//   const [attendance, setAttendance] = useState(null); // Initialize with null

//   const { data, error, mutate } = useSWR(
//     selectedEventId && selectedDate
//       ? `/api/attendance?eventId=${selectedEventId}&date=${selectedDate}`
//       : null,
//     fetcher,
//     { refreshInterval: 5000 } // Revalidate every 5 seconds
//   );

//   // Update attendance state when new data is fetched
//   useEffect(() => {
//     if (data) {
//       setAttendance(data);
//     } else {
//       setAttendance([]);
//     }
//   }, [data]);

//   // Clear attendance data when event or date changes
//   useEffect(() => {
//     setAttendance(null); // Set to null to trigger loading state
//   }, [selectedEventId, selectedDate]);

//   const handlePasswordSubmit = async (password) => {
//     const response = await fetch('/api/checkPassword', {
//       method: 'POST',
//       headers: {
//         'Content-Type': 'application/json',
//       },
//       body: JSON.stringify({ password }),
//     });

//     if (response.ok) {
//       setAuthenticated(true);
//     } else {
//       alert('Incorrect password');
//     }
//   };

//   if (!authenticated) {
//     return <PasswordForm onPasswordSubmit={handlePasswordSubmit} />;
//   }

//   if (error) return <div>Failed to load attendance data</div>;

//   return (
//     <div className="p-4">
//       <h1 className="text-2xl font-bold mb-4 text-center">Attendance List</h1>
//       <EventSelector onEventChange={setSelectedEventId} />
//       <DateSelector selectedDate={selectedDate} onDateChange={setSelectedDate} />
//       {selectedEventId && selectedDate && (
//         <div className="overflow-x-auto mt-4">
//           {attendance === null ? (
//             <div>Loading...</div>
//           ) : attendance.length > 0 ? (
//             <div className="overflow-y-auto max-h-96">
//               <table className="min-w-full bg-white relative">
//                 <thead className="sticky top-0 bg-white shadow">
//                   <tr>
//                     <th className="py-2 px-4 border text-center">Name</th>
//                     <th className="py-2 px-4 border text-center">Time Attended</th>
//                   </tr>
//                 </thead>
//                 <tbody>
//                   {attendance.map((entry) => (
//                     <tr key={`${entry.eventId}-${entry.personID}-${entry.TimeAttended}`} className="border-t">
//                       <td className="py-2 px-4 border">
//                         {entry.Person.FirstName} {entry.Person.LastName}
//                       </td>
//                       <td className="py-2 px-4 border">{new Date(entry.TimeAttended).toLocaleString()}</td>
//                     </tr>
//                   ))}
//                 </tbody>
//               </table>
//             </div>
//           ) : (
//             <p className="mt-4">No attendance records found for the selected date.</p>
//           )}
//           <p className="mt-4">Number of Attendances: {attendance ? attendance.length : 0}</p>
//         </div>
//       )}
//     </div>
//   );
// };

// export default AttendancePage;

"use client";
// import { useRouter } from 'next/router';
import useSWR from 'swr';
import Link from "next/link";
import { useState, useEffect } from 'react';
import { EventSelector, DateSelector } from '../components/EventSelector'; // Adjust path if necessary
import PasswordForm from '../components/PasswordForm'; // Adjust path if necessary

const fetcher = (url) => fetch(url).then((res) => res.json());

const AttendancePage = () => {
  // const router = useRouter();
  const [authenticated, setAuthenticated] = useState(false);
  const [selectedEventId, setSelectedEventId] = useState(null);
  const [selectedDate, setSelectedDate] = useState(new Date().toISOString().split('T')[0]); // Default to today's date
  const [attendance, setAttendance] = useState(null); // Initialize with null

  const { data, error, isValidating } = useSWR(
    selectedEventId && selectedDate
      ? `/api/attendance?eventId=${selectedEventId}&date=${selectedDate}`
      : null,
    fetcher,
    { refreshInterval: 5000 } // Revalidate every 5 seconds
  );

  // Update attendance state when new data is fetched
  useEffect(() => {
    // console.log('data',data);
    if (data) {
      setAttendance(data);
      // console.log(data);
    } else if (!isValidating) {
      setAttendance([]);
    }
  }, [data, isValidating]);

  // Clear attendance data when event or date changes
  useEffect(() => {
    setAttendance(null); // Set to null to trigger loading state
  }, [selectedEventId, selectedDate]);

  const handlePasswordSubmit = async (password) => {
    const response = await fetch('/api/checkPassword', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ password }),
    });

    if (response.ok) {
      setAuthenticated(true);
    } else {
      alert('Incorrect password');
    }
  };

  if (!authenticated) {
    return <PasswordForm onPasswordSubmit={handlePasswordSubmit} />;
  }

  if (error) return <div>Failed to load attendance data</div>;

  return (
    <div className="p-4">
      <Link
            href={`/ `}
            className="bg-teal-900 text-white px-4 py-3 rounded-md"
          >
            Back
          </Link>
      <h1 className="text-2xl font-bold mb-4 text-center">Attendance List</h1>
      <EventSelector onEventChange={setSelectedEventId} />
      <DateSelector selectedDate={selectedDate} onDateChange={setSelectedDate} />
      {selectedEventId && selectedDate && (
        <div className="overflow-x-auto mt-4">
          {attendance === null ? (
            <div>Loading...</div>
          ) : attendance.length > 0 ? (
            <div className="overflow-y-auto max-h-96">
              <table className="min-w-full bg-white relative">
                <thead className="sticky top-0 bg-white shadow">
                  <tr>
                    <th className="py-2 px-4 border text-center">Name</th>
                    <th className="py-2 px-4 border text-center">NetID</th>
                    <th className="py-2 px-4 border text-center">Time Attended</th>
                  </tr>
                </thead>
                <tbody>
                  {attendance.map((entry) => {
                    // console.log('entry:', entry); // Log to inspect the entire entry object
                    // console.log('entry.Person:', entry.Person); // Log to inspect the Person object
                    return (
                      <tr key={`${entry.eventId}-${entry.personID}-${entry.TimeAttended}`} className="border-t">
                        <td className="py-2 px-4 border">
                          {entry.Person.firstName} {entry.Person.lastName}
                        </td>
                        <td className="py-2 px-4 border">{entry.Person.netId}</td>
                        <td className="py-2 px-4 border">{new Date(entry.TimeAttended).toLocaleString()}</td>
                      </tr>
                    );
                  })}
                </tbody>
              </table>
            </div>
          ) : (
            <p className="mt-4">No attendance records found for the selected date.</p>
          )}
          <p className="mt-4">Number of Attendances: {attendance ? attendance.length : 0}</p>
        </div>
      )}
    </div>
  );
};

export default AttendancePage;
