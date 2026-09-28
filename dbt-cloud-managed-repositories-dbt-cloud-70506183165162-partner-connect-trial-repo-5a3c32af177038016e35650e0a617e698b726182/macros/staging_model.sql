{% macro staging_model(source_relation) %}

select
    *,
    dbt_valid_from as row_valid_from,
    coalesce(
        dbt_valid_to,
        95586134399000000
    ) as row_valid_to,

    case
        when dbt_valid_to is null then 1
        else 0
    end as row_is_active

from {{ source_relation }}

{% endmacro %}