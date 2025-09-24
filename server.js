const express = require('express');
const fs = require('fs');
const path = require('path');
const bodyParser = require('body-parser');
const { Pool } = require('pg');
const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(bodyParser.json());

// Serve static frontend
app.use(express.static(path.join(__dirname, 'public')));

// Serve input JSON files
app.use('/input', express.static(path.join(__dirname, 'input')));

// Serve output folder (for history.json)
app.use('/output', express.static(path.join(__dirname, 'output')));

// ============================
// 🔹 Postgres Connection Setup
// ============================
const pool = new Pool({
  host: process.env.DB_HOST || 'db',
  user: process.env.DB_USER || 'teamuser',
  password: process.env.DB_PASSWORD || 'teampass',
  database: process.env.DB_NAME || 'teamdb',
  port: 5432,
});

// Test DB connection on startup
pool.connect()
  .then(client => {
    console.log('✅ Connected to Postgres');
    client.release();
  })
  .catch(err => console.error('❌ Postgres connection error:', err.stack));

// ============================
// 🔹 API Endpoints
// ============================

// Save history.json (your existing feature)
app.post('/save-history', (req, res) => {
  const historyPath = path.join(__dirname, 'output', 'history.json');
  const json = JSON.stringify(req.body, null, 2);

  fs.writeFile(historyPath, json, 'utf8', (err) => {
    if (err) {
      console.error('Error saving history.json:', err);
      res.status(500).send('Failed to save history.json');
    } else {
      console.log('History successfully saved.');
      res.status(200).send('Saved');
    }
  });
});


app.get('/db-time', async (req, res) => {
  try {
    const result = await pool.query('SELECT NOW() as now');
    res.json({ time: result.rows[0].now });
  } catch (err) {
    console.error('DB error:', err);
    res.status(500).send('Database error');
  }
});

// Start server
app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});
