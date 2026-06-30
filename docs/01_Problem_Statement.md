# 1. Problem Statement

## The Real-World Challenge

Modern food supply chains are highly fragmented, involving numerous independent stakeholders including farmers, logistics providers, quality inspectors, and retailers. When a food safety issue arises (such as an E. coli outbreak or a broken cold-chain resulting in spoilage), identifying the exact origin of the contaminated batch and halting its distribution is a slow, manual process.

This lack of transparency leads to:

1. **Public Health Risks:** Contaminated food reaching consumers before a recall can be issued.

2. **Economic Loss:** Massive, untargeted recalls where safe food is destroyed alongside contaminated food because the exact affected batches cannot be isolated.

3. **Data Inconsistencies:** Stakeholders keeping isolated, non-standardized records, making it impossible to audit the full lifecycle of a product.

## The Proposed Solution

The "Food Supply Chain Traceability and Safety Monitoring System" solves this by providing a centralized, fully normalized relational database system. It acts as a digital ledger that records the creation of product batches, logs every custody transfer (shipment), and audits environmental data (safety inspections). By utilizing PL/pgSQL triggers, the system intelligently automates safety protocols—such as instantly quarantining a batch if a recorded temperature violates the product's safety thresholds.
