USE SCHEMA TASTY_BYTES_DBT_DB.dev;

create or replace task TASTY_BYTES_DBT_DB.DEV.BUILD_TABLES_DAILY
	warehouse=TASTY_BYTES_DBT_WH
	schedule='USING CRON 1 1 1 * * America/New_York'
	as EXECUTE DBT PROJECT tasty_bytes_dbt_db.dev.tasty_bytes_dbt_dev args='build --select config.materialized:table --target dev';

GRANT USAGE ON WAREHOUSE TASTY_BYTES_DBT_WH TO ROLE SYSADMIN;

EXECUTE TASK BUILD_TABLES_DAILY;

