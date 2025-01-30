CREATE TABLE IF NOT EXISTS app_data (
  id SERIAL PRIMARY KEY,
  counter INT DEFAULT 0
);

-- Initialize counter with value 0
INSERT INTO app_data (counter) VALUES (0) ON CONFLICT (id) DO NOTHING;
