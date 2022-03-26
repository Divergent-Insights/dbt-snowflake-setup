{% macro snowflake_setup_internal_stage(role, stage, file_format, database, schema) %}

    -- Internal Stage Setup
    CREATE STAGE IF NOT EXISTS {{ database }}.{{ schema }}.{{ stage }}
        FILE_FORMAT = ( TYPE = {{ file_format }} );

    GRANT READ, WRITE ON STAGE {{ database }}.{{ schema }}.{{ stage }} TO ROLE {{ role }};

{% endmacro %}
