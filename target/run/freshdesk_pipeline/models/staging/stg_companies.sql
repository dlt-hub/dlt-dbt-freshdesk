
  
    

    create or replace table `dlthub-sandbox`.`freshdesk_data_transformed`.`stg_companies`
      
    
    

    OPTIONS()
    as (
      /* Table: companies */


-- depends_on: `dlthub-sandbox`.`freshdesk_data_transformed`.`dlt_active_load_ids`

SELECT
/* select which columns will be available for table 'companies' */
    id,
    name,
    created_at,
    updated_at,
    account_tier,
    org_company_id,
    _dlt_load_id,
    _dlt_id,
FROM `dlthub-sandbox`.`freshdesk_data`.`companies`

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  `dlthub-sandbox`.`freshdesk_data_transformed`.`dlt_active_load_ids` )
    );
  