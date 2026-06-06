# Manufacturing Operations Performance Analytics Dashboard

### Project Overview #####

This project demonstrates the development of a Manufacturing Operations Performance Analytics Dashboard using Power BI.
The objective was to transform raw manufacturing production data into actionable business insights through data modeling, KPI development, and interactive reporting.
The solution was designed to help production managers and operations teams monitor equipment effectiveness, production efficiency, resource utilization, and operational performance.
Using a Star Schema data model, DAX calculations and Power Query, the dashboard provides visibility into key manufacturing metrics including productivity, completion rates, 
material consumption, and energy efficiency on shift basis.
The final solution consists of four analytical report pages:

* Executive Summary
* Machine Analysis
* Process Analysis
* Teams Analysis


### Technologies Used ####

* Power BI
* Power Query
* DAX
* Data Modeling
* Star Schema Design
* Manufacturing KPI Framework

### Project Objectives ####

* Monitor manufacturing performance through KPIs
* Analyze machine utilization and effectiveness
* Analyze teams strong points and points to improve
* Track productivity and operational efficiency
* Support data-driven decision making
* Improve visibility across manufacturing operations

### Business Problem ####

Manufacturing companies generate large amounts of operational data from production processes, machines, and work orders. However, this data is often dispersed 
across multiple systems and reports, making it difficult for management to gain a clear view of operational performance.
Without a centralized analytics solution, production managers face several challenges:

* Limited visibility into machine effectiveness and utilization
* Difficulty identifying production bottlenecks
* Inconsistent monitoring of key manufacturing KPIs
* Delayed detection of productivity issues
* Poor visibility into energy consumption and resource efficiency
* Time-consuming manual reporting processes

As a result, decision-making becomes reactive rather than proactive, reducing overall operational efficiency and limiting opportunities for continuous improvement.

### Solution ####

To address these challenges, a Power BI analytics solution was developed to consolidate manufacturing data into a single performance management dashboard.
The solution provides:

* Standardized KPI monitoring
* Productivity and performance analysis
* Monitoring trend analysis
* Material and energy consumption tracking
* Executive-level operational reporting

By transforming raw production data into actionable insights, the dashboard enables management teams to identify improvement opportunities, 
monitor operational performance, and support data-driven decision making.


### Dataset Description ####

The project uses a Hybrid Manufacturing Dataset representing production activities across multiple machines and work orders.
The dataset contains operational information related to production execution, processing times, material consumption, energy usage, and production status.


### Fact Table ####

#### Fact_Production ####

The central fact table stores production-level transactions and operational metrics.
Key attributes include:

| Field                   | Description                                 |
| ----------------------- | ------------------------------------------- |
| Job_ID                  | Unique production job identifier            |
| Machine_ID              | Machine responsible for production          |
| Operation Type          | Types of process                            |
| Material_Used           | Quantity of material processed              |
| Processing_Time         | Planned running minutes                     |
| Energy_Consumtion       | Energy consumed during production           |
| Machine Availability    | Machine Availability given by client        |
| Scheduled_Start         | Planned production start time               |
| Scheduled_End           | Planned production finish time              |
| Actual_Start            | Actual production start time                |
| Actual_End              | Actual production finish time               |
| Job Status              | Production status (Completed/Delayed/Fail)  |
| Optimization Category   | High / Low / Moderate Efficiency            |  

Additional calculated columns were created to support KPI calculations:

| Field                   | Description                                                                                  |
| ----------------------- | -------------------------------------------------------------------------------------------- |
| Actual_Processing_Time  | Actual machine running in h                                                                  |
| Productivity (Kg/H)     | As there are no quantified product units, calculation is based on Kg of material used per h  |
| Energy per Kg           | To quantify financial impact of energy cons, calculation is based on Kwh per kg produced     |
| Energy per h            | To quantify pure machine energy performance, calculation is based on Kwh per actual h        |
| Process status          | Status Completed/In Progress                                                                 |
| Start Delay             | Calculation of start delay in h                                                              |
| End Delay               | Calculation of end delay in h                                                                |
| Team                    | Preparation for comparation of results per shift                                             |

### Dimension Tables ###

#### Dim_Date ####

The Date dimension was created to support time-based analysis and trend reporting.
Key fields include:

* Date
* Year
* Month
* Month Name
* Week

#### Dim_Machine ####

The Machine dimension was created to support machine-level performance analysis.
Key fields include:

* Machine_ID

### Dataset Purpose ####

The dataset was structured to support manufacturing performance analysis through a Star Schema model, enabling efficient reporting and KPI calculation within Power BI.



### Data Model ####

A Star Schema data model was implemented to ensure efficient reporting, simplified relationships, and scalable KPI calculations.
The model consists of one fact table and two dimension tables.

### Data Model Structure ####

### Fact Table ####

#### Fact_Production ####

The Fact_Production table serves as the central transactional table containing production records and operational metrics.
The table stores:

* Production jobs
* Processing times
* Material consumption
* Energy consumption
* Production status
* Productivity metrics

This table is the primary source for all KPI calculations and dashboard visualizations.

### Dimension Tables ####

#### Dim_Date ####

The Date dimension provides a dedicated calendar structure for time intelligence and trend analysis.

Benefits:

* Monthly performance reporting
* Trend analysis
* Time-based KPI tracking
* Consistent date filtering

#### Dim_Machine

The Machine dimension provides machine-level context for operational analysis.

Benefits:

* Machine performance comparison
* Productivity analysis
* Equipment effectiveness monitoring
* Operational benchmarking

### Relationships

| From Table  | To Table        | Relationship |
| ----------- | --------------- | ------------ |
| Dim_Date    | Fact_Production | 1 : *        |
| Dim_Machine | Fact_Production | 1 : *        |

Both relationships use a single-direction filter flow from dimension tables to the fact table.

### Modeling Approach

The Star Schema approach was selected because it:

* Improves report performance
* Simplifies DAX calculations
* Reduces model complexity
* Supports scalable dashboard development
* Follows Power BI modeling best practices

This structure enables efficient KPI calculations and provides a strong foundation for manufacturing analytics and operational reporting.


## KPI Framework

The dashboard was designed around a manufacturing performance KPI framework focused on productivity, 
operational efficiency, resource utilization, and production execution.
The following KPIs are used throughout the dashboard pages.

### Productivity

Measures the material processed in Kg vs hours invested.

**Purpose**

* Main KPI which should represent major operational efficiency
* Compare performance across machines, teams, and processes
* Identify improvement opportunities


**Used In**

* Executive Summary
* Machine Analysis
* Teams Analysis
* Process Analysis

---

### Availability

Raw data given by client. Represents machine actvie time vs available time.

**Purpose**

* Evaluate equipment utilization
* Identify downtime impact
* Support production planning

**Used In**

* Executive Summary
* Machine Analysis
* Teams Analysis
* Process Analysis

---

### Completion Rate

Measures the percentage of successfully completed production jobs comparing to schedule plan.

**Purpose**

* Evaluate operational execution
* Monitor production reliability
* Track teams execution skills and efficiency

**Used In**

* Executive Summary
* Teams Analysis
* Process Analysis

---

### Total Jobs

Represents the total number of production jobs processed during the selected period.

**Purpose**

* Measure production workload
* Analyze operational throughput
* Support capacity evaluation

**Used In**

* Executive Summary
* Machine Analysis

---

### Total Material

Represents the total quantity of material processed.

**Purpose**

* Measure production volume
* Analyze material utilization
* Compare process demand

**Used In**

* Executive Summary
* Process Analysis

---

### Energy per Kg

Measures energy efficiency by relating energy consumption to processed material quantity.

**Purpose**

* Benchmark operational efficiency
* Compare machines, teams, and processes
* Identify optimization opportunities

**Used In**

* Executive Summary
* Machine Analysis
* Teams Analysis
* Process Analysis

---

### Team Performance Index

A composite metric used to compare team effectiveness based on 
productivity, availability, energy consumption and completion performance.

**Purpose**

* Rank team performance
* Identify top-performing teams
* Support workforce optimization

**Used In**

* Executive Summary
* Teams Analysis

---

### Efficiency Categories

Production records are grouped into efficiency levels to support performance segmentation.

Categories include:

* High Efficiency
* Moderate Efficiency
* Low Efficiency

**Purpose**

* Quickly identify operational performance distribution
* Highlight improvement opportunities
* Support management reporting

**Used In**

* Executive Summary
* Teams Analysis
* Process Analysis

---

### Trend KPIs

Several trend indicators are used throughout the dashboard to monitor performance over time.

Tracked trends include:

* Productivity Trend
* Energy per Kg Trend
* Material Consumption Trend
* Completion Rate Trend
* Jobs Trend

**Purpose**

* Detect performance changes
* Monitor operational stability
* Support continuous improvement initiatives

**Used In**

* Executive Summary
* Teams Analysis
* Process Analysis




