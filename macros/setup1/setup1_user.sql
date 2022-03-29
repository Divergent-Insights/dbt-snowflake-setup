{% macro setup1_user(role, user, password, warehouse, database) %}

    create or replace user {{ user }} password = '{{ password }}' must_change_password = true;

    alter user {{ user }} set 
        default_role = '{{ role }}' 
        default_warehouse = '{{ warehouse }}'
        default_namespace = '{{ database }}'
        comment = 'User created by dbt-snowflake-setup';
        --rsa_public_key = '{{ public_key }}'        

    grant role {{ role }} to user {{ user }};

{% endmacro %}
