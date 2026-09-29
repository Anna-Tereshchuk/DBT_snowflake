select *
from {{ ref('stg_interviews_latest') }}
where interview_status not in (
    'DRAFT',
    'REQUESTED',
    'SCHEDULED',
    'IN_PROGRESS',
    'PENDING_FEEDBACK',
    'COMPLETED',
    'CANCELLED'
)