select *
from {{ ref('fct_interview') }}
where candidate_id is null