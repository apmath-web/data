-- migrate:up
ALTER TABLE clients ADD COLUMN "first_name"     TEXT NOT NULL;
ALTER TABLE clients ADD COLUMN "last_name"      TEXT NOT NULL;
ALTER TABLE clients ADD COLUMN "birth_date"     TEXT NOT NULL;
ALTER TABLE clients ADD COLUMN "sex"            TEXT NOT NULL;
ALTER TABLE clients ADD COLUMN "marital_status" TEXT NOT NULL;
ALTER TABLE clients ADD COLUMN "children"       INT  NOT NULL;
ALTER TABLE clients ADD CONSTRAINT sex_is_correct CHECK ("sex" IN ('male', 'female'));
ALTER TABLE clients ADD CONSTRAINT marital_status_is_correct CHECK ("marital_status" IN ('single', 'married'));
ALTER TABLE clients ADD CONSTRAINT children_number_positive CHECK ("children" >= 0);

-- migrate:down
ALTER TABLE clients DROP COLUMN "first_name";
ALTER TABLE clients DROP COLUMN "last_name";
ALTER TABLE clients DROP COLUMN "birth_date";
ALTER TABLE clients DROP COLUMN "sex";
ALTER TABLE clients DROP COLUMN "marital_status";
ALTER TABLE clients DROP COLUMN "children";
ALTER TABLE clients DROP CONSTRAINT children_number_positive;
ALTER TABLE clients DROP CONSTRAINT marital_status_is_correct;
ALTER TABLE clients DROP CONSTRAINT sex_is_correct;
