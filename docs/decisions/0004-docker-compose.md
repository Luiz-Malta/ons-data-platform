# 0004 - Local environment: docker-compose

**Status:** Accepted
**Date:** 2026-07-22

## Context
The project needs more than one container to run: a Postgres database and
a Python application that connects to it. Later phases will add Airflow,
which alone requires four or five containers. Starting each container by
hand with docker run does not scale and is not reproducible.

## Decision
Declare the whole local environment in a single docker-compose.yml file:
services, network, volumes, startup order and credentials.

## Alternatives considered
- **docker run for each container**: starting each service manually.
  Rejected: manageable with two containers, unmanageable with five, and
  impossible to reproduce reliably on another machine.
- **Postgres installed on the host**: no container for the database.
  Rejected: same reasoning as ADR 0003. It ties the project to whatever
  is installed locally and is not reproducible.
- **Other options**: tools like Kubernetes (kind, minikube), cloud-hosted
  databases and similar setups. Rejected: at this stage none of these
  options fit a single-developer project running locally.

## Consequences
- One command (docker compose up) starts the entire environment.
- The infrastructure is versioned in Git, like the application code.
- Containers reach each other by service name over an internal network,
  not by localhost, since localhost inside a container means the container
  itself.
- A named volume keeps the database data across container removal.
- Startup order is handled by a healthcheck plus depends_on. Note the
  limitation: pg_isready confirms that the server responds, not that the
  credentials are correct. A container can be reported as healthy while
  the connection parameters are still wrong.
- Credentials are read from a .env file, which is not committed. A
  .env.example documents the required variables.