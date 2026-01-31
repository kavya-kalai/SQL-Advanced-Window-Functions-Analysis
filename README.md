Task 8: SQL Window Functions - Advanced Analytics

Internship: Data Analyst Internship (MSME) 

📌 Project Overview
This task focused on using SQL Window Functions to perform complex calculations across sets of rows while maintaining individual row data. I utilized these functions to rank performance, handle ties in data, and calculate cumulative growth metrics.

🛠️ Tools & Techniques

Database: SQLite / PostgreSQL 


Window Functions: ROW_NUMBER(), RANK(), DENSE_RANK(), SUM() OVER(), and LAG() 


Data Organization: Used PARTITION BY to group rankings by region and category.

📂 Repository Contents

task8_window.sql: The full script containing all advanced analytical queries.


ranked_customers.csv: Exported results showing customer sales rankings per region.


mom_growth.csv: Exported results showing month-over-month growth trends.


insights_task8.txt: Documented business insights derived from the SQL analysis.

💡 Key Analytical Insights

Ranking Distribution: Using ROW_NUMBER() identified specific top-tier customers in each region, allowing for targeted marketing.


Cumulative Growth: Running totals revealed that sales milestones are consistently met mid-month.


Performance Trends: LAG() functions exposed seasonal dips that were previously hidden in static aggregate reports.
