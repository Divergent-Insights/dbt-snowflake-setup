{% macro snowflake_clean_internal_stage(database, schema, stage, pattern="*.*") %}

    -- Load Internal Stage
    -- Note file must contain full path location e.g. "/tmp/my_file.json"
    {% do log("snowflake_load_internal_stage started", info=True) %}
    {% do log("Database: " ~ database, info=True) %}
    {% do log("Schema: " ~ schema, info=True) %}
    {% do log("Stage: " ~ stage, info=True) %}
    {% do log("File: " ~ file, info=True) %}

    {% set sql %}
        remove @{{ database }}.{{ schema }}.{{ stage }} pattern='.{{ pattern }}';
    {% endset %}    
    {% do run_query(sql) %}

    {% do log(sql, info=True) %}
    {% do log("snowflake_clean_internal_stage completed", info=True) %}

{% endmacro %}
