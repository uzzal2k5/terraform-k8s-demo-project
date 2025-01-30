const express = require('express');
const { Pool } = require('pg');
const cors = require('cors');

const app = express();
const port = 3000;

// Enable CORS
app.use(cors());

// PostgreSQL Pool
const pool = new Pool({
  user: 'postgres',
  host: 'db',
  database: 'counterdb',
  password: 'password',
  port: 5432,
});

// Initialize the counter
app.get('/counter', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM app_data LIMIT 1');
    res.json(result.rows[0] || { counter: 0 });
  } catch (error) {
    console.error('Error fetching counter:', error);
    res.status(500).send('Error fetching counter');
  }
});

// Increment the counter
app.get('/increment', async (req, res) => {
  try {
    await pool.query('UPDATE app_data SET counter = counter + 1 WHERE id = 1');
    const result = await pool.query('SELECT counter FROM app_data WHERE id = 1');
    res.json({ counter: result.rows[0].counter });
  } catch (error) {
    console.error('Error incrementing counter:', error);
    res.status(500).send('Error incrementing counter');
  }
});

app.listen(port, () => {
  console.log(`Backend listening at http://localhost:${port}`);
});
