{{ config(
    materialized='view'
) }}

select
    cast(id as number) as order_id,
    cast(user_id as number) as customer_id,
    cast(order_date as date) as order_date,
    cast(status as varchar) as order_status,
    cast(_etl_loaded_at as timestamp_ntz) as etl_loaded_at

from {{ source('jaffle_shop', 'orders') }}