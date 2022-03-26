{% macro snowflake_drop_tables(database, schema) %}

    -- Load Internal Stage
    -- Note file must contain full path location e.g. "/tmp/my_file.json"
    {% do log("snowflake_drop_tables started", info=True) %}
    {% do log("Database: " ~ database, info=True) %}
    {% do log("Schema: " ~ schema, info=True) %}

    {% set sql %}
    {% endset %}    
    {% do run_query(sql) %}

    {% do log(sql, info=True) %}
    {% do log("snowflake_drop_tables completed", info=True) %}

{% endmacro %}
