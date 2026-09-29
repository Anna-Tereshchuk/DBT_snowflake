{{ config(materialized='table') }}

with interviews as (

    select *
    from {{ ref('stg_interviews') }}

)

select *
from interviews

qualify row_number() over (
    partition by candidate_id
    order by interview_id desc
) = 1