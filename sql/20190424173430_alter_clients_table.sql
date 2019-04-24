-- migrate:up
ALTER TABLE clients ADD COLUMN "first_name"     TEXT NOT NULL;
ALTER TABLE clients ADD COLUMN "last_name"      TEXT NOT NULL;
ALTER TABLE clients ADD COLUMN "birth_date"     TEXT NOT NULL;
ALTER TABLE clients ADD COLUMN "sex"            TEXT NOT NULL;
ALTER TABLE clients ADD COLUMN "marital_status" TEXT NOT NULL;
ALTER TABLE clients ADD COLUMN "children"       INT  NOT NULL;


-- migrate:down
ALTER TABLE clients DROP COLUMN "first_name";
ALTER TABLE clients DROP COLUMN "last_name";
ALTER TABLE clients DROP COLUMN "birth_date";
ALTER TABLE clients DROP COLUMN "sex";
ALTER TABLE clients DROP COLUMN "marital_status";
ALTER TABLE clients DROP COLUMN "children";
