# Freshdesk dlt-dbt Package

### Overview
The Freshdesk dlt-dbt package offers data models to help you transform and analyze Freshdesk data. It's designed to integrate seamlessly with the dlt Freshdesk pipeline, which extracts and loads Freshdesk data into your data warehouse.

### Who is this for?
This package is perfect for dbt users who want to integrate Freshdesk data into their analytics workflows without building models from scratch.


### Key Features
- **Staging Models:** Clean and prepare raw Freshdesk data for downstream analysis.
- **Mart Models:** Pre-built dimension and fact tables for key Freshdesk entities like tickets, agents, contacts, companies, groups and roles.
- **Incremental Loading:** Supports incremental data processing to optimize performance.
- **Easy Integration:** Designed to work out-of-the-box with the dlt Freshdesk pipeline.

### Setup Instructions

#### Prerequisites
- dbt Core installed in your environment.
- Access to a supported data warehouse: BigQuery, Snowflake, Redshift, Athena, or PostgreSQL.
- The dlt Freshdesk pipeline is set up and running.

### Step 1: Set Up the dlt Freshdesk Pipeline
1. **Install dlt:**
   ``` 
   pip install dlt
   ```
2. **Configure the Pipeline:**
   Follow the dlt Freshdesk pipeline documentation to set up your pipeline. Ensure you have your Freshdesk API key and destination credentials configured.

3. **Run the Pipeline:**
   Extract and load data from Freshdesk into your data warehouse by running the pipeline.

### Step 2: Install and Configure the dbt Project

1. Install the Freshdesk dbt package into your dbt environment.
2. Configure your 'dbt_project.yml' file with the appropriate connection details for your data warehouse.
3. Ensure the data from your dlt Freshdesk pipeline is available in your warehouse.

This is how the tables in dbt package look like:
```
dbt_freshdesk_pipeline/
├── analysis/
├── dbt_packages/
├── logs/
├── macros/
├── marts /
├── models/
│   ├── marts/
│   │   ├── dim__dlt_loads.sql
│   │   ├── dim_agents.sql
│   │   ├── dim_companies__domains.sql
│   │   ├── dim_companies.sql
│   │   ├── dim_contacts.sql
│   │   ├── dim_groups.sql
│   │   ├── dim_roles.sql
│   │   └── fact_tickets.sql
│   ├── staging/
│   │   ├── stg__dlt_loads.sql
│   │   ├── stg_agents.sql
│   │   ├── stg_companies__domains.sql
│   │   ├── stg_companies.sql
│   │   ├── stg_contacts.sql
│   │   ├── stg_groups.sql
│   │   ├── stg_roles.sql
│   │   ├── stg_tickets.sql
│   ├── dlt_active_load_ids.sql
│   ├── dlt_processed_load_ids.sql
│   ├── sources.yml
├── target/
├── tests/
├── dbt_project.yml
└── requirements.txt
```

### Step 3: Run dbt
Execute the dbt models to transform the raw Freshdesk data into useful tables:

```sh
dbt run
```

>You can use the 'run_Freshdesk_dbt.py' script to execute your dbt transformations and load the results into a 
>new dataset named `<original-dataset>_transformed` and runs the dbt tests.To use, please ensure you configure 
>your dlt pipeline name and destination correctly.

### Customization
While this package provides a solid foundation, you can customize it to suit your specific needs:

- Modify the models to align with your business logic.
- Add relationships between tables by modifying your dlt pipeline schema.

> The dimensional modelling part of the package was created with a declarative code generator and suffers from 
> limitations inherent to modelling raw data directly. We advise you consider the raw data tables and adjust 
> the modelled layer as needed.

### Schema diagram
The dbt model above can be further customized according to the requirements. Using this package you'll get a basic template
for data model which can be further modified as required.

1. The schema of data modelled above using dlt-dbt-generator:
    
   ![picture](https://storage.googleapis.com/dlt-blog-images/freshdesk-dlt-dbt.png)

   > Please note that this is a starting template for your data model and is not the final product. It is advised to customize the
   > data model as per your needs.

   Here's the link to the DB diagram: [link](https://dbdiagram.io/d/freshdesk-dlt-dbt-67076a6b97a66db9a37e0e94).

#### Optional: Advanced Usage (Generator and Licensing)

This package was created using the dlt-dbt-generator by dlt-plus. For more information about dlt-plus, refer to the 
[dlt-plus documentation.](https://dlt-plus.netlify.app/docs/plus/intro/).To learn more about the dlt-dbt-generator, 
consult the [dlt-dbt-generator](https://dlt-plus.netlify.app/docs/plus/dlt_dbt_generator/#5-running-dbt-package-directly) documentation.

> The dimensional modelling part of the package was created with a declarative code generator and suffers from 
> limitations inherent to modelling raw data directly. We advise you consider the raw data tables and adjust 
> the modelled layer as needed