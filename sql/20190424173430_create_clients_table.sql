-- migrate:up
CREATE TABLE "clients" (
    "id"                SERIAL  NOT NULL,
    "first_name"        TEXT     NOT NULL,
    "last_name"         TEXT     NOT NULL,
    "birth_date"        TEXT    NOT NULL,
    "sex"               TEXT    NOT NULL,
    "marital_status"    TEXT    NOT NULL,
    "children"          INT     NOT NULL,
    PRIMARY KEY (id)
);

-- migrate:down
DROP TABLE "clients";
