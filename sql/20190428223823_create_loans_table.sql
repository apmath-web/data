-- migrate:up
CREATE TABLE "loans" (
    "id"                   SERIAL  NOT NULL,
    "client_id"            INT     NOT NULL,
    "application_id"       INT     NOT NULL,
    "amount"               INT     NOT NULL,
    "term"                 INT     NOT NULL,
    "interest"             INT     NOT NULL,
    "currency"             TEXT    NOT NULL,
    "date"                 TEXT    NOT NULL,
    "completed"            BOOLEAN NOT NULL,
    "rounding"             INT     NOT NULL,
    "regularPaymentAmount" INT     NOT NULL,
    "remainingTerm"        INT     NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (client_id) REFERENCES clients (id) ON DELETE CASCADE ON UPDATE CASCADE,
    -- TODO set FK after created applications table
    -- FOREIGN KEY (application_id) REFERENCES applications (id) ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE ("application_id")
);

-- migrate:down
DROP TABLE "loans";
