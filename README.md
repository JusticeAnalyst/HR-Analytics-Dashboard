# 📊 HR Analytics Dashboard: From SQL Analysis to Power BI Visualization 
(Diagram: SQL → Data Cleaning → DAX Modeling → Visualization)
- Dashboard view: https://github.com/JusticeAnalyst/HR-Analytics-Dashboard/blob/main/Screenshot%20(357).png

## 🔍 End-to-End Analysis Process

### 1. SQL Analysis (Foundational Insights)
Tools: SQL Server  
-Dataset: 1,480 employee records  
-Key Queries:
```sql
-- Attrition Rate by Department (Used in Dashboard)
SELECT 
  Department,
  COUNT(*) AS TotalEmployees,
  COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
  ROUND(COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END)*100.0/COUNT(*),2) AS AttritionRate
FROM HR_Analytics
GROUP BY Department
ORDER BY AttritionRate DESC
```
##  7 Critical SQL Findings:
1. Identified R&D as highest-attrition department (19.05%) 
2. Discovered 24.7% attrition among frequent travelers
3. Calculated avg tenure gap (7.36 yrs vs. 5.13 yrs for stayers/leavers)  

*(Full SQL script available in `HR_Analytics_SQL_Queries.sql`)*
https://github.com/JusticeAnalyst/HR-Analytics-Dashboard/blob/main/HR_Analytics%20SQL%20Query.sq

### 2. Power BI Transformation
ETL Process:
1. Data Import: Connected Power BI to SQL query results  
2. Cleaning:  
   - Standardized `BusinessTravel` values (e.g., "Travel_Rarely" → "Travel Rarely")  
   - Binned ages into groups using Power Query  
3. DAX Modeling:  
```dax
// SQL-derived attrition rate measure
Attrition Rate % = 
VAR TotalEmployees = COUNTROWS(Employees)
VAR AttritionCount = CALCULATE(COUNTROWS(Employees), Employees[Attrition] = "Yes")
RETURN DIVIDE(AttritionCount, TotalEmployees, 0)

## 📊 Dashboard Highlights (Powered by SQL Insights)

### Key Visualizations
| Insight | SQL Origin | Power BI Implementation |
|---------|------------|--------------------------|
| Department Attrition | `GROUP BY Department` | Donut chart with drill-through |
| Income Disparities | `AVG(MonthlyIncome) BY JobRole` | Horizontal bar chart |
| Overtime Trends | `COUNT(CASE WHEN OverTime...)` | Heatmap by job role |

## 🛠️ How to Reproduce
1. Run SQL Queries: Execute `HR_Analytics_SQL_Queries.sql`  
2. Import to Power BI:  
   ```powerquery
   Source = Sql.Database("YourServer", "HR_DB", [Query="SELECT * FROM HR_Analytics"])
   ```
3. Rebuild Measures: Copy DAX from `DAX_Measures.txt`  

## 💡 Why This Workflow Matters
- SQL First: Ensured data accuracy before visualization  
- DAX Optimization: Translated SQL logic into dynamic measures  
- Audit Trail: Full documentation from query to dashboard  

[![View SQL Analysis](https://img.shields.io/badge/SQL-Code_Repo-blue)](https://github.com/JusticeAnalyst/HR_Analytics_SQL)  
*"The dashboard is built on 100+ lines of validated SQL analysis"
