-- TOTAL SALES AMOUNT
SELECT SUM(Amount) AS Total_Sales
FROM [clux store].dbo.['working sheet$'];

------------------------------------------------------
-- NUMBER OF ORDERS
SELECT COUNT([Order ID]) AS Total_Orders
FROM [clux store].dbo.['working sheet$'];

------------------------------------------------------
-- PRODUCT CATEGORIES
SELECT DISTINCT Category
FROM [clux store].dbo.['working sheet$'];

------------------------------------------------------
-- TOTAL SALES PER CATEGORY
SELECT Category, SUM(Amount) AS Category_Sales
FROM [clux store].dbo.['working sheet$']
GROUP BY Category
ORDER BY Category_Sales DESC;

------------------------------------------------------
-- MONTHLY SALES TREND (YEAR-WISE)
SELECT Year, Month, SUM(Amount) AS Monthly_Sales
FROM [clux store].dbo.['working sheet$']
GROUP BY Year, Month
ORDER BY Year, Month;

------------------------------------------------------
-- ORDERS BREAKDOWN BY SHIPPING STATE
SELECT [Ship-State], COUNT([Order ID]) AS Total_Orders
FROM [clux store].dbo.['working sheet$']
GROUP BY [Ship-State]
ORDER BY Total_Orders DESC;

------------------------------------------------------
-- AVERAGE ORDER AMOUNT BY SALES CHANNEL
SELECT [Sales Channel], AVG(Amount) AS Avg_Order_Amount
FROM [clux store].dbo.['working sheet$']
GROUP BY [Sales Channel];

------------------------------------------------------
-- TOP 5 CITIES WITH THE HIGHEST SALES
SELECT TOP 5 [Ship-City], SUM(Amount) AS Total_Sales
FROM [clux store].dbo.['working sheet$']
GROUP BY [Ship-City]
ORDER BY Total_Sales DESC;

------------------------------------------------------
-- CUSTOMER-BASED PURCHASE TRENDS (BY GENDER)
SELECT Gender, SUM(Amount) AS Total_Sales
FROM [clux store].dbo.['working sheet$']
GROUP BY Gender;

------------------------------------------------------
-- CUSTOMER AGE CATEGORY ANALYSIS
SELECT [Age Category], COUNT([Order ID]) AS Total_Orders, SUM(Amount) AS Total_Sales
FROM [clux store].dbo.['working sheet$']
GROUP BY [Age Category]
ORDER BY Total_Sales DESC;

------------------------------------------------------
-- B2B VS B2C SALES PERFORMANCE
SELECT B2B, SUM(Amount) AS Total_Sales, COUNT([Order ID]) AS Total_Orders
FROM [clux store].dbo.['working sheet$']
GROUP BY B2B;

------------------------------------------------------
-- RETURN RATE BY PRODUCT CATEGORY
SELECT Category,
       COUNT(CASE WHEN Status = 'Returned' THEN 1 END) AS Returned_Orders,
       COUNT([Order ID]) AS Total_Orders,
       (COUNT(CASE WHEN Status = 'Returned' THEN 1 END) * 100.0 / COUNT([Order ID])) AS Returned_Percentage
FROM [clux store].dbo.['working sheet$']
GROUP BY Category
ORDER BY Returned_Percentage DESC;
