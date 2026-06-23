{{
    config(materialized = 'incremental', unique_key = [ 'order_id', 'product_id'])
}}

select 
order_id,
customer_id,
order_date,
amount
from {{source ('jaffle_shop', 'orders')}}

{% if is_incremental() %}
    where order_date > (select max(order_date) from {{ this}}

{% endif %}