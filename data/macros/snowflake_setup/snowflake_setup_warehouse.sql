{% macro snowflake_setup_warehouse(role, warehouse) %}

    -- Warehouse Setup
    CREATE WAREHOUSE IF NOT EXISTS {{ warehouse }}
        WITH WAREHOUSE_SIZE = XSMALL, AUTO_SUSPEND = 180, AUTO_RESUME = TRUE, COMMENT = 'Data Quality Warehouse';

    GRANT USAGE, OPERATE, MONITOR ON WAREHOUSE {{ warehouse }} TO ROLE {{ role }};

{% endmacro %}
