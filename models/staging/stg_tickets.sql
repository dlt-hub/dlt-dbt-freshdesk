/* Table: tickets */
{{
    config(
        materialized='table'
    )
}}

-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'tickets' */
    fr_escalated,
    spam,
    group_id,
    priority,
    requester_id,
    source,
    status,
    subject,
    product_id,
    id,
    type,
    due_by,
    fr_due_by,
    is_escalated,
    created_at,
    updated_at,
    sentiment_score,
    initial_sentiment_score,
    nr_escalated,
    _dlt_load_id,
    _dlt_id,
FROM {{ source('raw_data', 'tickets') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )