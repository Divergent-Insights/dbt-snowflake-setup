{% macro snowflake_setup_internal_stage(role, internal_stage, file_format, database, schema) %}

    {%- if file_format == 'JSON' -%}

        CREATE OR REPLACE FILE FORMAT {{ file_format }}_FORMAT TYPE = '{{ file_format }}' STRIP_OUTER_ARRAY = TRUE;

    {%- endif -%}
    

    -- Internal Stage Setup
    CREATE STAGE IF NOT EXISTS {{ database }}.{{ schema }}.{{ internal_stage }}
        FILE_FORMAT = {{ file_format }}_FORMAT;

    GRANT READ, WRITE ON STAGE {{ database }}.{{ schema }}.{{ internal_stage }} TO ROLE {{ role }};

{% endmacro %}
