<p align="center">
  <img src="https://github.com/narnolpratham/Healthcare_Analytics_Project/blob/main/05_Healthcare_Analytics_Dashboard.png"
  width="900">
</p>

Healthcare Readmission & Revenue Analysis
By Pratham Narnol | Data Analyst
1. The Problem Statement
"A healthcare provider generating $4.9M in annual revenue is facing operational inefficiencies due to an opaque readmission landscape. While the hospital manages 947 patients, the lack of demographic-specific risk profiling prevents targeted care, potentially leading to unnecessary costs and poor patient outcomes. This project aims to identify high-risk 'Red Flag' segments and correlate clinical diagnosis with financial impact."
2. The Tech Stack
Data Cleaning: Python (Pandas)
Database & EDA: SQL (Aggregate functions, Case Logic)
Business Intelligence: Power BI (DAX, Measure Branching)
Documentation: GitHub Markdown
3. The Analysis Pipeline
Phase 1: Data Engineering (Python)
The Mess: Raw data contained negative ages, inconsistent gender strings ('M', 'Male', 'Man'), and missing values.
The Fix: Used Pandas to standardize categorical data and created a calculated Treatment_Cost column.
Outcome: Transformed raw noise into a structured dataset ready for SQL querying.
Phase 2: Deep-Dive EDA (SQL)
The Logic: Built a comprehensive SQL script utilizing CASE WHEN to group patients into Age_Brackets.
The "Aha!" Moment: Discovered that while Strokes are the most common diagnosis, the Young Adult Diabetes segment had a staggering 77.78% readmission rate—far exceeding the hospital average of 30%.
Phase 3: Executive Dashboard (Power BI)
Design: A high-contrast "Dark Mode" UI designed for executive readability.
Features: Interactive slicers, KPI cards for total revenue ($4.90M), Average patient age, High risk readmission.
4. Key Insights & Recommendations
Financial Impact: Female patients drive the majority of treatment revenue; marketing and specialized care should be optimized for this demographic.
Operational Risk: Diabetes in Young Adults is the primary "Red Flag." I recommend a Post-Discharge Monitoring Program specifically for this group.
Capacity Planning: Old (60+) represent the highest patient volume (43%), requiring optimized staffing in geriatric departments.
