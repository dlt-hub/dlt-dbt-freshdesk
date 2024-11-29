/* Table: groups */
{{
    config(
        materialized='table'
    )
}}

-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'groups' */
    id,
    name,
    description,
    business_hour_id,
    group_type,
    created_at,
    updated_at,
    auto_ticket_assign,
    agent_availability_status,
    _dlt_load_id,
    _dlt_id,
FROM {{ source('raw_data', 'groups') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )