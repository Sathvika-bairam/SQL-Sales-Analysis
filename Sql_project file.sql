desc `sample superstore data`;
show databases;
Alter table `sample superstore data` rename super;
select * from super;

-- checking null values

Select *
from super
where Sales  is null
  or category is null
  or Region is null
  or profit is null;
  
  -- what is the total sales?
  Select sum(sales) as Total_sales
  from super;
  
  -- how many records do we have in this dataset?
  select count(*) as Total_records
  from super;
  
  -- which region generates the (total) highest sales?
  select region ,  sum(sales) as Total_sales
  from super
  group by region
  order by Total_sales Desc;
  
  -- which category generates the highest sales?
  select category, sum(sales) as Total_sales
  from super
  group by category
  order by Total_sales desc;
  
 -- which segment contributes the most to sales?
 select segment, sum(sales) as Total_sales
 from super
 group by segment
 order by Total_sales desc;
 
 -- what are the top 5 sub - categories by sales?
 select sub_category , sum(sales) as Total_sales
 from super
 group by sub_category
 order by Total_sales desc
 limit 5;
 
 -- window function 
 select *
 from (
 select sub_category,sum(Sales) as total_sales,
 rank() over(order by sum(sales) desc) as rnk
 from super
 group by sub_category
 ) as t
 where rnk <= 5;
 
 -- which sub-categories are generating high sales but low profit?
 Select sub_category, sum(sales) as total_sales,
 sum(profit) as total_profit
 from super
 group by Sub_Category
 order by total_sales desc;