{% macro snowflake_setup_schema(role, schema, database) %}

    -- Internal Stage Setup
    SELECT 1;
    CREATE SCHEMA IF NOT EXISTS {{ database }}.{{ schema }} WITH MANAGED ACCESS;

    GRANT USAGE ON SCHEMA {{ database }}.{{ schema }} TO ROLE {{ role }};

    GRANT CREATE FILE FORMAT ON SCHEMA {{ database }}.{{ schema }} TO ROLE {{ role }};
    GRANT CREATE TABLE ON SCHEMA {{ database }}.{{ schema }} TO ROLE {{ role }};
    GRANT CREATE VIEW ON SCHEMA {{ database }}.{{ schema }} TO ROLE {{ role }};

{% endmacro %}
