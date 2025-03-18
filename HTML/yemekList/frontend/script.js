document.getElementById('submitComment').addEventListener('click', () => {
    const comment = document.querySelector('textarea').value;
  
    fetch('http://localhost:5000/add-comment', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ comment }),
    })
      .then((res) => res.text())
      .then((data) => alert(data))
      .catch((err) => console.error(err));
  });
  
  document.getElementById('balance').addEventListener('click', () => {
    const userId = prompt('Enter your User ID:');
    fetch(`http://localhost:5000/balance/${userId}`)
      .then((res) => res.json())
      .then((data) => alert(`Your balance is: ${data.balance}`))
      .catch((err) => console.error(err));
  });
  
  document.getElementById('makeReservation').addEventListener('click', () => {
    const userId = prompt('Enter your User ID:');
    const menuId = prompt('Enter the Menu ID:');
    const mealType = prompt('Enter Meal Type (Lunch/Dinner):');
  
    fetch('http://localhost:5000/reservation', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ userId, menuId, mealType }),
    })
      .then((res) => res.text())
      .then((data) => alert(data))
      .catch((err) => console.error(err));
  });
  