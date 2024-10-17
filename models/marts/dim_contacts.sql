/* Table: contacts */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.active,
    t.address,
    t.email,
    t.id,
    t.language,
    t.name,
    t.phone,
    t.time_zone,
    t.created_at,
    t.updated_at,
    t.first_name,
    t.last_name,
    t.visitor_id,
    t.org_contact_id,
    t._dlt_load_id,
    t._dlt_id,
    t.preferred_source,
    t.company_id,
FROM  {{ ref('stg_contacts') }} as t