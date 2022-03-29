{% macro snowflake_setup1_external_stage_s3(role, stage, database, schema, s3_url, s3_aws_access_key, s3_aws_secret_key, s3_kms_key_id) %}

    -- Internal Stage Setup
    create or replace stage {{ database }}.{{ schema }}.{{ stage }};
    url = '{{ s3_url }}'
    credentials = (aws_key_id = '{{ s3_aws_access_key }}') aws_secret_key = '{{ s3_aws_secret_key }}')
    encryption = (type = 'aws_sse_kms' kms_key_id = '{{ s3_kms_key_id }}')
    file_format = (type = 'csv');

    grant usage on stage {{ database }}.{{ schema }}.{{ stage }} to role {{ role }};

{% endmacro %}
