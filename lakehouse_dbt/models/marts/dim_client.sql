with ranked_customers as (
    select
        customer_unique_id,
        customer_city,
        customer_state,
        row_number() over (
            partition by customer_unique_id
            order by customer_id desc
        ) as rn
    from {{ ref('stg_customers') }}
)

select
    customer_unique_id,
    customer_city,
    customer_state
from ranked_customers
where rn = 1