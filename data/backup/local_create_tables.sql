{% macro local_create_tables(db_name, schema_name) %}

    {% set sql %}
    CREATE TABLE IF NOT EXISTS {{ db_name }}.{{ schema_name }}.SRC_PIPELINE1
    COMMENT = "Source table created with a dbt macro"
    (
        COL1 INT,
        COL2 VARCHAR(100)
        --{{ dbt_custom_utils.set_metadata_columns() }}
    )
    {% endset %}

    {% do ru_query(sql) %}
    {% do log("Local macro executed: local_create_tables") %}

{% endmacro %}
