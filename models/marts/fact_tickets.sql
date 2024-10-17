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
    
    ---- dim table contacts via contacts__requester_id
    contacts__requester_id.id as contacts__requester_id__id,
    -- contacts__requester_id.active as contacts__requester_id__active,
    -- contacts__requester_id.address as contacts__requester_id__address,
    -- contacts__requester_id.email as contacts__requester_id__email,
    -- contacts__requester_id.language as contacts__requester_id__language,
    -- contacts__requester_id.name as contacts__requester_id__name,
    -- contacts__requester_id.phone as contacts__requester_id__phone,
    -- contacts__requester_id.time_zone as contacts__requester_id__time_zone,
    -- contacts__requester_id.created_at as contacts__requester_id__created_at,
    -- contacts__requester_id.updated_at as contacts__requester_id__updated_at,
    -- contacts__requester_id.first_name as contacts__requester_id__first_name,
    -- contacts__requester_id.last_name as contacts__requester_id__last_name,
    -- contacts__requester_id.visitor_id as contacts__requester_id__visitor_id,
    -- contacts__requester_id.org_contact_id as contacts__requester_id__org_contact_id,
    -- contacts__requester_id.preferred_source as contacts__requester_id__preferred_source,
    -- contacts__requester_id.company_id as contacts__requester_id__company_id,
    

FROM  {{ ref('stg_tickets') }} as tickets
LEFT JOIN {{ ref('dim_groups') }} as groups__group_id ON
        groups__group_id.id = tickets.group_id

LEFT JOIN {{ ref('dim_contacts') }} as contacts__requester_id ON
        contacts__requester_id.id = tickets.requester_id
