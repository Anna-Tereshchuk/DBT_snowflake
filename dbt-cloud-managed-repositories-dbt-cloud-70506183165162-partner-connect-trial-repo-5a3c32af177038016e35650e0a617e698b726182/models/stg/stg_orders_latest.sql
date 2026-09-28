{{ config(materialized='table') }}

select *
from {{ ref('stg_orders') }}

qualify row_number() over (
    partition by order_id
    order by etl_loaded_at desc
) = 1