{% macro snowflake_setup1_database(role, database) %}

    -- Database Setup
    create transient database if not exists {{ database }};
    grant all on database {{ database }} to role {{ role }};
    --grant manage grants on {{ database }} to {{ role }}

{% endmacro %}
