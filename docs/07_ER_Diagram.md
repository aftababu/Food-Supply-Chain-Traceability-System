erDiagram STAKEHOLDER_ROLES ||--o{ STAKEHOLDERS : "categorizes" STAKEHOLDERS ||--o{ BATCHES : "produces" PRODUCTS ||--o{ BATCHES : "defines" BATCHES ||--o{ SHIPMENTS : "transported_in" STAKEHOLDERS ||--o{ SHIPMENTS : "sends (Sender)" STAKEHOLDERS ||--o{ SHIPMENTS : "receives (Receiver)" BATCHES ||--o{ SAFETY_INSPECTIONS : "undergoes" STAKEHOLDERS ||--o{ SAFETY_INSPECTIONS : "conducts (Inspector)" BATCHES ||--o{ SYSTEM_ALERTS : "triggers"PRODUCTS {
int product_id PK
string name
float ideal_temp_min
float ideal_temp_max
}
BATCHES {
int batch_id PK
int product_id FK
date production_date
string status
}
STAKEHOLDERS {
int stakeholder_id PK
string name
int role_id FK
}
