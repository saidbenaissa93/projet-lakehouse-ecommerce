select
    order_id,
    sum(payment_value) as total_payment_value,
    count(*) as nb_payment_installments
from {{ source('raw', 'order_payments') }}
group by order_id