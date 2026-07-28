# 0005 - Data model: Star schema

**Status:** Accepted
**Date:** 2026-07-25

## Context
After profiling the ONS data, the warehouse needed a data model. The
profiling showed one measure (val_geracao) surrounded by descriptive
context (plant, time, source, subsystem), and a naturally read-heavy
workload: the data is written once per load and read many times for
analysis.

## Decision
Use a star schema: one fact table (fato_geracao) referencing
denormalized dimension tables (dim_tempo, dim_usina).

## Alternatives considered
- **Snowflake schema**: normalize the dimensions into linked tables
  (e.g. dim_usina -> dim_estado -> dim_subsistema).
  Rejected: it trades read speed for write integrity and storage
  savings. For a read-heavy warehouse, more joins mean slower and
  harder-to-write queries for the analysts who consume the data. The
  dimensions here are small and stable (710 plants, 5 subsystems), so
  the redundancy a star schema introduces costs almost nothing, and the
  normalization snowflake offers solves a problem this project does not
  have.

## Consequences
- Fewer joins: simpler, faster analytical queries.
- Redundancy in the dimensions (e.g. "SUDESTE" repeated), which is
  acceptable because the dimensions are small and rarely change.
- Denormalized dimensions make attribute updates more expensive, but
  updates are rare in this batch-loaded warehouse.