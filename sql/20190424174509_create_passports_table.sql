-- migrate:up
CREATE TABLE "passports" (
    "id"        SERIAL  NOT NULL,
    "series"    INT     NOT NULL,
    "number"    INT     NOT NULL,
    "client_id" INT     NOT NULL UNIQUE,
    PRIMARY KEY (id),
    FOREIGN KEY (client_id) REFERENCES clients (id) ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE ("series", "number")
);

-- migrate:down
DROP TABLE "passports";
