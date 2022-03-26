{% macro snowflake_load_variant_table(database, schema, table, stage) %}

    -- Load Internal Stage
    -- Note file must contain full path location e.g. "/tmp/my_file.json"
    {% do log("snowflake_load_variant_table started", info=True) %}
    {% do log("Database: " ~ database, info=True) %}
    {% do log("Schema: " ~ schema, info=True) %}
    {% do log("Table: " ~ table, info=True) %}
    {% do log("Stage: " ~ stage, info=True) %}

    {% set sql %}
        begin;
        copy into {{ database }}.{{ schema }}.{{ table }}
        from
            (
                select
                sysdate()::timestamp_tz as upload_timestamp_utc,
                metadata$filename as filename,
                $1 as payload,
                $1:metadata:generated_at::timestamp_tz as payload_timestamp_utc
                from  @{{ database }}.{{ schema }}.{{ stage }}
            )
            file_format=(type='JSON')
            on_error='skip_file';
        commit;        
    {% endset %}    
    {% do run_query(sql) %}

    {% do log(sql, info=True) %}
    {% do log("snowflake_load_variant_table completed", info=True) %}

{% endmacro %}
