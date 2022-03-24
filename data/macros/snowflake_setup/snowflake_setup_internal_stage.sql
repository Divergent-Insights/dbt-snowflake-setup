{% macro snowflake_setup_internal_stage(role, stage, file_format, database, schema) %}

    {%- if file_format == 'JSON' -%}    
        --CREATE OR REPLACE FILE FORMAT {{ database }}.{{ schema }}.{{ file_format }}_FORMAT TYPE = '{{ file_format }}' STRIP_OUTER_ARRAY = TRUE;
    {%- endif -%}

    -- Internal Stage Setup
    CREATE STAGE IF NOT EXISTS {{ database }}.{{ schema }}.{{ stage }}
        FILE_FORMAT = ( TYPE = {{ file_format }} );

    GRANT READ, WRITE ON STAGE {{ database }}.{{ schema }}.{{ stage }} TO ROLE {{ role }};

{% endmacro %}
