{{ config(materialized='table') }}

select distinct
    interviewer_id,
    location
from {{ ref('stg_interviews_latest') }}
