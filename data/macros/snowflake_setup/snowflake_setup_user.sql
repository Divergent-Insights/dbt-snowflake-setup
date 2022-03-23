{% macro snowflake_setup_user(role, user, password, warehouse) %}

    -- User Setup
    CREATE OR REPLACE USER {{ user }} PASSWORD = '{{ password }}' MUST_CHANGE_PASSWORD = TRUE;

    ALTER USER {{ user }} SET 
        DEFAULT_ROLE = '{{ role }}' 
        DEFAULT_WAREHOUSE = '{{ warehouse }}' 
        COMMENT = 'dbt-qa user';
    --RSA_PUBLIC_KEY = '{{ public_key }}'        

    GRANT ROLE {{ role }} TO USER {{ user }};

{% endmacro %}
