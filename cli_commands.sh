# Initialize terraform and create the required AWS resources

cd terraform
terraform init
terraform plan
terraform apply 

# Run extract glue jobs (3 jobs)

aws glue start-job-run --job-name de-c4w4a2-api-users-extract-job | jq -r '.JobRunId'

aws glue start-job-run --job-name de-c4w4a2-api-sessions-extract-job | jq -r '.JobRunId'

aws glue start-job-run --job-name de-c4w4a2-rds-extract-job | jq -r '.JobRunId'

# Run transform glue jobs (2 jobs)

aws glue start-job-run --job-name de-c4w4a2-json-transform-job | jq -r '.JobRunId'

aws glue start-job-run --job-name de-c4w4a2-songs-transform-job | jq -r '.JobRunId'

# Outputs:

# data_lake_bucket = "de-c4w4a2-268760403445-us-east-1-data-lake"
# glue_api_users_extract_job = "de-c4w4a2-api-users-extract-job"
# glue_catalog_db = <sensitive>
# glue_json_transformation_job = "de-c4w4a2-json-transform-job"
# glue_rds_extract_job = "de-c4w4a2-rds-extract-job"
# glue_role_arn = "arn:aws:iam::268760403445:role/Cloud9-de-c4w4a2-glue-role"
# glue_sessions_users_extract_job = "de-c4w4a2-api-sessions-extract-job"
# glue_songs_transformation_job = "de-c4w4a2-songs-transform-job"
# scripts_bucket = "de-c4w4a2-268760403445-us-east-1-scripts"
# serving_schema = "deftunes_serving"
# sessions_db_ruleset_name = "sessions_dq_ruleset"
# songs_db_ruleset_name = "songs_dq_ruleset"
# transform_schema = "deftunes_transform"
# users_db_ruleset_name = "users_dq_ruleset"


# Execute DAGs
