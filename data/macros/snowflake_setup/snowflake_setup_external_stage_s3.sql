{% macro snowflake_setup_external_stage_s3(role, stage, database, schema, s3_url, s3_aws_access_key, s3_aws_secret_key, s3_kms_key_id) %}

    -- Internal Stage Setup
    CREATE OR REPLACE STAGE {{ database }}.{{ schema }}.{{ stage }};
    URL = '{{ s3_url }}'
    CREDENTIALS = (AWS_KEY_ID = '{{ s3_aws_access_key }}') AWS_SECRET_KEY = '{{ s3_aws_secret_key }}')
    ENCRYPTION = (TYPE = 'AWS_SSE_KMS' KMS_KEY_ID = '{{ s3_kms_key_id }}')
    FILE_FORMAT = (TYPE = 'CSV');

    GRANT USAGE ON STAGE {{ database }}.{{ schema }}.{{ stage }} TO ROLE {{ role }};

{% endmacro %}
