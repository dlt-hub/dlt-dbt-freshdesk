/* Table: agents */
{{
    config(
        materialized='table'
    )
}}

-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'agents' */
    available,
    occasional,
    id,
    ticket_scope,
    created_at,
    updated_at,
    last_active_at,
    type,
    contact__active,
    contact__email,
    contact__language,
    contact__name,
    contact__time_zone,
    contact__created_at,
    contact__updated_at,
    deactivated,
    focus_mode,
    _dlt_load_id,
    _dlt_id,
FROM {{ source('raw_data', 'agents') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )