{% macro snowflake_setup(database="MY_DATABASE", schema="MY_SCHEMA", role="MY_ROLE", warehouse="MY_WAREHOUSE", user="MY_USER", internal_stage="INTERNAL_STAGE") %}

    {% do log("Start transaction", info=True) %}
    {% set begin_transaction %}
    BEGIN TRANSACTION;
    {% endset %}
    {% do run_query(begin_transaction) %}

    {% do log("Snowflake Setup", info=True) %}
    {% set main %}
        {{ snowflake_setup_role(role) }}
        {% do log("Role setup: " ~ role, info=True) %}

        {{ snowflake_setup_warehouse(role, warehouse) }}
        {% do log("Warehouse setup: " ~ warehouse, info=True) %}

        {{ snowflake_setup_database(role, database) }}
        {% do log("Database setup: " ~ database, info=True) %}

        {{ snowflake_setup_schema(role, schema, database) }}
        {% do log("Schema setup: " ~ schema, info=True) %}

        {% set password = "MyTemporaryPassword" %}
        {{ snowflake_setup_user(role, user, password, warehouse) }}
        {% do log("User setup: " ~ user, info=True) %}
        {% do log("User temporary password: " ~ password, info=True) %}

        {{ snowflake_setup_internal_stage(role, internal_stage, database, schema) }}
        {% do log("Internal Stage setup: " ~ internal_stage, info=True) %}

    {% endset %}    
    {% do run_query(main) %}

    {% set end_transaction %}
    COMMIT;
    {% endset %}
    {% do run_query(end_transaction) %}
    {% do log("End transaction", info=True) %}

    {% do log("snowflake_setup executed", info=True) %}
{% endmacro %}