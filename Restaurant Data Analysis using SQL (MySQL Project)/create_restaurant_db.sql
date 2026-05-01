-- 1. Combine the menu_items and order_details tables into a single table.
select * from 
order_details as od 
left join menu_items as mi 
on od.item_id=mi.menu_item_id;

-- 2. What were the least and most ordered items? What categories were they in?
select item_name,category,count(item_name) As Most_order from 
order_details as od 
left join menu_items as mi 
on od.item_id=mi.menu_item_id group by item_name,category order by Most_order Desc ;

-- 3. What were the top 5 orders that spent the most money?
select order_id ,Sum(price) As Total_spend from 
order_details as od 
left join menu_items as mi 
on od.item_id=mi.menu_item_id group by order_id order by Total_spend Desc limit 5;

-- 4. View the details of the highest spend order. What insights can you gather from the data?
select category, count(item_id) As num_items from 
order_details as od 
left join menu_items as mi 
on od.item_id=mi.menu_item_id where order_id=440 group by category ;
-- 5. View the details of the top 5 highest spend orders. What insights can you gather from the data?
select category, count(item_id) As num_items from 
order_details as od 
left join menu_items as mi 
on od.item_id=mi.menu_item_id where order_id in 
(440,2075,1957,330,2675) 
group by category ;