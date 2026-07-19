# 0002 - Python Version: 3.12

**Status:** Accepted
**Date:** 2026-07-19

## Context
Python is the dominant language in Data Engineering. As an open-source,
widely used and constantly improved language, it has many versions available.
Ubuntu installed the latest stable version, Python 3.14, but the general
ecosystem of the project is not yet fully adapted to it. A previous Python 3
version therefore had to be chosen and fixed in the containers.

## Decision
Use Python 3.12 as the Python version fixed in the containers.

## Alternatives considered
- **Python 3.14**: the latest stable version of the language.
  Rejected: Python moves ahead of the tools that adapt to its newer
  versions later. Some of the tools used in this project may not work
  well with the latest version yet. The same applies to Python 3.13,
  as many tools take around two versions to adapt.
- **Python 3.11 or older**: versions fully integrated with all the
  tools used here. Rejected: as newer versions come out, bugs are fixed,
  functions are improved and new features are added. Going back further
  than needed is not ideal; we should stay on the most recent fully
  adapted version.

## Consequences
- Some features of the latest version will not be available.
- The environment becomes reproducible across machines: the Python
  version is declared in the Dockerfile rather than inherited from
  the host, so it is identical everywhere.
