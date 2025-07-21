# Getting Started with dbt on Snowflake

## Overview

This repository contains an example dbt project to get you started with dbt on Snowflake. 

## Use Jinja quickstart
https://docs.getdbt.com/guides/using-jinja?step=1

## Snowflake tutorial
https://docs.snowflake.com/en/user-guide/data-engineering/dbt-projects-on-snowflake-getting-started-tutorial

## Jinja dbt docs
https://docs.getdbt.com/docs/build/jinja-macros

## Activate venv for dbt-core by
`source .venv/bin/activate`

## Install uv
1. install uv
2. setup uv venv
3. uv sync
4. install dbt deps via invoking uv run dbt deps
5. activate the venv: source .venv/bin/activate
6. cd into the dbt project

## Run dbt commands
- Remember that any dbt command needs to be ended with `--target dev_local` for the right target from profiles.yml