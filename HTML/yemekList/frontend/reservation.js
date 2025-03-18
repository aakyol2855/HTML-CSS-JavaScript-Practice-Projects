import React, { useState } from "react";
import axios from "axios";

const Reservation = () => {
  const [userId, setUserId] = useState("");
  const [menuId, setMenuId] = useState("");
  const [mealType, setMealType] = useState("");

  const handleSubmit = (e) => {
    e.preventDefault();
    axios.post("http://localhost:5000/reservation", {
      userId,
      menuId,
      mealType,
    }).then(() => {
      alert("Reservation Successful!");
    }).catch((err) => {
      console.error(err);
    });
  };

  return (
    <form onSubmit={handleSubmit}>
      <input
        type="text"
        placeholder="User ID"
        value={userId}
        onChange={(e) => setUserId(e.target.value)}
      />
      <input
        type="text"
        placeholder="Menu ID"
        value={menuId}
        onChange={(e) => setMenuId(e.target.value)}
      />
      <select value={mealType} onChange={(e) => setMealType(e.target.value)}>
        <option value="">Select Meal Type</option>
        <option value="Lunch">Lunch</option>
        <option value="Dinner">Dinner</option>
      </select>
      <button type="submit">Make Reservation</button>
    </form>
  );
};

export default Reservation;
