{% macro setup1_database(role, database) %}

    create transient database if not exists {{ database }};
    grant all on database {{ database }} to role {{ role }};

{% endmacro %}
