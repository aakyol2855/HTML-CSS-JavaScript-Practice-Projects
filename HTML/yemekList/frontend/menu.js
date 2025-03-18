import React, { useState, useEffect } from "react";
import axios from "axios";

const Menu = () => {
  const [menu, setMenu] = useState([]);
  const [date, setDate] = useState("2024-12-02");

  useEffect(() => {
    axios.get(`http://localhost:5000/menu/${date}`).then((response) => {
      setMenu(response.data);
    });
  }, [date]);

  return (
    <div>
      <h2>Günün Menüsü</h2>
      <ul>
        {menu.map((item) => (
          <li key={item.id}>
            <strong>{item.dish_name}</strong> - {item.calories} kcal
          </li>
        ))}
      </ul>
    </div>
  );
};

export default Menu;
