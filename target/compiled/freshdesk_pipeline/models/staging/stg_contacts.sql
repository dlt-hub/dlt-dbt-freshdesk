/* Table: contacts */


-- depends_on: `dlthub-sandbox`.`freshdesk_data_transformed`.`dlt_active_load_ids`

SELECT
/* select which columns will be available for table 'contacts' */
    active,
    address,
    email,
    id,
    language,
    name,
    phone,
    time_zone,
    created_at,
    updated_at,
    first_name,
    last_name,
    visitor_id,
    org_contact_id,
    _dlt_load_id,
    _dlt_id,
    preferred_source,
    company_id,
FROM `dlthub-sandbox`.`freshdesk_data`.`contacts`

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  `dlthub-sandbox`.`freshdesk_data_transformed`.`dlt_active_load_ids` )