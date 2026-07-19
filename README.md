# ons-data-platform

A batch data pipeline for Brazilian electric grid open data, published by the
National Electric System Operator (ONS). Ingests generation and load data,
lands it in cloud object storage, and models it into an analytics-ready
warehouse.

**Stack:** Python · AWS (S3) · dbt · Airflow · Docker · GitHub Actions
**Status:** Work in progress — see [`docs/decisions`](docs/decisions) for architecture decisions.

