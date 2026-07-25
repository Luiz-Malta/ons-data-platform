-- Generation fact table. Grain: one row per plant per hour
-- (verified over 490,992 source rows — see ADR 0005).
-- Links to dimensions by surrogate key, never by ONS natural keys.

CREATE TABLE IF NOT EXISTS warehouse.fato_geracao (
    tempo_sk      INT NOT NULL REFERENCES warehouse.dim_tempo (tempo_sk),
    usina_sk      INT NOT NULL REFERENCES warehouse.dim_usina (usina_sk),
    val_geracao   NUMERIC(18, 8) NOT NULL,
    PRIMARY KEY (tempo_sk, usina_sk)
);