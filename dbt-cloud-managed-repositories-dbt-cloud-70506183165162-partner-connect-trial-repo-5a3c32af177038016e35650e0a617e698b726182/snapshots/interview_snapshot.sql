{% snapshot interviews_snapshot %}

{{
    config(
        target_schema='DBT_ATERESHCHUK',
        unique_key='_OFFSET',
        strategy='check',
        check_cols='all',
        hard_deletes='new_record'
    )
}}

select *
from {{ source('hiring', 'interviews') }}

{% endsnapshot %}