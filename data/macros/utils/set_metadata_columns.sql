{% macro set_metadata_columns() %}

    {#
        Divergent Insights. All Rights Reserved
    #}

    MD_DATA_SOURCE VARCHAR COMMENT 'Metadata columns',
    MD_PIPELINE_ID VARCHAR COMMENT 'Metadata columns',
    MD_BATCH_ID VARCHAR COMMENT 'Metadata columns',
    MD_CREATION_DATE_UTC TIMESTAMP_TZ COMMENT 'Metadata columns',
    MD_UPDATE_DATE_UTC TIMESTAMP_TZ COMMENT 'Metadata columns',
    MD_PIPELINE_NAME VARCHAR COMMENT 'Metadata columns',
    MD_COMMIT_ID VARCHAR COMMENT 'Metadata columns'

{% endmacro %}