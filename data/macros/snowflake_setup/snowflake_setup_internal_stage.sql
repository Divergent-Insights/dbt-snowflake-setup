{% macro snowflake_setup_internal_stage(role, stage, file_format, database, schema) %}

    {%- if file_format == 'JSON' -%}

        CREATE OR REPLACE FILE FORMAT {{ database }}.{{ schema }}.{{ file_format }}_FORMAT TYPE = '{{ file_format }}' STRIP_OUTER_ARRAY = TRUE;
        {% do log("Hello0", info=True) %}

    {%- endif -%}
    
    {% do log("Hello1", info=True) %}

    -- Internal Stage Setup
    CREATE STAGE IF NOT EXISTS {{ database }}.{{ schema }}.{{ stage }}
        FILE_FORMAT = {{ file_format }}_FORMAT;

    GRANT READ, WRITE ON STAGE {{ database }}.{{ schema }}.{{ stage }} TO ROLE {{ role }};

{% endmacro %}
