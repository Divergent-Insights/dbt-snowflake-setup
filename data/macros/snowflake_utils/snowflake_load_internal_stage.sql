{% macro snowflake_load_internal_stage(database, schema, stage, file, overwrite="true") %}

    -- Load Internal Stage
    -- Note file must contain full path location e.g. "/tmp/my_file.json"
    {% do log("snowflake_load_internal_stage started", info=True) %}
    {% do log("Database: " ~ database, info=True) %}
    {% do log("Schema: " ~ schema, info=True) %}
    {% do log("Stage: " ~ stage, info=True) %}
    {% do log("File: " ~ file, info=True) %}
    {% do log("Overwrite: " ~ overwrite, info=True) %}

    {% set sql %}
        put file://{{ file }} @{{ database }}.{{ schema }}.{{ stage }} auto_compress=true overwrite = {{ overwrite }};
    {% endset %}    
    {% do run_query(sql) %}

    {% do log(sql, info=True) %}
    {% do log("snowflake_load_internal_stage completed", info=True) %}

{% endmacro %}
