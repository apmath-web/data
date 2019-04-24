-- migrate:up
CREATE TABLE clients (
  id SERIAL PRIMARY KEY
);

-- migrate:down
DROP TABLE clients;
