{{ config(materialized='table') }}

select distinct
    candidate_id,
    candidate_type
from {{ ref('stg_interviews_latest') }}