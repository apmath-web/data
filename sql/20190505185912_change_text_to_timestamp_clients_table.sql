-- migrate:up
ALTER TABLE clients ALTER COLUMN "birth_date" TYPE DATE
    USING to_date("birth_date", 'YYYY-MM-DD');
