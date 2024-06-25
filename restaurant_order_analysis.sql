Use restaurant_db;

-- OBJECTIVE_1

--1. View the menu_items table.
Select *
from menu_items

--2. Find the number of items on the menu.
Select COUNT(*)
from menu_items

--3. What are the least and most expensive items on the menu?
Select *
from menu_items
order by price;

Select *
from menu_items
order by price Desc;

--4. How many Italian dishes are on the menu?
Select COUNT(*)
from menu_items
where category = 'Italian'

--5. What are the least and most expensive Italian dishes on the menu?
Select *
from menu_items
where category = 'Italian'
order by price;

Select *
from menu_items
where category = 'Italian'
order by price Desc;

--6. How many dishes are in each category?
Select category, COUNT(menu_item_id) as num_dishes
from menu_items
group by category

--7. What is the average dish price within each category?
Select category, Avg(price) as avg_price
from menu_items
group by category

-- OBJECTIVE_2

--1. View the orders_details table.
Select *
from order_details

--2. What is the date range of the table?
Select Min(order_date), MAX(order_date)
from order_details

--3. How many orders were made within this date range?
Select Count(Distinct(order_id)) as num_orders
from order_details

--4. How many items were ordered within this date range?
Select Count(*) as num_items
from order_details

--5. Which order had the most number of items?
Select order_id, Count(item_id) as num_items
from order_details
group by order_id
order by num_items Desc

--6. How many items had more than 12 items?
Select count(*) from 
(Select order_id, Count(item_id) as num_items
from order_details
group by order_id
having num_items > 12) as num_orders

-- OBJECTIVE_3

--1. Combine the menu_items and order_details tables into a single table.
Select * from menu_items;
Select * from order_details;

Select * 
from order_details od
left join menu_items mi
on od.item_id = mi.menu_item_id

--2. What are the least and most ordered items? What categories were they in?
Select item_name, category, count(order_details_id) as num_purchases
from order_details od
left join menu_items mi
on od.item_id = mi.menu_item_id
group by item_name, category
order by num_purchases

--3. What were the top 5 orders that spent most money?
Select order_id, sum(price) as total_spend
from order_details od
left join menu_items mi
on od.item_id = mi.menu_item_id
group by order_id
order by total_spend desc
Limit 5

--4. View the details of the highest spend order. What insights can you gather from the results?
Select category, count(item_id) as num_items
from order_details od
left join menu_items mi
on od.item_id = mi.menu_item_id
where order_id = 440
group by category

--5. View the details of the top 5 highest spend order. What insights can you gather from the results?
Select order_id, category, count(item_id) as num_items
from order_details od
left join menu_items mi
on od.item_id = mi.menu_item_id
where order_id In (440, 2075, 1957, 330, 2675)
group by order_id, category




