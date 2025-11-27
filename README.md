# Northwind Retail Sales Data Engineering Project

A full end-to-end SQL data engineering pipeline built using the Northwind dataset.
This project simulates a real-world ETL workflow:

Raw → Staging → Cleaning → Star Schema → Fact Table → Validation → Analytics → Performance Tuning

# Project Overview

The goal of this project is to design and implement a scalable SQL data model for retail sales analytics.
All ingestion, transformations, and modeling were completed in Microsoft SQL Server.

This project demonstrates:
- Data ingestion from CSV files
- Data cleaning + standardization
- Schema design (star schema)
- Slowly building dimensions and facts
- Analytical SQL for insights

## Tech Stack
- SQL Server (MSSQL)
- SQL
- Python / Pandas
- GitHub
- Notion (documentation)

## Data Layers

Raw Layer

- Direct CSV ingestion
- No cleaning
- Stored exactly as received
- Ingested using BULK INSERT

Staging Layer

Cleaning:
- Removed double-quoted address fields
- Standardized freight decimal precision
- Trimmed and standardized text fields
- Fixed encoding / UTF-8 issues

Star Schema

Dimensions created:
- dim_customer
- dim_product
- dim_date

Fact table:
- fact_sales using surrogate keys + measures

## Validation Checks

- Total revenue reconciliation
- Row counts between raw → staging → fact
- Duplicate key checks
- Referential integrity on foreign keys

All queries are in:
`validation.sql`

## Analytical Queries

- Total Revenue Per Month
- Top Customers by Total Spend
- Revenue by Product Category
- Best-Selling products
- On-Time Shipping Rate

All queries are in:
`Business Analytics.sql`

## Performance Tuning & Query Improvements

- For this particular project, performance tuning was not necessarily required/needed as it was more focused on ETL and then performing some cleaning and transformation on the data to get some insights and validation.
- CTEs and Window functions were not really used in the business analysis as it was very high level, as mentioned before, the focus was Data Engineering rather than analysis.

## Lessons Learned

- Realised the importance of looking at the data for inconsistencies and inserting it in the correct formats as I experienced a few issues with the BULK INSERT query.
- Realised the importance of staging layers for cleaning, keeps things neat and tidy and allows you to compare tables to ensure everything has been carried over.
- Creating dimensions helps simplify business logic. It made JOINs very accessible as the dates were populated in one table, this allowed me to carry out business analysis easily.
- I can now build a simple ELT pipeline in pure SQL






