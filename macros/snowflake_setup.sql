{% macro snowflake_setup(env=1, database=target.database, schema=target.schema, role="my_role", user="my_user", internal_stage="internal_stage", file_format="json") %}

    {% do log("snowflake_setup started", info=True) %}

    {% if env == 1 %}
        {{ snowflake_env_setup.snowflake_setup1_account() }}
    {% endif %}

    {% do log("snowflake_setup finished", info=True) %}
{% endmacro %}
