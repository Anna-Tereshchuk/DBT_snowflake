{{
    config(
        materialized='incremental',
        unique_key='order_id'
    )
}}

select
    order_id,
    customer_id,
    order_date,
    order_status,
    etl_loaded_at

from {{ ref('stg_orders') }}

{% if is_incremental() %}

where etl_loaded_at >
(
    select coalesce(
        max(etl_loaded_at),
        '1900-01-01'::timestamp_ntz
    )
    from {{ this }}
)

{% endif %}