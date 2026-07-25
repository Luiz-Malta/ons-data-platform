-- Populate the fact table. Translates ONS natural keys into surrogate keys
-- via JOIN, at the verified grain (one row per plant per hour).
-- NULL generation is excluded: absence of a fact is not a fact.

INSERT INTO warehouse.fato_geracao (tempo_sk, usina_sk, val_geracao)
SELECT
    dt.tempo_sk,
    du.usina_sk,
    s.val_geracao::NUMERIC
FROM staging.geracao_usina s
JOIN warehouse.dim_tempo  dt ON dt.din_instante = s.din_instante::TIMESTAMP
JOIN warehouse.dim_usina  du ON du.id_ons       = s.id_ons
WHERE s.val_geracao IS NOT NULL;
