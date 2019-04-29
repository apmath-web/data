-- migrate:up
CREATE TABLE "payments" (
    "id"                 SERIAL NOT NULL,
    "date"               TEXT   NOT NULL,
    "amount"             INT    NOT NULL,
    "percent"            INT    NOT NULL,
    "body"               INT    NOT NULL,
    "type"               TEXT   NOT NULL,
    "remainCreditBody"   INT    NOT NULL,
    "fullEarlyRepayment" INT    NOT NULL,
    CONSTRAINT type_is_correct CHECK ("type" IN ('regular', 'early')),
    PRIMARY KEY (id)
);

-- migrate:down
DROP TABLE "payments";
