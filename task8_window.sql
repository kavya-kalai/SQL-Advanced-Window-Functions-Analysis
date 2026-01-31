-- Query 1: Ranking Stores by Sales per Region
-- Using ROW_NUMBER() with PARTITION BY to assign a unique rank to each store 
-- within its specific Region/Type based on high-to-low Weekly_Sales.
SELECT 
    Store, 
    Type, 
    Weekly_Sales,
    ROW_NUMBER() OVER(PARTITION BY Type ORDER BY Weekly_Sales DESC) AS Sales_Rank
FROM cleaned_data;

-- Query 2: Tie-Handling Analysis (RANK vs DENSE_RANK)
-- Comparing how SQL handles identical sales values. RANK() leaves gaps after ties, 
-- while DENSE_RANK() maintains a continuous sequence of ranks.
SELECT 
    Store, 
    Weekly_Sales,
    RANK() OVER(ORDER BY Weekly_Sales DESC) AS Rank_with_Gaps,
    DENSE_RANK() OVER(ORDER BY Weekly_Sales DESC) AS Dense_Rank_No_Gaps
FROM cleaned_data;

-- Query 3: Cumulative Revenue Tracking (Running Totals)
-- Using SUM() OVER to calculate how sales accumulate day-by-day. 
-- This is essential for tracking progress toward periodic business targets.
SELECT 
    Date, 
    Weekly_Sales,
    SUM(Weekly_Sales) OVER (ORDER BY Date) AS Cumulative_Sales
FROM cleaned_data;

-- Query 4: Month-over-Month (MoM) Growth Analysis
-- Using LAG() to pull data from the previous month to calculate performance 
-- changes over time, a standard KPI in retail analytics.
WITH Monthly_Totals AS (
    SELECT 
        strftime('%Y-%m', Date) as Month, 
        SUM(Weekly_Sales) as Total_Sales
    FROM cleaned_data
    GROUP BY 1
)
SELECT 
    Month, 
    Total_Sales,
    LAG(Total_Sales) OVER (ORDER BY Month) AS Previous_Month_Sales
FROM Monthly_Totals;