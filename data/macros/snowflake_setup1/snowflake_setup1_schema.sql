{% macro snowflake_setup1_schema(role, schema, database) %}

    -- internal stage setup
    create schema if not exists {{ database }}.{{ schema }} with managed access;

    grant usage on schema {{ database }}.{{ schema }} to role {{ role }};

    grant create file format on schema {{ database }}.{{ schema }} to role {{ role }};
    grant create table on schema {{ database }}.{{ schema }} to role {{ role }};
    grant create view on schema {{ database }}.{{ schema }} to role {{ role }};

{% endmacro %}
