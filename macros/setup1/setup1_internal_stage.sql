{% macro setup1_internal_stage(role, stage, file_format, database, schema) %}

    create stage if not exists {{ database }}.{{ schema }}.{{ stage }}
        file_format = ( type = {{ file_format }} );

    grant read, write on stage {{ database }}.{{ schema }}.{{ stage }} to role {{ role }};

{% endmacro %}
