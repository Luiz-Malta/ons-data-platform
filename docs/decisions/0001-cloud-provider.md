# 0001 - Cloud provider: AWS

**Status:** Accepted
**Date:** 2026-07-19

## Context
This project needs object storage and compute for a batch data
pipeline. The target audience is US-based startups hiring remote
data engineers.

## Decision
Use AWS (S3, IAM, Lambda) as the cloud provider.

## Alternatives considered
- **Azure**: closest to my current professional stack, lower
  learning curve. Rejected: dominant in large enterprises that
  hire locally, less common among the remote-first companies
  I am targeting.
- **GCP**: excellent BigQuery integration. Rejected: smaller
  market share in job postings; kept as an option for the
  warehouse layer only.

## Consequences
- Steeper initial learning curve than Azure.
- Free tier limits require attention to cost.
- BigQuery may still be used for the warehouse, decoupling
  storage from analytics.
