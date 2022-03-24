-- Use this macro to run local SQL statements
-- When present, this macro is run automatically by the CI/CD solution before dbt_run


{% macro local_pre_sql(db_name, schema_name) }
    -- Custom SQL
    {% set sql %}

    -- Custom SQL goes here
    SELECT 1
    -- CREATE OR REPLACE FILE FORMAT {{ db_name }}.{{ schema_name }}.JSON_FORMAT TYPE='JSON';

    {% endset %}
    {% do run_query(sql) %}

    -- Additional local macros
    {{ local_copy_s3_to_snowflake(db_name, schema_name) }}

    {% do log("Local pre SQL macro exected", info=True) %}
{% endmacro %}