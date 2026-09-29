{{ config(materialized='table') }}

select
    interviewer_id,
    location
from {{ ref('stg_interviews_latest') }}
where interviewer_id is not null

qualify row_number() over (
    partition by interviewer_id
    order by interviewer_id
) = 1

