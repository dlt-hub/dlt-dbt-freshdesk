/* Table: groups */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.id,
    t.name,
    t.description,
    t.business_hour_id,
    t.group_type,
    t.created_at,
    t.updated_at,
    t.auto_ticket_assign,
    t.agent_availability_status,
    t._dlt_load_id,
    t._dlt_id,
FROM  {{ ref('stg_groups') }} as t