{% macro snowflake_load_internal_stage(database, schema, stage, file) %}

    -- Load Internal Stage
    -- Note file must contain full path location e.g. "/tmp/my_file.json"
    PUT FILE:///tmp/sales.json @{{ database }}.{{ schema }}.{{ stage }} AUTO_COMPRESS=TRUE;

{% endmacro %}
