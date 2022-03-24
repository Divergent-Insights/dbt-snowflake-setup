{% macro local_create_user(username) %}

    {% set sql %}
    CREATE DATABASE IF NOT EXISTS {{ db_name }}
    {% endset %}

    {% do ru_query(sql) %}
    {% do log("Local macro executed: local_create_database", info=True) %}

{% endmacro %}
