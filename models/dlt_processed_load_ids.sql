{{
    config(
        materialized='incremental'
    )
}}
-- depends_on: {{ ref('dim__dlt_loads') }}
-- depends_on: {{ ref('dim_agents') }}
-- depends_on: {{ ref('dim_companies') }}
-- depends_on: {{ ref('dim_contacts') }}
-- depends_on: {{ ref('dim_groups') }}
-- depends_on: {{ ref('dim_roles') }}
-- depends_on: {{ ref('dim_tickets') }}
-- depends_on: {{ ref('dim_companies__domains') }}
/* we save all currently active load ids into the processed ids table */
select load_id, {{ current_timestamp() }} as inserted_at FROM {{ ref('dlt_active_load_ids') }}