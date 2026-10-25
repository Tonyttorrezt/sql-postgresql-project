select p.product_name,c.category_name, p.price
from products p
join categories c on p.category_id = c.category_id
order by p.product_name;

select p.product_name, 
sum(i.quantity) as total_stock
from products p
join inventory i on p.product_id=i.product_id
group by p.product_name
order by total_stock desc;


select purchase_order_id, 
sum(quantity * unit_cost) as order_value
from purchase_order_lines
group by purchase_order_id
order by purchase_order_id;

select purchase_order_id, 
sum(quantity * unit_cost) as order_value
from purchase_order_lines
group by purchase_order_id
order by purchase_order_id

select sales_id, 
sum(quantity * unit_price) as total_revenue
from sales_transaction_lines
group by sales_id
order by sales_id;


select b.branch_name, 
sum(stl.quantity * stl.unit_price) as total_revenue
from sales_transactions st
join store_branches b on st.branch_id = b.branch_id
join sales_transaction_lines stl on st.sales_id = stl.sales_id
group by b.branch_name
order by total_revenue desc;