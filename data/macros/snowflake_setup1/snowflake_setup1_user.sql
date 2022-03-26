{% macro snowflake_setup1_user(role, user, password, warehouse) %}

    -- user setup
    create or replace user {{ user }} password = '{{ password }}' must_change_password = true;

    alter user {{ user }} set 
        default_role = '{{ role }}' 
        default_warehouse = '{{ warehouse }}' 
        comment = 'dbt-qa user';
        --rsa_public_key = '{{ public_key }}'        

    grant role {{ role }} to user {{ user }};

{% endmacro %}
