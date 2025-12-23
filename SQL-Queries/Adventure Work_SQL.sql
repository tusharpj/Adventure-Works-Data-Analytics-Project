use adventure_work;

#Q1.# (( UNION OF FACT And FACT_NEW ))

select * from factinternetsales
union all
select * from fact_internet_sales_new;




#Q2.# (( Lookup the productname from the Product sheet to Sales sheet. ))

 
 SELECT 
    s.*,
    p.EnglishProductName AS ProductName1,
    p.SpanishProductName AS ProductName2,
    p.FrenchProductName AS ProductName3
FROM sales as s
LEFT JOIN dimproduct as p
       ON s.ProductKey = p.ProductKey limit 1000;
       



#Q3.# (( Lookup the Customerfullname from the Customer and Unit Price from Product sheet to Sales sheet )) 

select c.Customerfullname,
	   p.Unitprice,
       s.*
   from sales as s
   left join dimcustomer as c
   on s.CustomerKey=c.CustomerKey
   left join dimproduct as p
   on s.ProductKey=p.ProductKey limit 5;

#Q4.# (( calcuate the following fields from the Orderdatekey field ( First Create a Date Field from Orderdatekey ))

#a)) (( Year wise sales AND YEAR WISE PROFIT)) 
select Year,
  sum(SalesAmount) as TotalSales,
  sum(TotalProfit) as TotalProfit
from sales 
group by Year;



#b)) ((Month wise sales and Profit)
       
select Month,
   sum(SalesAmount) as Total_Sales,
	Sum(TotalProfit) as Total_profit
from sales
group by Month
order by Month asc;
                           
                           
						
#C)) ((QUARTER  wise sales and Profit)

select Quarter,
	sum(SalesAmount) as TotalSales,
	sum(TotalProfit) as TotalProfit
from sales 
group by Quarter
order by Quarter;
                       

                        
#D)) (( Gender  wsie  Prodcuctioncost,sales and profit)

select c.Gender,
	sum(s.ProductionCost) as Total_ProdcutionCost,
	avg(s.ProductionCost) as Average_ProdcutionCost,
		sum(s.SalesAmount) as Total_sales,
		avg(s.SalesAmount) as Average_sales,
			sum(s.TotalProfit) as Total_Profit,
			avg(s.TotalProfit) as Average_Profit
 from dimcustomer as c
 inner join sales as s
 on c.CustomerKey=s.CustomerKey
 group by Gender;
 
 
 
#E)) (( Prodcut category name waise sale,average ,profit)

select EnglishProductName,
       SpanishProductName,
       FrenchProductName,
       sum(SalesAmount) as Total_Sales,
       avg(SalesAmount) as Average_sales,
       sum(TotalProfit) as Total_Profit,
       avg(TotalProfit) as Average_Profit
from sales
group by 
	  EnglishProductName,
	  SpanishProductName,
	  FrenchProductName;
       
 


#Q5.# (( Calculate the Sales amount uning the columns(unit price,order quantity,unit discount) )) 



SELECT
    s.*,
    (s.UnitPrice * s.OrderQuantity * (1 - s.UnitPriceDiscountPct / 100)) AS SalesAmount
FROM sales s;




#Q6.# (( Calculate the Productioncost uning the columns(unit cost ,order quantity) )) 

select
s.*,
(s.UnitPrice*s.OrderQuantity) as ProductionCost
from sales as s;




#Q7. ((  Calculate the profit  ))
select * from sales;

select 
s.*,
(s.SalesAmount - s.ProductionCost) as Total_profit
from sales as s;











       


