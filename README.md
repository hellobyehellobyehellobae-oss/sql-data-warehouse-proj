# Snowflake SQL Data Project
## Production-Style Data Warehousing, EDA, and Business Analytics

### Project Purpose
This repository demonstrates a structured, production-style analytics workflow in Snowflake, covering:
- Layered data warehousing (Bronze / Silver / Gold)
- Systematic Exploratory Data Analysis (EDA)
- Reusable analytical patterns for business insights
- Clear separation between data understanding and decision analytics

This project is intentionally SQL-only to emphasize analytical reasoning, data discipline, and metric clarity rather than tooling.

---

## Warehouse Architecture

### Bronze Layer — Raw Ingestion
- Raw source data ingested with minimal transformation
- Preserves original granularity and history
- Used as an immutable source

### Silver Layer — Cleaned and Modeled Data
- Standardized naming conventions
- Deduplication and validation logic
- Business-consistent dimensions and measures

### Gold Layer — Analytics-Ready Data
- Aggregated facts and derived metrics
- Designed for reporting and downstream analytics
- Serves as the foundation for EDA and Analytics layers

---

## Exploratory Data Analysis (EDA)

### Why EDA exists in this project
The `Exploratory_Data_Analysis/` directory contains systematic EDA, organized by analytical intent rather than ad-hoc queries.

The EDA layer answers one core question:
- Do we understand and trust this data enough to build metrics on top of it?

### Folder structure
```text
Exploratory_Data_Analysis/
├── database_exploration.sql
├── dimension_exploration.sql
├── measure_exploration.sql
├── magnitude_analysis.sql
├── order_date_range.sql
└── ranking.sql
```
## What Each File Is Designed to Validate

### database_exploration.sql
- Table inventory and row counts
- Data volume and distribution across entities
- Identification of analytical entry points

### dimension_exploration.sql
- Cardinality and uniqueness of key dimensions
- Detection of unexpected categories and value inflation
- Dimensional integrity checks

### measure_exploration.sql
- Distribution of numeric measures
- Zero, null, and extreme values detection
- Skew and outlier visibility

### magnitude_analysis.sql
- Scale and concentration effects
- Detection of dominant entities or values
- Helps avoid misleading averages

### order_date_range.sql
- Minimum and maximum dates and overall coverage
- Gaps and data freshness checks
- Validation of time-based assumptions

### ranking.sql
- Top-N and bottom-N exploration
- Heavy-tail and Pareto pattern detection
- Inputs into later contribution and concentration analyses

## Analytics Layer

### Goal of Analytics in This Project
The `Analytics/` directory contains decision-oriented analysis built only after the data structure, data quality, and known limitations are fully understood.

This layer is designed to answer concrete business questions using analytics-ready data rather than to explore or validate the data itself.

---

### Folder Structure
```text
Analytics/
├── change_over_time.sql
├── cumulative_analysis.sql
├── data_segmentation.sql
├── part_to_whole_analysis.sql
├── performance_analysis.sql
├── report_customers.sql
└── report_products.sql
```
### Analytical Patterns Implemented

#### change_over_time.sql
- Trend analysis
- Period-over-period comparisons
- Growth and decline detection

#### cumulative_analysis.sql
- Running totals
- Accumulation patterns over time
- Momentum and saturation effects

#### data_segmentation.sql
- Segmenting entities by behavior or performance
- Comparing groups instead of raw totals
- Supporting targeted decision-making

#### part_to_whole_analysis.sql
- Share-of-total metrics
- Contribution analysis
- Dependency and concentration insights

#### performance_analysis.sql
- Performance benchmarking across entities
- Identification of under- and over-performers
- Ranking and comparison logic

#### report_customers.sql
- Customer-focused reporting outputs
- Metrics and breakdowns designed for stakeholder consumption
- Structured to be dashboard-ready

#### report_products.sql
- Product-focused reporting outputs
- Performance and contribution views
- Structured to be dashboard-ready

---

### Snowflake SQL Features Used
- Common Table Expressions (CTEs) for readable and modular logic
- Window functions for ranking, cumulative metrics, and time-based analysis
- Aggregations at multiple grains
- Clear separation between exploratory and reporting logic
