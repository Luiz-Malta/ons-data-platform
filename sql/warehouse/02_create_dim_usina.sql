-- Plant dimension. Star schema: state and subsystem are flattened in
-- (denormalized) rather than split into separate tables. ONS natural keys
-- (id_ons, ceg) are kept as descriptive attributes, NOT as the primary key,
-- because they proved unreliable (see the Paraguay anomaly, ADR 0005).

CREATE TABLE IF NOT EXISTS warehouse.dim_usina (
    usina_sk                INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_usina               TEXT NOT NULL,
    nom_tipousina           TEXT,
    nom_tipocombustivel     TEXT,
    cod_modalidadeoperacao  TEXT,
    nom_estado              TEXT,
    nom_subsistema          TEXT,
    id_ons                  TEXT,
    ceg                     TEXT
);