{% macro setup1_warehouse(role, warehouse) %}

    create warehouse if not exists {{ warehouse }}
        with warehouse_size = xsmall, auto_suspend = 180, auto_resume = true, comment = 'Warehouse created by dbt-snowflake-setup';

    grant usage, operate, monitor on warehouse {{ warehouse }} to role {{ role }};

{% endmacro %}
