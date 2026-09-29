{{
    config(
        materialized='incremental',
        unique_key='payment_id'
    )
}}

select
    payment_id,
    order_id,
    payment_method,
    payment_status,
    amount,
    created_date,
    batched_at

from {{ ref('stg_payment') }}

{% if is_incremental() %}

where batched_at >
(
    select coalesce(
        max(batched_at),
        '1900-01-01'::timestamp_ntz
    )
    from {{ this }}
)

{% endif %}