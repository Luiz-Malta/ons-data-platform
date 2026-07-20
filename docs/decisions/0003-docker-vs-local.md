# 0003 - Docker

**Status:** Accepted
**Date:** 2026-07-19

## Context
The project needs a Python environment to work. So it is necessary to 
create one, but there is a lot of other data tools that are going to 
be used, and some of them need a specific Python version (for more
info about it read the ADR 0002). So we need to ensure a Python version
that is stable and reliable.

## Decision
Use Docker to create a Python environment with the version chosen for the project and all necessary tools and settings. 

## Alternatives considered
- **venv/local**: local installations.
  Rejected: links the function of the pipeline to the Python version
  available locally. Do not allow an easy reproducibility between different machines and can mess with the project dependencies.


## Consequences
- Identical environment in every machine.
- The Python version is set with one line in the Dockerfile.
- It costs only one more layer in the Dockerfile and a few seconds more of build.
