{% macro setup1(database=target.database, schema=target.schema, role="my_role", user="my_user", internal_stage="internal_stage", file_format="json") %}

    {% do log("setup1 started", info=True) %}

    {% set begin_transaction %}
    begin transaction;
    {% endset %}
    {% do run_query(begin_transaction) %}

    {% do log("Snowflake Setup", info=True) %}
    {% set main %}
        {{ snowflake_env_setup.setup1_account() }}
        {% do log("Account setup", info=True) %}        

        -- Setting everything uppercase to avoid Snowflake quoting and casing nightmares
        {% set database = database.upper() %}
        {% set schema = schema.upper() %}
        {% set role = role.upper() %}
        {% set user = user.upper() %}
        {% set internal_stage = internal_stage.upper() %}

        -- Role
        {{ snowflake_env_setup.setup1_role(role) }}
        {% do log("Role setup: " ~ role, info=True) %}

        -- Warehouses
        {% set nonprod_warehouse1 = "nonprod_warehouse1" %}        
        {{ snowflake_env_setup.setup1_warehouse(role, nonprod_warehouse1) }}
        {% do log("Warehouse setup: " ~ nonprod_warehouse1, info=True) %}
        {% set prod_warehouse1 = "prod_warehouse1" %}        
        {{ snowflake_env_setup.setup1_warehouse(role, prod_warehouse1) }}
        {% do log("Warehouse setup: " ~ prod_warehouse1, info=True) %}

        -- Database
        {{ snowflake_env_setup.setup1_database(role, database) }}
        {% do log("Database setup: " ~ database, info=True) %}

        -- Schema
        {{ snowflake_env_setup.setup1_schema(role, schema, database) }}
        {% do log("Schema setup: " ~ schema, info=True) %}

        -- Internal Stage
        {{ snowflake_env_setup.setup1_internal_stage(role, internal_stage, file_format, database, schema) }}
        {% do log("Internal Stage setup: " ~ internal_stage, info=True) %}
        {% do log("Internal Stage file format: " ~ file_format, info=True) %}

        -- User
        {% set password = "MyTemporaryPassword" %}        
        {{ snowflake_env_setup.setup1_user(role, user, password, nonprod_warehouse1, database) }}
        {% do log("User setup: " ~ user, info=True) %}
        {% do log("User temporary password: " ~ password, info=True) %}
        {% do log("Temporary password must be reset at https://app.snowflake.com/", info=True) %}
        {% do log("Account details: " ~ target.account, info=True) %}

    {% endset %}    
    {% do run_query(main) %}

    {% set end_transaction %}
    commit;
    {% endset %}
    {% do run_query(end_transaction) %}

    {% do log("snowflake_setup1 finished", info=True) %}
{% endmacro %}
