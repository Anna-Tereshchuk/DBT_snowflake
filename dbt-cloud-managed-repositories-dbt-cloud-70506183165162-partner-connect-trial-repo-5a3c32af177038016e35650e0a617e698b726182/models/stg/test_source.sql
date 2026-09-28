{{ config(materialized='view') }}

select *
from {{ source('stripe', 'payment') }}
limit 1