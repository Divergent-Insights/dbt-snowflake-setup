{% macro set_metadata_columns() %}

    {#
        Divergent Insights. All Rights Reserved
    #}

    md_data_source varchar comment 'metadata column',
    md_pipeline_id varchar comment 'metadata column',
    md_batch_id varchar comment 'metadata column',
    md_creation_date_utc timestamp_tz comment 'metadata column',
    md_update_date_utc timestamp_tz comment 'metadata column',
    md_commit_id varchar comment 'metadata column'

{% endmacro %}