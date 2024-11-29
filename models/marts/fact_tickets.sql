/* Fact Table: tickets */
{{
    config(
        materialized='incremental'
    )
}}

SELECT
    ---- main table tickets
    tickets.id,
    tickets.fr_escalated,
    tickets.spam,
    tickets.group_id,
    tickets.priority,
    tickets.requester_id,
    tickets.source,
    tickets.status,
    tickets.subject,
    tickets.product_id,
    tickets.type,
    tickets.due_by,
    tickets.fr_due_by,
    tickets.is_escalated,
    tickets.created_at,
    tickets.updated_at,
    tickets.sentiment_score,
    tickets.initial_sentiment_score,
    tickets.nr_escalated,

    
    ---- dim table groups via groups__group_id
    groups__group_id.id as groups__group_id__id,
    -- groups__group_id.name as groups__group_id__name,
    -- groups__group_id.description as groups__group_id__description,
    -- groups__group_id.business_hour_id as groups__group_id__business_hour_id,
    -- groups__group_id.group_type as groups__group_id__group_type,
    -- groups__group_id.created_at as groups__group_id__created_at,
    -- groups__group_id.updated_at as groups__group_id__updated_at,
    -- groups__group_id.auto_ticket_assign as groups__group_id__auto_ticket_assign,
    -- groups__group_id.agent_availability_status as groups__group_id__agent_availability_status,
    

FROM  {{ ref('stg_tickets') }} as tickets
LEFT JOIN {{ ref('dim_groups') }} as groups__group_id ON
        groups__group_id.id = tickets.group_id
