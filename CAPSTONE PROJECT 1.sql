Use Capstone_Project;

 Select product, SUM(ISNULL(quantity, 0) * ISNULL(unitprice, 0)) as Total_Sales From [dbo].[Capstone Sales Data KY Project]
 Group by product;

 UPDATE [dbo].[Capstone Sales Data KY Project]
SET quantity = 0
WHERE quantity IS NULL;

UPDATE [dbo].[Capstone Sales Data KY Project]
SET unitprice = 0
WHERE unitprice IS NULL;


 Select Region, count(*) as NumberOfTransactions from [dbo].[Capstone Sales Data KY Project]
 Group by Region

 Select top 1 product, sum(quantity*unitprice) as Total_sales From [dbo].[Capstone Sales Data KY Project]
Group by product
Order by Total_sales desc;

Select month(OrderDate) as month, sum(Quantity*UnitPrice) as MonthlySales From [dbo].[Capstone Sales Data KY Project]
Where year(OrderDate) = year(GetDate())
Group by month(OrderDate)
Order by month(OrderDate);

Select top 5 customer_id, sum(quantity*unitprice) as totalpurchaseAmount From [dbo].[Capstone Sales Data KY Project]
Group by Customer_Id
Order by TotalPurchaseAmount desc;

SELECT
    region,
    (SUM(ISNULL(quantity, 0) * ISNULL(unitprice, 0)) * 1.0 / 
NULLIF((SELECT SUM(ISNULL(quantity, 0) * ISNULL(unitprice, 0)) FROM [dbo].[Capstone Sales Data KY Project]), 0)) * 100 AS PercentageOfTotalSales
FROM
    [dbo].[Capstone Sales Data KY Project]
GROUP BY
    region;

SELECT DISTINCT product
FROM [dbo].[Capstone Sales Data KY Project] p1
WHERE NOT EXISTS (
    SELECT 1
    FROM [dbo].[Capstone Sales Data KY Project] p2
    WHERE p2.product = p1.product 
    AND p2.OrderDate >= DATEADD(quarter, -1, GETDATE()) 
    AND p2.OrderDate < GETDATE()
);

	SELECT
    region,
    SUM(quantity * unitprice) AS totalsales,
    (SUM(quantity * unitprice) * 1.0 / (SELECT SUM(quantity * unitprice) FROM [dbo].[Capstone Sales Data KY Project] WHERE quantity IS NOT NULL AND unitprice IS NOT NULL)) * 100 AS PercentageOfTotalSales
FROM
    [dbo].[Capstone Sales Data KY Project]
WHERE quantity IS NOT NULL AND unitprice IS NOT NULL
GROUP BY
    region;

	SELECT *
FROM [dbo].[Capstone Sales Data KY Project]
WHERE quantity IS NULL OR unitprice IS NULL;


