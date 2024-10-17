
  
    

    create or replace table `dlthub-sandbox`.`freshdesk_data_transformed`.`stg_groups`
      
    
    

    OPTIONS()
    as (
      /* Table: groups */


-- depends_on: `dlthub-sandbox`.`freshdesk_data_transformed`.`dlt_active_load_ids`

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
FROM `dlthub-sandbox`.`freshdesk_data`.`groups`

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  `dlthub-sandbox`.`freshdesk_data_transformed`.`dlt_active_load_ids` )
    );
  