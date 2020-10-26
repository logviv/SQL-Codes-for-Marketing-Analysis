SET GLOBAL sql_mode='ONLY_FULL_GROUP_BY';

select @@GLOBAL.sql_mode;

use superstoresdb;

TASK 1
A.Data contains following tables such as cust_dimen,prod_dimen,order_dimen,market_fact,shipping_dimen.
  market_fact table is the mother table for all tables which have connection with all other tables
  select*
  from Custm_dimen;

  select*
  from orders_dimen;

  select*
  from Prod_dimen

  select*
  from market_fact

  select*
  from shipping_dimen

B.Table Name  :cust_dimen
  Primary Key :cust_id
  Forigen Key :No Forigen Key

  Table Name  :orders_dimen
  Primary Key :orders_id
  Forigen Key :No Forigen Key

  Table Name  :prod_dimen
  Primary Key :prod_id
  Forigen Key :No Forigen Key
  
  Table Name  :shipping_dimen
  Primary Key :ship_id
  Forigen Key :No Forigen Key
  
  Table Name  :market_fact
  Primary Key :No Primary Key
  Forigen Key :cust_id,orders_id,prod_id,ship_id

TASK-2
A.select sum(sales) as total_sales, avg(sales) avg_sales
  from market_fact


B.select region, count(*) no_of_customers
  from cust_dimen
  group by region
  order by no_of_customers desc;


C.select region, count(*) no_of_customers
  from cust_dimen
  group by region
  order by no_of_customers desc
  limit 1;


D.select prod_id, sum(order_quantity) no_of_products_sold
  from market_fact
  group by prod_id
  order by no_of_products_sold desc;

E.select cust_dimen.customer_name, count(*) no_of_tables_purchased
   from cust_dimen
   inner join market_fact using (cust_id)
   inner join prod_dimen using (prod_id)
   where cust_dimen.region = 'ATLANTIC'
   and prod_dimen.product_sub_category = 'TABLES'
   group by cust_dimen.customer_name



TASK-3

A.select prod_dimen.product_category, sum(market_fact.profit) profits
  from prod_dimen
  inner join market_fact using (prod_id)
  group by prod_dimen.product_category
  order by profits desc;



B.select prod_dimen.product_category, prod_dimen.product_sub_category, sum(market_fact.profit) profits
  from prod_dimen
  inner join market_fact using (prod_id)
  group by prod_dimen.product_category, prod_dimen.product_sub_category;
  

  
c.  select region
    from Cust_dimen
    inner join market_fact using(cust_id)
    inner join prod_dimen using (prod_id)
    where prod_dimen.Product_Sub_Category='TABLES'
    group by region 
    order by count(market_fact.Ship_id) desc
    limit 1;

    select region,count(Ship_id) no_of_shipments,sum(profit) profit_in_each_region
    from cust_dimen
    inner join market_fact using(cust_id)
    inner join prod_dimen using (prod_id)
    where prod_dimen.Product_Sub_Category='TABLES'
    group by Region
    order by profit_in_each_region desc;


