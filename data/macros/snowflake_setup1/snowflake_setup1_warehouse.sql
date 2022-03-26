{% macro snowflake_setup1_warehouse(role, warehouse) %}

    -- warehouse setup
    create warehouse if not exists {{ warehouse }}
        with warehouse_size = xsmall, auto_suspend = 180, auto_resume = true, comment = 'data quality warehouse';

    grant usage, operate, monitor on warehouse {{ warehouse }} to role {{ role }};

{% endmacro %}
