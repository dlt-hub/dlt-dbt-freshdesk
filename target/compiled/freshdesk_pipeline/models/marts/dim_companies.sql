/* Table: companies */

SELECT
    t.id,
    t.name,
    t.created_at,
    t.updated_at,
    t.account_tier,
    t.org_company_id,
    t._dlt_load_id,
    t._dlt_id,
FROM  `dlthub-sandbox`.`freshdesk_data_transformed`.`stg_companies` as t