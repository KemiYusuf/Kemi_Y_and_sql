Select  region, count(distinct Customerid) as total_customers 
From [dbo].[capstone customer data csv file]
Group by region;

Select top 1 subscriptiontype, count(distinct customerid) as total_customers
From [dbo].[capstone customer data csv file]
Group by subscriptiontype
Order by total_customers desc

Select customerid
From [dbo].[capstone customer data csv file]
Where datediff(month, subscriptionstart, subscriptionend) <= 6

Select avg(datediff(day, subscriptionstart, subscriptionend)) as avg_subscription_duration
From [dbo].[capstone customer data csv file]

Select customerid
From [dbo].[capstone customer data csv file]
Where datediff(month, subscriptionstart, subscriptionend) > 12

 Select subscriptiontype,
Sum(revenue) as total_revenue 
From [dbo].[capstone customer data csv file]
Group by subscriptiontype;

Select top 3 region,
Count(*) as subscriptionend_count
From [dbo].[capstone customer data csv file]
Where subscriptionend is not null
Group by region
Order by subscriptionend_count desc;

