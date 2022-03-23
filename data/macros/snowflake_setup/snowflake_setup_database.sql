{% macro snowflake_setup_database(role, database) %}

    -- Database Setup
    CREATE TRANSIENT DATABASE IF NOT EXISTS {{ database }};
    GRANT ALL ON DATABASE {{ database }} TO ROLE {{ role }};

{% endmacro %}
