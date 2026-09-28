{{ config(materialized='view') }}

select
    cast(id as number) as customer_id,
    cast(first_name as varchar) as first_name,
    cast(last_name as varchar) as last_name

from {{ source('jaffle_shop', 'customers') }}