USE ROLE ACCOUNTADMIN;

CREATE DATABASE California_state;
CREATE DATABASE GEORGIA_STATE;
CREATE SCHEMA MARTS;

-- Command for dbt run to run a specific database: --select test_dynamic_mdl --vars '{"database_override":"Georgia_state"}'