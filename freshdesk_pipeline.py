import dlt

from freshdesk import freshdesk_source
from dlt_plus.dbt_generator.utils import table_reference_adapter


def load_endpoints() -> None:
    """
    This demo script loads all the default endpoints in 'freshdesk/settings.py'
    using incremental loading, it uses append mode to load data.
    """

    pipeline = dlt.pipeline(
        pipeline_name="freshdesk_pipeline",
        destination='bigquery',
        dataset_name="freshdesk_data",
    )

    """
    Adding table relationship adapters manually to define table relationships
    """

    table_reference_adapter(
        pipeline,
        "tickets",
        references=[
            {
                "referenced_table": "contacts",
                "columns": ["requester_id"],
                "referenced_columns": ["id"],
            }
        ], )

    table_reference_adapter(
        pipeline,
        "contacts",
        references=[
            {
                "referenced_table": "companies",
                "columns": ["company_id"],
                "referenced_columns": ["id"],
            }
        ], )

    table_reference_adapter(
        pipeline,
        "roles",
        references=[
            {
                "referenced_table": "agents",
                "columns": ["agent_type"],
                "referenced_columns": ["type"],
            }
        ], )

    table_reference_adapter(
        pipeline,
        "tickets",
        references=[
            {
                "referenced_table": "groups",
                "columns": ["group_id"],
                "referenced_columns": ["id"],
            }
        ], )

    # Run the pipeline
    load_info = pipeline.run(freshdesk_source())

    # Print the pipeline run information
    print(load_info)


def load_selected_endpoints() -> None:
    """
    This demo script loads selected endpoints. It loads the endpoints
    incrementally and uses append mode for loading data.
    """

    pipeline = dlt.pipeline(
        pipeline_name="freshdesk_pipeline",
        destination='bigquery',
        dataset_name="freshdesk_data",
    )

    # Load data from selected endpoints
    source = freshdesk_source().with_resources("agents", "contacts", "tickets")

    # Run the pipeline
    load_info = pipeline.run(source)

    # Print the pipeline run information
    print(load_info)


if __name__ == "__main__":
    # To load all the default endpoints
    load_endpoints()

    # To load data from selective endpoints
    #load_selected_endpoints()
