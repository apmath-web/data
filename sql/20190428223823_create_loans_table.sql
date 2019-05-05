-- migrate:up
CREATE TABLE "loans" (
    "id"                     SERIAL    NOT NULL,
    "client_id"              INT       NOT NULL,
    "application_id"         INT       NOT NULL,
    "amount"                 BIGINT    NOT NULL,
    "term"                   INT       NOT NULL,
    "interest"               INT       NOT NULL,
    "currency"               TEXT      NOT NULL,
    "date"                   TIMESTAMP NOT NULL,
    "completed"              BOOLEAN   NOT NULL,
    "rounding"               INT       NOT NULL,
    "regular_payment_amount" BIGINT    NOT NULL,
    "remaining_term"         INT       NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (client_id) REFERENCES clients (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    -- TODO set FK after created applications table
    -- FOREIGN KEY (application_id) REFERENCES applications (id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT loans_rounding_check CHECK ("rounding" IN (1, 10, 100)),
    UNIQUE ("application_id")
);

-- migrate:down
DROP TABLE "loans";
