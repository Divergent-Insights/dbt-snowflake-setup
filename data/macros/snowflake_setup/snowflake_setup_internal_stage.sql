{% macro snowflake_setup_internal_stage(role, internal_stage, database, schema) %}

    -- Internal Stage Setup
    CREATE STAGE IF NOT EXISTS {{ database }}.{{ schema }}.{{ internal_stage }};

    GRANT READ, WRITE ON STAGE {{ database }}.{{ schema }}.{{ internal_stage }} TO ROLE {{ role }};

{% endmacro %}
