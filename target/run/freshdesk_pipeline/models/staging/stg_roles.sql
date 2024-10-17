
  
    

    create or replace table `dlthub-sandbox`.`freshdesk_data_transformed`.`stg_roles`
      
    
    

    OPTIONS()
    as (
      /* Table: roles */


-- depends_on: `dlthub-sandbox`.`freshdesk_data_transformed`.`dlt_active_load_ids`

SELECT
/* select which columns will be available for table 'roles' */
    id,
    name,
    description,
    default,
    created_at,
    updated_at,
    agent_type,
    _dlt_load_id,
    _dlt_id,
FROM `dlthub-sandbox`.`freshdesk_data`.`roles`

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  `dlthub-sandbox`.`freshdesk_data_transformed`.`dlt_active_load_ids` )
    );
  