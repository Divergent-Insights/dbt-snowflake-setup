{% macro snowflake_setup1_role(role) %}

    -- Role Setup
    create role if not exists {{ role }};
    grant role {{ role }} to role sysadmin; -- Allows administrators to control the new environment    

{% endmacro %}
