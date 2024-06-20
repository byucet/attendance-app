// import { useEffect, useState } from 'react';

// const EventSelector = ({ onEventChange }) => {
//   const [events, setEvents] = useState([]);

//   useEffect(() => {
//     const fetchEvents = async () => {
//       const res = await fetch('/api/events');
//       const data = await res.json();
//       setEvents(data);
//     };

//     fetchEvents();
//   }, []);

//   const handleChange = (event) => {
//     const eventId = Number(event.target.value);
//     onEventChange(eventId);
//   };

//   const formatEventName = (name) => {
//     return name.replace(/ Attendance$/, ''); // Remove " Attendance" if it exists
//   };

//   return (
//     <select onChange={handleChange}>
//       {events.map((event) => (
//         <option key={event.eventID} value={event.eventID}>
//           {formatEventName(event.EventName)}
//         </option>
//       ))}
//     </select>
//   );
// };

// export default EventSelector;


import { useEffect, useState } from 'react';

const EventSelector = ({ onEventChange }) => {
  const [events, setEvents] = useState([]);

  useEffect(() => {
    const fetchEvents = async () => {
      const res = await fetch('/api/events');
      const data = await res.json();
      setEvents(data);
    };

    fetchEvents();
  }, []);

  const handleEventChange = (event) => {
    const eventId = Number(event.target.value);
    onEventChange(eventId);
  };

  return (
    <div className="mb-4">
      <label className="block text-gray-700 text-sm font-bold mb-2" htmlFor="event">
        Select Event
      </label>
      <select
        id="event"
        onChange={handleEventChange}
        className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
      >
        <option value="">Select an event</option>
        {events.map((event) => (
          <option key={event.eventID} value={event.eventID}>
            {event.EventName.replace(/ Attendance$/, '')}
          </option>
        ))}
      </select>
    </div>
  );
};

// const DateSelector = ({ selectedDate, onDateChange }) => {
//   const handleDateChange = (event) => {
//     onDateChange(event.target.value);
//   };

//   return (
//     <div className="mb-4">
//       <label className="block text-gray-700 text-sm font-bold mb-2" htmlFor="date">
//         Select Date
//       </label>
//       <input
//         type="date"
//         id="date"
//         value={selectedDate}
//         onChange={handleDateChange}
//         className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
//       />
//     </div>
//   );
// };

// export { EventSelector, DateSelector };

// const DateRangeSelector = ({ dateRange, onDateRangeChange }) => {
//   const handleStartDateChange = (event) => {
//     onDateRangeChange({ ...dateRange, startDate: event.target.value });
//   };

//   const handleEndDateChange = (event) => {
//     onDateRangeChange({ ...dateRange, endDate: event.target.value });
//   };

//   return (
//     <div className="mb-4">
//       <label className="block text-gray-700 text-sm font-bold mb-2" htmlFor="start-date">
//         Select Start Date
//       </label>
//       <input
//         type="date"
//         id="start-date"
//         value={dateRange.startDate}
//         onChange={handleStartDateChange}
//         className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
//       />
//       <label className="block text-gray-700 text-sm font-bold mb-2 mt-4" htmlFor="end-date">
//         Select End Date
//       </label>
//       <input
//         type="date"
//         id="end-date"
//         value={dateRange.endDate}
//         onChange={handleEndDateChange}
//         className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
//       />
//     </div>
//   );
// };

 const DateRangeSelector = ({ dateRange, onDateRangeChange }) => {
  const handleStartDateChange = (e) => {
    onDateRangeChange({ ...dateRange, startDate: e.target.value });
  };

  const handleEndDateChange = (e) => {
    onDateRangeChange({ ...dateRange, endDate: e.target.value });
  };

  return (
    <div className="flex space-x-4">
      <div>
        <label htmlFor="startDate" className="block text-sm font-medium text-gray-700">
          Start Date
        </label>
        <input
          type="date"
          id="startDate"
          value={dateRange.startDate}
          onChange={handleStartDateChange}
          className="mt-1 block w-full border border-gray-300 rounded-md shadow-sm"
        />
      </div>
      <div>
        <label htmlFor="endDate" className="block text-sm font-medium text-gray-700">
          End Date
        </label>
        <input
          type="date"
          id="endDate"
          value={dateRange.endDate}
          onChange={handleEndDateChange}
          className="mt-1 block w-full border border-gray-300 rounded-md shadow-sm"
        />
      </div>
    </div>
  );
};

export { EventSelector, DateRangeSelector };

