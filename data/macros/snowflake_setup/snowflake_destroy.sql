{% macro snowflake_destroy(database="MY_DATABASE", schema="MY_SCHEMA", role="MY_ROLE", warehouse="MY_WAREHOUSE", user="MY_USER") %}

    {% do log("Snowflake Destroy", info=True) %}
    {% set main %}

    DROP DATABASE IF EXISTS {{ database }};
    DROP ROLE IF EXISTS {{ role }};
    DROP WAREHOUSE IF EXISTS {{ warehouse }};
    DROP USER IF EXISTS {{ user }};

    {% endset %}    
    {% do run_query(main) %}

    {% do log("snowflake_destroy executed", info=True) %}
{% endmacro %}