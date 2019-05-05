-- migrate:up
CREATE TABLE "payments" (
    "id"                  SERIAL    NOT NULL,
    "date"                TIMESTAMP NOT NULL,
    "amount"              BIGINT    NOT NULL,
    "percent"             INT       NOT NULL,
    "body"                BIGINT    NOT NULL,
    "type"                TEXT      NOT NULL,
    "remain_credit_body"  BIGINT    NOT NULL,
    "full_early_repayment" BIGINT    NOT NULL,
    CONSTRAINT payments_type_check CHECK ("type" IN ('regular', 'early')),
    PRIMARY KEY (id)
);

-- migrate:down
DROP TABLE "payments";
