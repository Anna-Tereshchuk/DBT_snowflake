{{ config(materialized='table') }}

with statuses as (

    select *
    from {{ ref('stg_interviews') }}

)

select

    candidate_id,
    interview_type,
    interviewer_id,

    min(case when interview_status = 'DRAFT'
        then updated_at end) as draft_datetime,

    min(case when interview_status = 'REQUESTED'
        then updated_at end) as requested_datetime,

    min(case when interview_status = 'SCHEDULED'
        then updated_at end) as scheduled_datetime,

    min(case when interview_status = 'IN_PROGRESS'
        then updated_at end) as in_progress_datetime,

    min(case when interview_status = 'PENDING_FEEDBACK'
        then updated_at end) as pending_feedback_datetime,

    min(case when interview_status = 'COMPLETED'
        then updated_at end) as completed_datetime,

    datediff(
        minute,
        min(case when interview_status = 'IN_PROGRESS'
            then updated_at end),
        min(case when interview_status = 'PENDING_FEEDBACK'
            then updated_at end)
    ) as interview_duration,

    datediff(
        minute,
        min(case when interview_status = 'PENDING_FEEDBACK'
            then updated_at end),
        min(case when interview_status = 'COMPLETED'
            then updated_at end)
    ) as feedback_delay

from statuses

group by
    candidate_id,
    interview_type,
    interviewer_id
