-- migrate:up
CREATE TABLE "jobs" (
    "id"        SERIAL  NOT NULL,
    "name"      TEXT    NOT NULL,
    "wage"      INT     NOT NULL,
    "client_id" INT     NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (client_id) REFERENCES clients (id) ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE ("name", "wage", "client_id")
);

-- migrate:down
DROP TABLE "jobs";
