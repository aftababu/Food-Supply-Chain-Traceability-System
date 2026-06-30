# Food Supply Chain Traceability and Safety Monitoring System

## 📌 Project Overview

This database project implements a robust, normalized (3NF) traceability system for monitoring food products from farm to retail. It tracks batch movements, maintains chain of custody, and automates safety inspections using PostgreSQL PL/pgSQL triggers and procedures.

**Academic Context:** CSE-2424 Database Management System Lab (Section: 4AM, Spring-2026). **Group:** 5

## 🚀 Technology Stack

- **Database Engine:** PostgreSQL 16+

- **Programming:** SQL, PL/pgSQL

- **Modeling:** Mermaid JS (ER, Schema, DFD)

- **Tools:** pgAdmin 4, VS Code, psql CLI

## 📂 Repository Structure

- `docs/`: Contains all system documentation, ER diagrams, normalization steps, and the final academic report.

- `database/`: Contains modular `.sql` scripts to build, populate, and query the system.

- `presentation/`: Contains defense materials.

## ⚙️ Setup Instructions

1. Open pgAdmin 4 or the `psql` command-line tool.

2. Execute `database/01_create_database.sql` to initialize the database.

3. Connect to the `food_traceability_db` database.

4. Execute scripts `02` through `06` sequentially to build the schema, constraints, and insert the required sample data (10 rows per relation).

5. Execute scripts `07` through `12` to test DML queries, subqueries, and PL/pgSQL objects.
