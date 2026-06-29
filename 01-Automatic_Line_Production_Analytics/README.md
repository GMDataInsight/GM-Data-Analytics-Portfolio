# 🚀 Automatic Production Line Analytics

### End-to-End Manufacturing Business Intelligence Solution

![Dashboard Preview](screenshots/dashboard_preview.png)

This project demonstrates the development of a complete Business Intelligence solution for monitoring and analyzing automated casting production lines. It combines SQL Server and Power BI to transform raw production, planning, and quality data into actionable business insights through an optimized analytical model.

The primary objective is to measure Overall Equipment Effectiveness (OEE), monitor production performance, identify operational bottlenecks, and support data-driven decision-making.

---

# 📷 Dashboard Preview

> Dashboard screenshots are available in the **Screenshots** folder.

| Executive Summary | OEE Analysis |
|-------------------|--------------|
| ![](screenshots/executive_summary.png) | ![](screenshots/oee_analysis.png) |

---

# 📌 Project Overview

Manufacturing companies generate thousands of production records every day. Without a structured analytical solution, it becomes difficult to monitor equipment efficiency, compare planned versus actual production, identify quality losses, and support operational decision-making.

This project delivers a complete Manufacturing Analytics solution that integrates production, planning, and quality data into a unified analytical model. The solution provides interactive dashboards for monitoring production performance and Overall Equipment Effectiveness (OEE).

---

# 🎯 Business Objectives

The solution was designed to answer the following business questions:

- What is the current OEE of each production line?
- Which production lines are performing below target?
- How does actual production compare to the production plan?
- Which production teams achieve the highest efficiency?
- What are the current production trends?
- Where are the largest quality losses?
- How efficiently is available production capacity being utilized?

---

# 💡 Solution Overview

The solution follows a layered Business Intelligence architecture.

```
Production Data
Planning Data
Quality Data
Parameters Data
        │
        ▼
 SQL Server Views
        │
        ▼
   Star Schema
        │
        ▼
     Power BI
        │
        ▼
 Interactive Dashboards
        │
        ▼
 Business Decisions
```

---

# ⚙ Technology Stack

| Layer | Technology |
|--------|------------|
| Database | SQL Server |
| Data Preparation | SQL Views |
| Data Modeling | Star Schema |
| ETL | Power Query |
| Analytics | DAX |
| Visualization | Power BI |
| Version Control | Git & GitHub |

---

# 🏗 Solution Architecture

![Architecture](screenshots/architecture.png)

The reporting solution consists of multiple analytical layers:

- Raw production data
- SQL transformation layer
- Business logic implemented through SQL Views
- Star Schema analytical model
- DAX calculation layer
- Interactive Power BI dashboards

---

# 🗂 Data Model

![Star Schema](screenshots/data_model.png)

The Power BI solution follows a Star Schema design to ensure high performance, scalability, and simplified analytical reporting.

### Fact Table

- vw_OEEAutoLine

### Dimension Tables

- Dim_Date
- Dim_Line
- Dim_Shift

---

# 🔄 SQL Data Pipeline

![SQL Pipeline](screenshots/sql_pipeline.png)

```
Raw Production Tables
          │
          ▼
vw_Production_Detail
          │
          ▼
vw_OEE_Daily
          │
          ▼
vw_OEE_Monthly
          │
          ▼
vw_OEEAutoLine
          │
          ▼
Power BI Dataset
```

---

# 📊 Key Performance Indicators

| KPI | Description |
|------|-------------|
| Quality | Good Production / Total Production |
| Industrial Load | Available Capacity / Theoretical Capacity |
| Volume Load | Planned Capacity / Available Capacity |
| Performance | Actual Production / Planned Capacity |
| Availability | Actual Production Time / Planned Production Time |
| OEE | Availability × Performance × Quality × Industrial Load × Industrial Load |
| Production Quantity | Total Produced Parts |
| Scrap | Rejected Production |

---

# 📈 Dashboard Pages

## Executive Summary

Executive dashboard providing a high-level overview of manufacturing performance.

**Features**

- Production KPI Cards
- OEE Overview
- Production Trends
- Forecast KPI
- Capacity Monitoring
- Interactive Filtering

---

## OEE Analysis

Detailed analysis of manufacturing efficiency.

**Features**

- OEE by Production Line
- Availability Analysis
- Performance Analysis
- Quality Analysis
- Operator and Line Leader Performance
- Monthly Trends
- Interactive Drill-down

---

# 💼 Business Impact

The implemented solution enables:

- Continuous production performance monitoring
- OEE measurement across production lines
- Production planning comparison
- Capacity utilization analysis
- Scrap monitoring
- Faster management reporting
- Improved operational decision-making
- Support for continuous improvement initiatives

---

# ⭐ Technical Highlights

- End-to-End Business Intelligence Solution
- SQL Server Data Transformation
- Modular SQL View Architecture
- Star Schema Data Modeling
- Advanced DAX Measures
- Manufacturing KPI Framework
- Interactive Power BI Dashboards
- Forecast Analysis
- Professional Dashboard Design
- Manufacturing Analytics Best Practices

---

# 📂 Repository Structure

```
01-Automatic_Production_Line_Analytics
│
├── Data
├── Documentation
├── Power BI
│   └── Automatic_Production_Line_Analytics.pbix
├── SQL
│   ├── Tables
│   ├── Views
│   ├── Functions
│   └── Stored Procedures
├── Screenshots
├── README.md
├── LICENSE
└── .gitignore
```

---

# 🚀 Future Improvements

Possible future enhancements include:

- Power BI Service deployment
- Automated data refresh
- Near real-time reporting
- Predictive maintenance analytics
- Machine-level drill-through analysis
- AI-assisted production forecasting

---

# 👨‍💻 Author

**Miroslav Grujic**

Manufacturing Data Analytics | SQL Server | Power BI | Operations Analytics

With 18 years of experience in the automotive industry, this project combines manufacturing expertise with modern Business Intelligence practices to deliver actionable operational insights.

---

## 📄 License

This project is available under the MIT License.

---

### ⭐ If you found this project interesting, consider exploring the other projects available in my GM Data Analytics Portfolio