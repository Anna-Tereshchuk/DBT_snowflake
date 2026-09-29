select *
from {{ ref('fct_interview') }}
where interviewer_id is null