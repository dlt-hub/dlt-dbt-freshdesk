/* Table: agents */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.available,
    t.occasional,
    t.id,
    t.ticket_scope,
    t.created_at,
    t.updated_at,
    t.last_active_at,
    t.type,
    t.contact__active,
    t.contact__email,
    t.contact__language,
    t.contact__name,
    t.contact__time_zone,
    t.contact__created_at,
    t.contact__updated_at,
    t.deactivated,
    t.focus_mode,
    t._dlt_load_id,
    t._dlt_id,
FROM  {{ ref('stg_agents') }} as t