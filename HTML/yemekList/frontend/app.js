import React from "react";
import Menu from "./components/Menu";
import Reservation from "./components/Reservation";

function App() {
  return (
    <div>
      <header>
        <h1>Erzurum Teknik Üniversitesi Yemek Listesi</h1>
      </header>
      <main>
        <Menu />
        <Reservation />
      </main>
    </div>
  );
}

export default App;
