-- Use this macro to run local SQL statements
-- When present, this macro is run automatically by the CI/CD solution after dbt_run


{% macro local_post_sql(db_name, schema_name) }
{% set sql %}

-- SQL statements go here
SELECT 1

{% endset %}

{% do run_query(sql) %}
{% do log("Local post SQL macro exected", info=True) %}
{% endmacro %}