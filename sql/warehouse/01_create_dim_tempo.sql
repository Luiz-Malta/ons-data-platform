-- Time dimension. Generated, not extracted from the source data:
-- it must contain every hour of the period, including hours with no generation.
-- See docs/decisions/0005-dimensional-model.md

CREATE SCHEMA IF NOT EXISTS warehouse;

CREATE TABLE IF NOT EXISTS warehouse.dim_tempo (
    tempo_sk      INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    din_instante  TIMESTAMP    NOT NULL UNIQUE,
    data          DATE         NOT NULL,
    ano           SMALLINT     NOT NULL,
    mes           SMALLINT     NOT NULL,
    dia           SMALLINT     NOT NULL,
    hora          SMALLINT     NOT NULL,
    dia_semana    SMALLINT     NOT NULL,
    nome_dia      TEXT         NOT NULL
);