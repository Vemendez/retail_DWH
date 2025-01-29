# Data Warehouse for Retail Stores 📊

This project is a fully functional **Data Warehouse (DWH)** designed to integrate financial and operational data for retail businesses, enabling advanced analytics, reporting, and business intelligence.

## Features 🚀
- **Normalized Relational Schema**: Designed for efficient financial reporting and sales analysis.
- **Fact and Dimension Tables**: Tracks revenue, expenses, budgets, and transactions.
- **Optimized SQL Queries**: Supports real-time insights into business operations.
- **BI Tool Compatibility**: Structured to work seamlessly with tools like Power BI and Tableau.

## Key Outcome 🌟
This project empowers businesses with **data-driven decision-making**, ensuring financial transparency and efficiency.

---

## Table of Contents 📂
1. [Schema Design](#schema-design)
2. [SQL Queries](#sql-queries)
3. [How to Use](#how-to-use)
4. [Technologies Used](#technologies-used)
5. [Resources](#resources)
6. [License](#license)

---

## Schema Design 📐
The Data Warehouse includes the following tables:
- **FactSales**: Tracks sales data (quantity sold, total sale amount, discount, profit, etc.).
- **FactInventory**: Records inventory data (beginning, received, and sold inventory).
- **FactBudget**: Includes budgeted and actual amounts for accounts.
- **DimAccounts**: Represents financial accounts with a hierarchical structure.
- **DimProducts**: Details product information (category, brand, cost).
- **DimCustomers**: Stores customer demographic information.
- **DimStores**: Information about store locations.
- **DimSuppliers**: Tracks suppliers.
- **DimTime**: Captures temporal data for time-based analysis.

### ER Diagram
![ER Diagram](DWH_ERD.erdplus)

### Relational Schema
![Relational Schema](DWH_RELATIONAL_SCHEMA.erdplus)

---

## SQL Queries 🛠
- **[Table Creation Script](table_creations.sql)**: Creates the schema and tables.
- **[Data Insertion Script](inserting_values.sql)**: Inserts sample data into the tables.

---

## How to Use 📝
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/Financial-Data-Warehouse.git
