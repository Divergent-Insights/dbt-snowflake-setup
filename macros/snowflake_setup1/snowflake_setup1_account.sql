{% macro snowflake_setup1_account() %}

    -- Account Setup
    alter account set quoted_identifiers_ignore_case = true;  -- Avoids quoting nightmare with Snowflake
    --select current_account();
    --select current_region();

{% endmacro %}
