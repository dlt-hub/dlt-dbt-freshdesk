
  
    

    create or replace table `dlthub-sandbox`.`freshdesk_data_transformed`.`stg_agents`
      
    
    

    OPTIONS()
    as (
      /* Table: agents */


-- depends_on: `dlthub-sandbox`.`freshdesk_data_transformed`.`dlt_active_load_ids`

SELECT
/* select which columns will be available for table 'agents' */
    available,
    occasional,
    id,
    ticket_scope,
    created_at,
    updated_at,
    last_active_at,
    type,
    contact__active,
    contact__email,
    contact__language,
    contact__name,
    contact__phone,
    contact__time_zone,
    contact__created_at,
    contact__updated_at,
    deactivated,
    focus_mode,
    _dlt_load_id,
    _dlt_id,
FROM `dlthub-sandbox`.`freshdesk_data`.`agents`

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  `dlthub-sandbox`.`freshdesk_data_transformed`.`dlt_active_load_ids` )
    );
  