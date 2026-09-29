{% macro latest_staging_model(source_relation, unique_key) %}

select *
from {{ source_relation }}

qualify row_number() over (
    partition by {{ unique_key }}
    order by row_valid_from desc
) = 1

{% endmacro %}