# 🚀 Automatic Production Line Analytics

### End-to-End Manufacturing Business Intelligence Solution

This project demonstrates the development of a complete Business Intelligence solution for monitoring and analyzing automated casting production lines. 
The solution transforms raw production, planning, and quality data into actionable business insights using SQL Server and Power BI.

The primary objective is to measure Overall Equipment Effectiveness (OEE), monitor production performance, identify operational bottlenecks, and support data-driven decision-making.

---

# 📷 Dashboard Preview

![Dashboard Preview](screenshots/dashboard_preview.PNG)

---

# 📌 Project Overview

Manufacturing companies generate thousands of production records every day. Without a structured analytical solution, it becomes difficult to monitor equipment efficiency, 
compare planned versus actual production, identify quality losses, and support operational decision-making.

This project delivers a complete Manufacturing Analytics solution that integrates production, planning, and quality data into a unified analytical model. 
The solution provides interactive dashboards for monitoring production performance and Overall Equipment Effectiveness (OEE).

---

# 🎯 Business Objectives

The solution was designed to answer the following business questions:

- What is the current OEE of each production line?
- Which production lines are performing below target?
- How does actual production compare to the production plan?
- Which production teams achieve the highest efficiency?
- What are the current production trends?
- How efficiently is available production capacity being utilized?

---

# 🏭 Business Process

![Business Process](screenshots/business_process_flow.PNG)

---

# ⚙ Technology Stack

| Layer | Technology |
|--------|------------|
| Database | SQL Server |
| Data Preparation | SQL Views |
| ETL | Power Query |
| Data Modeling | Star Schema |
| Analytics | DAX |
| Visualization | Power BI |
| Version Control | Git & GitHub |

---

# 🏗 Solution Architecture

![Solution Architecture](screenshots/solution_architecture.PNG)

---

# 🗂 Data Model

![Star Schema](screenshots/data_model.PNG)

---

# 🔄 SQL Data Pipeline

![SQL Pipeline](screenshots/sql_data_pipeline.PNG)

---

# 📊 KPI Framework

![KPI Framework](screenshots/kpi_framework.PNG)

Additional KPIs include:

- Production Quantity
- Scrap
- Forecast KPI

---

# 📈 Dashboard Pages

## Executive Summary

![Executive Summary](screenshots/executive_summary.PNG)

Provides an executive overview of manufacturing performance through KPI cards, trend analysis, forecasting, and production monitoring.

**Main Features**

- KPI Cards
- Production Trends
- Forecast
- Capacity Monitoring
- Interactive Slicers

---

## OEE Analysis

![OEE Analysis](screenshots/oee_analysis.PNG)

Detailed analysis of production efficiency across production lines, shifts, and time periods.

**Main Features**

- OEE Analysis
- Availability
- Performance
- Quality
- Monthly Trends
- Drill-down Analysis

---

# 🔍 Key Findings

The analysis identified several important operational insights:

- Overall Equipment Effectiveness (OEE) remained significantly below the world-class benchmark across all production lines.
- Volume Load showed a positive trend throughout the observed period, while Availability remained stable.
- Performance and Quality were identified as the primary contributors to the overall low OEE, with both KPIs showing a negative trend over time.
- **Line 1** recorded the lowest OEE (approximately 36%). The decline began in June 2025 and coincided with reduced Performance and Quality levels. During the same period, the production mix shifted toward products **320053** and **320051**, while the number of Line Leaders and Operators also increased.
- **Line 2** showed an overall positive OEE trend; however, a significant Performance decrease was observed between June and November 2025. This period coincided with the introduction of additional Line Leaders. After returning to the standard Line Leader configuration, Performance recovered.
- **Line 3** experienced a noticeable Performance decline starting in June 2025. The same period also coincided with an increase in the number of Operators assigned to the production line.
- **Lines 4 and 5** exhibited a similar performance pattern, indicating common operational challenges across multiple production lines.

These findings indicate that organizational and production mix changes may have influenced manufacturing performance and should be investigated further to determine their operational impact.

---

# 💡 Business Recommendations

Based on the analytical findings, the following improvement opportunities have been identified:

- Investigate the root causes of the Performance and Quality decline observed from June 2025 onward. Potential factors include weather conditions, employee absenteeism, and organizational changes.
- Perform a detailed analysis of products **320051**, **320053**, and **317757** to evaluate their impact on production performance. Areas of investigation should include tooling complexity, product design, and compatibility with existing production lines.
- Review workforce allocation and employee movement between production lines after June 2025 to determine whether frequent personnel changes affected operational stability.
- Evaluate the effectiveness of operator training, onboarding, and polyvalence management to ensure employees are assigned according to their competency levels.
- Consider implementing a structured operator certification process, including knowledge validation and formal qualification before independent work on a production line.
- Analyze tool change activities across all production lines. The high product mix suggests frequent changeovers, making SMED principles and setup time reduction potential improvement opportunities.

- Establish regular KPI review meetings using the developed Power BI dashboards to monitor corrective actions and measure continuous improvement initiatives.

---

# 💼 Business Impact

The implemented solution enables:

- Daily production monitoring
- OEE measurement
- Capacity utilization analysis
- Production planning comparison
- Scrap monitoring
- Executive reporting
- Faster operational decision-making
- Continuous improvement initiatives

---

# ⭐ Technical Highlights

- End-to-End Business Intelligence Solution
- SQL Server Data Transformation
- Modular SQL View Architecture
- Star Schema Data Modeling
- Advanced DAX Measures
- Manufacturing KPI Framework
- Forecast Analytics
- Interactive Power BI Dashboards
- Professional UI Design
- Manufacturing Analytics Best Practices

---

# 📂 Repository Structure

![Respository Structure](screenshots/respository_architecture.PNG)

---

# 📚 Documentation

Additional project documentation is available in the **Documentation** folder.

Included documentation:

- Project Architecture
- Business Logic
- SQL Documentation
- Data Model
- Power BI Documentation
- DAX Measures

---

# 🚀 Future Improvements

Possible future enhancements include:

- Power BI Service Deployment
- Automated Data Refresh
- Near Real-Time Reporting
- Predictive Maintenance
- Machine-Level Drill-through
- AI-assisted Production Forecasting

---

# 👨‍💻 About the Author

**Miroslav Grujic - GM Data Insight**

Manufacturing Data Analytics | SQL Server | Power BI | Operations Analytics

With 18 years of experience in the automotive industry, this project combines manufacturing expertise with modern Business Intelligence practices to deliver actionable operational insights.

---

# 📄 License

This project is licensed under the MIT License.

---

⭐ If you found this project interesting, feel free to explore the other projects available in my **GM Data Analytics Portfolio**.