{{ config(materialized='view') }}

select
    cast(id as varchar) as interview_id,
    cast(candidate_type as varchar) as candidate_type,
    cast(candidate_id as varchar) as candidate_id,
    cast(status as varchar) as interview_status,
    cast(interviewer_id as varchar) as interviewer_id,
    cast(location as varchar) as location,
    cast(logged as boolean) as logged,
    cast(media_available as boolean) as media_available,
    cast(run_type as varchar) as run_type,
    cast(type as varchar) as interview_type,
    cast(media_status as varchar) as media_status,
    cast(invite_answer_status as varchar) as invite_answer_status,

    cast(_created_micros as number) as created_micros,
    cast(_updated_micros as number) as updated_micros,

    to_timestamp_ntz(cast(_created_micros as number) / 1000000) as created_at,
    to_timestamp_ntz(cast(_updated_micros as number) / 1000000) as updated_at

from {{ source('hiring', 'interviews') }}
