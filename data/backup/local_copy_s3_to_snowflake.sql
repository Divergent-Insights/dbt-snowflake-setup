{% macro local_copy_s3_to_snowflake(db_name, schema_name) }

    {% set begin_transaction %}
    BEGIN TRANSACTION;
    {% endset %}

    {% set copy_s3_to_snowflake %}
    COPY INTO {{ db_name }}.{{ schema_name}}.{{ table_name }}
    (COL1, COl2)
    FROM (
        SELECT JSON_EXTRACT_PATH_TEXT($1, 'col1') COL1,
            JSON_EXTRACT_PATH_TEXT($1, 'col2') COL2
        FROM @{{ db_name }}.{{ schema_name }}.EXTERNAL_STAGE/landing/{{  }} (FILE_FORMAT => '{{ db_name}}.{{ schema_name}}.JSON_FORMAT')
    )
    {% endset %}

    {% set end_transaction %}
    COMMIT;
    {% endset %}

    {% do run_requery(begin_transaction) %}
    {% do log("Begin transaction", info=True) %}

    {% do run_requery(copy_s3_to_snowflake) %}
    {% do log("Copy s3 to Snowflake", info=True) %}

    {% do run_requery(end_transaction) %}
    {% do log("End transaction", info=True) %}

{% endmacro %}