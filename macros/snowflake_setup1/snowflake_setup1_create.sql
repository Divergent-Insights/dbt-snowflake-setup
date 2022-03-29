{% macro snowflake_setup1_create(database="my_database", schema="my_schema", role="my_loader_role", user="my_loader_user", internal_stage="internal_stage", file_format="json") %}

    {% do log("snowflake_setup1_create started", info=True) %}
    {% set begin_transaction %}
    BEGIN TRANSACTION;
    {% endset %}
    {% do run_query(begin_transaction) %}

    {% do log("Snowflake Setup", info=True) %}
    {% set main %}
        {{ custom_dbt_utils.snowflake_setup1_account() }}
        {% do log("Account setup", info=True) %}

        -- Setting everything uppercase to avoid Snowflake quoting and casing nightmares
        {% set database = database.upper() %}
        {% set schema = schema.upper() %}
        {% set role = role.upper() %}
        {% set user = user.upper() %}
        {% set internal_stage = internal_stage.upper() %}

        {{ custom_dbt_utils.snowflake_setup1_role(role) }}
        {% do log("Role setup: " ~ role, info=True) %}

        {% set nonprod_warehouse1 = "nonprod_warehouse1" %}        
        {{ custom_dbt_utils.snowflake_setup1_warehouse(role, nonprod_warehouse1) }}
        {% do log("Warehouse setup: " ~ warehouse, info=True) %}
        {% set prod_warehouse1 = "prod_warehouse1" %}        
        {{ custom_dbt_utils.snowflake_setup1_warehouse(role, prod_warehouse1) }}
        {% do log("Warehouse setup: " ~ warehouse, info=True) %}

        {{ custom_dbt_utils.snowflake_setup1_database(role, database) }}
        {% do log("Database setup: " ~ database, info=True) %}

        {{ custom_dbt_utils.snowflake_setup1_schema(role, schema, database) }}
        {% do log("Schema setup: " ~ schema, info=True) %}

        {% set password = "MyTemporaryPassword" %}        
        {{ custom_dbt_utils.snowflake_setup1_user(role, user, password, nonprod_warehouse1, database) }}
        {% do log("User setup: " ~ user, info=True) %}
        {% do log("User temporary password: " ~ password, info=True) %}
        {% do log("Temporary password must be reset at https://app.snowflake.com/", info=True) %}

        {{ custom_dbt_utils.snowflake_setup1_internal_stage(role, internal_stage, file_format, database, schema) }}
        {% do log("Internal Stage setup: " ~ internal_stage, info=True) %}
        {% do log("Internal Stage file format: " ~ file_format, info=True) %}

    {% endset %}    
    {% do run_query(main) %}

    {% set end_transaction %}
    COMMIT;
    {% endset %}
    {% do run_query(end_transaction) %}
    {% do log("End transaction", info=True) %}

    {% do log("snowflake_setup1_create finished", info=True) %}
{% endmacro %}
