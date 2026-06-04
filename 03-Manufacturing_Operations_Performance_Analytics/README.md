# Manufacturing Operations Performance Analytics Dashboard

#### Project Overview

This project demonstrates the development of a Manufacturing Operations Performance Analytics Dashboard using Power BI.

The objective was to transform raw manufacturing production data into actionable business insights through data modeling, KPI development, and interactive reporting.

The solution was designed to help production managers and operations teams monitor equipment effectiveness, production efficiency, resource utilization, and operational performance.

Using a Star Schema data model and DAX calculations, the dashboard provides visibility into key manufacturing metrics including OEE, productivity, delays, completion rates, material consumption, and energy efficiency.

The final solution consists of four analytical report pages:

* Executive Summary
* Machine Analysis
* Production Trends
* Operations Performance

#### Technologies Used

* Power BI
* Power Query
* DAX
* Data Modeling
* Star Schema Design
* Manufacturing KPI Framework

#### Project Objectives

* Monitor manufacturing performance through KPIs
* Analyze machine utilization and effectiveness
* Identify production bottlenecks and delays
* Track productivity and operational efficiency
* Support data-driven decision making
* Improve visibility across manufacturing operations

#### Business Problem

Manufacturing companies generate large amounts of operational data from production processes, machines, and work orders. However, this data is often dispersed across multiple systems and reports, making it difficult for management to gain a clear view of operational performance.

Without a centralized analytics solution, production managers face several challenges:

* Limited visibility into machine effectiveness and utilization
* Difficulty identifying production bottlenecks
* Inconsistent monitoring of key manufacturing KPIs
* Delayed detection of productivity issues
* Poor visibility into energy consumption and resource efficiency
* Time-consuming manual reporting processes

As a result, decision-making becomes reactive rather than proactive, reducing overall operational efficiency and limiting opportunities for continuous improvement.

#### Solution

To address these challenges, a Power BI analytics solution was developed to consolidate manufacturing data into a single performance management dashboard.

The solution provides:

* Standardized KPI monitoring
* Equipment effectiveness measurement (OEE)
* Productivity and performance analysis
* Delay monitoring and trend analysis
* Material and energy consumption tracking
* Executive-level operational reporting

By transforming raw production data into actionable insights, the dashboard enables management teams to identify improvement opportunities, monitor operational performance, and support data-driven decision making.


#### Dataset Description

The project uses a Hybrid Manufacturing Dataset representing production activities across multiple machines and work orders.

The dataset contains operational information related to production execution, processing times, material consumption, energy usage, and production status.

#### Fact Table

#### Fact_Production

The central fact table stores production-level transactions and operational metrics.

Key attributes include:

| Field                 | Description                                 |
| --------------------- | ------------------------------------------- |
| Job_ID                | Unique production job identifier            |
| Machine_ID            | Machine responsible for production          |
| Operation Type        | Types of process                            |
| Material_Used         | Quantity of material processed              |
| Planned_Processing_Time | Planned running minutes                     |
| Energy_Consumtion     | Energy consumed during production           |
| Machine Availability  | Planned Machine Availability                |
| Scheduled_Start       | Planned production start time               |
| Scheduled_End         | Planned production finish time              |
| Actual_Start          | Actual production start time                |
| Actual_End            | Actual production finish time               |
| Job Status            | Production status (Completed / In Progress) |
| Optimization Category | High / Low / Moderate                       |  

Additional calculated columns were created to support KPI calculations:

* Actual_Processing_Time --- Actual machine running in h
* Productivity (Kg/H)  --- As there are no quantified product units, calculation is based on Kg of material used per h
* Energy per Kg        --- To quantify financial impact of energy cons, calculation is based on Kwh per kg produced
* Energy per h         --- To quantify pure machine energy performance, calculation is based on Kwh per actual h

### Dimension Tables

#### Dim_Date

The Date dimension was created to support time-based analysis and trend reporting.

Key fields include:

* Date
* Year
* Quarter
* Month
* Month Name
* Week
* Day

This dimension enables production trend analysis across different time periods.

#### Dim_Machine

The Machine dimension was created to support machine-level performance analysis.

Key fields include:

* Machine_ID
* Machine Name

This dimension enables comparison of machine utilization, productivity, and operational efficiency.

### Dataset Purpose

The dataset was structured to support manufacturing performance analysis through a Star Schema model, enabling efficient reporting and KPI calculation within Power BI.


