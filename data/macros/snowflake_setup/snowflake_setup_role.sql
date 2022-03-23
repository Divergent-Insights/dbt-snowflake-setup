{% macro snowflake_setup_role(role) %}

    -- Role Setup
    CREATE ROLE IF NOT EXISTS {{ role }};
    GRANT ROLE {{ role }} TO ROLE SYSADMIN; -- Allows administrators to control the new environment

{% endmacro %}
