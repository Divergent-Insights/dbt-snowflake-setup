{% macro snowflake_create_variant_table(database, schema, table="stg_var__table1", replace=false) %}

    -- Load Internal Stage
    -- Note file must contain full path location e.g. "/tmp/my_file.json"
    {% do log("snowflake_create_variant_table started", info=True) %}
    {% do log("Database: " ~ database, info=True) %}
    {% do log("Schema: " ~ schema, info=True) %}
    {% do log("Table: " ~ table, info=True) %}

    {% set sql %}
        {% if replace == false %}
            create table if not exists {{ database }}.{{ schema }}.{{ table }}
        {% else %}
            create or replace table {{ database }}.{{ schema }}.{{ table }}
        {% endif %}
        (
            upload_timestamp_utc timestamp_tz,
            filename string,          
            payload variant,
            payload_timestamp_utc timestamp_tz
        ); 
    {% endset %}    
    {% do run_query(sql) %}

    {% do log(sql, info=True) %}
    {% do log("snowflake_create_variant_table completed", info=True) %}

{% endmacro %}