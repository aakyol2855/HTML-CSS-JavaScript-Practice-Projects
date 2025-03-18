// Import required modules
const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

// Database connection
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root', // Your MySQL username
  password: '2855', // Your MySQL password
  database: 'yemek_rezervasyon', // Your database name
});

app.get("/", (req, res) => {
  res.send("API is running!");
});


db.connect((err) => {
  if (err) {
    console.error('Database connection error:', err);
    return;
  }
  console.log('Connected to the MySQL database.');
});

// Routes
// Get menu for a specific date
app.get('/menu/:date', (req, res) => {
  const date = req.params.date;
  const query = 'SELECT * FROM menu WHERE menu_date = ?';

  db.query(query, [date], (err, results) => {
    if (err) {
      res.status(500).send('Database query error');
    } else {
      res.json(results);
    }
  });
});

// Post reservation
app.post('/reservation', (req, res) => {
  const { userId, menuId, mealType } = req.body;
  const query = 'INSERT INTO reservations (user_id, menu_id, meal_type) VALUES (?, ?, ?)';

  db.query(query, [userId, menuId, mealType], (err) => {
    if (err) {
      res.status(500).send('Reservation error');
    } else {
      res.send('Reservation successful');
    }
  });
});

// Check balance
app.get('/balance/:userId', (req, res) => {
  const userId = req.params.userId;
  const query = 'SELECT balance FROM users WHERE user_id = ?';

  db.query(query, [userId], (err, results) => {
    if (err) {
      res.status(500).send('Database query error');
    } else {
      res.json(results[0]);
    }
  });
});

// Start server
const PORT = 5000;
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});

app.post('/add-comment', (req, res) => {
  const { comment } = req.body;
  const query = 'INSERT INTO comments (comment_text) VALUES (?)';

  db.query(query, [comment], (err) => {
    if (err) {
      res.status(500).send('Error saving comment');
    } else {
      res.send('Comment saved successfully');
    }
  });
});
