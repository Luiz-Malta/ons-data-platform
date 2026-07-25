-- Populate the plant dimension: one row per distinct plant, pulled from staging.
-- Attributes taken with MAX() to collapse any per-hour repetition into one value.

INSERT INTO warehouse.dim_usina
    (nom_usina, nom_tipousina, nom_tipocombustivel, cod_modalidadeoperacao, nom_estado, nom_subsistema, id_ons, ceg)
SELECT
    MAX(nom_usina),
    MAX(nom_tipousina),
    MAX(nom_tipocombustivel),
    MAX(cod_modalidadeoperacao),
    MAX(nom_estado),
    MAX(nom_subsistema),
    id_ons,
    MAX(ceg)
FROM staging.geracao_usina
GROUP BY id_ons;