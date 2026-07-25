-- Staging layer: raw ONS generation data, as-is.
-- All columns are TEXT by design: staging receives, it does not validate.
-- Type casting happens on the way to the warehouse.

CREATE SCHEMA IF NOT EXISTS staging;

CREATE TABLE IF NOT EXISTS staging.geracao_usina (
    din_instante            TEXT,
    id_subsistema           TEXT,
    nom_subsistema          TEXT,
    id_estado               TEXT,
    nom_estado              TEXT,
    cod_modalidadeoperacao  TEXT,
    nom_tipousina           TEXT,
    nom_tipocombustivel     TEXT,
    nom_usina               TEXT,
    id_ons                  TEXT,
    ceg                     TEXT,
    val_geracao             TEXT
);