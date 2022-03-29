{% macro setup1_role(role) %}

    create role if not exists {{ role }};
    grant role {{ role }} to role sysadmin; -- Allows existing administrators to control the new environment    

{% endmacro %}
