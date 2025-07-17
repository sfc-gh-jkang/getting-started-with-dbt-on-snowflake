SHOW TABLES IN DATABASE tasty_bytes_dbt_db;

SHOW VIEWS IN DATABASE tasty_bytes_dbt_db;

USE ROLE ACCOUNTADMIN;

GRANT OWNERSHIP ON DATABASE TASTY_BYTES_DBT_DB TO ROLE SYSADMIN;
GRANT OWNERSHIP ON SCHEMA TASTY_BYTES_DBT_DB.DEV to ROLE SYSADMIN;
GRANT OWNERSHIP ON SCHEMA TASTY_BYTES_DBT_DB.PROD to ROLE SYSADMIN;
GRANT ALL PRIVILEGES ON DATABASE TASTY_BYTES_DBT_DB TO ROLE SYSADMIN;

SHOW DBT PROJECTS;

CREATE OR ALTER TASK tasty_bytes_dbt_db.dev.run_prepped_data_dbt
  WAREHOUSE = tasty_bytes_dbt_wh
  SCHEDULE = '24 HOURS'
AS
EXECUTE DBT PROJECT tasty_bytes_dbt_db.dev.tasty_bytes_dbt_dev args='run --select customer_loyalty_metrics';

-- Tasks are created in a suspended state by default.

-- Use the following command to run the task immediately:

EXECUTE TASK tasty_bytes_dbt_db.dev.run_prepped_data_dbt;

-- Use the following command to resume the task so that it runs on schedule:

ALTER TASK tasty_bytes_dbt_db.dev.run_prepped_data_dbt RESUME;