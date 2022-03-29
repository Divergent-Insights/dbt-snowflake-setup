{% macro snowflake_setup1(env, database=target.database, schema=target.schema, role="my_role", user="my_user", internal_stage="internal_stage", file_format="json") %}

    {% do log("snowflake_setup started", info=True) %}
        {{ snowflake_env_setup.snowflake_setup1_account() }}
        {% do log("Account setup", info=True) %}

        -- Setting everything uppercase to avoid Snowflake quoting and casing nightmares
        {% set database = database.upper() %}
        {% set schema = schema.upper() %}
        {% set role = role.upper() %}
        {% set user = user.upper() %}
        {% set internal_stage = internal_stage.upper() %}

        -- Role
        {{ snowflake_env_setup.snowflake_setup1_role(role) }}
        {% do log("Role setup: " ~ role, info=True) %}

        -- Warehouses
        {% set nonprod_warehouse1 = "nonprod_warehouse1" %}        
        {{ snowflake_env_setup.snowflake_setup1_warehouse(role, nonprod_warehouse1) }}
        {% do log("Warehouse setup: " ~ warehouse, info=True) %}
        {% set prod_warehouse1 = "prod_warehouse1" %}        
        {{ snowflake_env_setup.snowflake_setup1_warehouse(role, prod_warehouse1) }}
        {% do log("Warehouse setup: " ~ warehouse, info=True) %}

        -- Database
        {{ snowflake_env_setup.snowflake_setup1_database(role, database) }}
        {% do log("Database setup: " ~ database, info=True) %}

        -- Schema
        {{ snowflake_env_setup.snowflake_setup1_schema(role, schema, database) }}
        {% do log("Schema setup: " ~ schema, info=True) %}

        -- User
        {% set password = "MyTemporaryPassword" %}        
        {{ snowflake_env_setup.snowflake_setup1_user(role, user, password, nonprod_warehouse1, database) }}
        {% do log("User setup: " ~ user, info=True) %}
        {% do log("User temporary password: " ~ password, info=True) %}
        {% do log("Temporary password must be reset at https://app.snowflake.com/", info=True) %}

        -- Internal Stage
        {{ snowflake_env_setup.snowflake_setup1_internal_stage(role, internal_stage, file_format, database, schema) }}
        {% do log("Internal Stage setup: " ~ internal_stage, info=True) %}
        {% do log("Internal Stage file format: " ~ file_format, info=True) %}

    {% endset %}    
    {% do run_query(main) %}

    {% set end_transaction %}
    commit;
    {% endset %}
    {% do run_query(end_transaction) %}
    {% do log("End transaction", info=True) %}

    {% do log("snowflake_setup1 finished", info=True) %}
{% endmacro %}
