/* Table: roles */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.id,
    t.name,
    t.description,
    t.default,
    t.created_at,
    t.updated_at,
    t.agent_type,
    t._dlt_load_id,
    t._dlt_id,
FROM  {{ ref('stg_roles') }} as t