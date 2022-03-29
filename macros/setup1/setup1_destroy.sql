{% macro setup1_destroy(database="MY_DATABASE", schema="MY_SCHEMA", role="MY_ROLE", warehouse="MY_WAREHOUSE", user="MY_USER") %}

    {% do log("snowflake_setup1_destroy started", info=True) %}
    {% set main %}

    drop database if exists {{ database }};
    drop role if exists {{ role }};
    drop warehouse if exists {{ warehouse }};
    drop user if exists {{ user }};

    {% endset %}    
    {% do run_query(main) %}

    {% do log("snowflake_setup1_destroy finished", info=True) %}
{% endmacro %}