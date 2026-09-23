select
    oi.order_id,
    oi.order_item_id,
    o.customer_id,
    c.customer_unique_id,
    oi.product_id,
    oi.seller_id,
    cast(o.order_purchase_timestamp as date) as order_date,
    oi.price,
    oi.freight_value,
    p.total_payment_value,
    p.nb_payment_installments
from {{ ref('stg_order_items') }} oi
left join {{ ref('stg_orders') }} o
    on oi.order_id = o.order_id
left join {{ ref('stg_customers') }} c
    on o.customer_id = c.customer_id
left join {{ ref('stg_payments') }} p
    on oi.order_id = p.order_id