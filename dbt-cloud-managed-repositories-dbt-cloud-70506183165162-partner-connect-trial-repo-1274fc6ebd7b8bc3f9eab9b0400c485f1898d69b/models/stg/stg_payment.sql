{{ config(
    materialized='view'
) }}

select
    cast(id as number) as payment_id,
    cast(orderid as number) as order_id,
    cast(paymentmethod as varchar) as payment_method,
    cast(status as varchar) as payment_status,
    cast(amount as number) as amount,
    cast(created as date) as created_date,
    cast(_batched_at as timestamp_ntz) as batched_at

from {{ source('stripe', 'payment') }}