# Snowflake Environment Setup

This [dbt](https://github.com/dbt-labs/dbt-core) package helps to create, configure and destroy Snowflake environments.

There are many different ways on how Snowflake storage and compute can be organised and this package helps to implement 
the most common setups programmatically. This package can be very handy for data engineering automation (CI/CD)

## Installation Instructions
Check [dbt Hub](https://hub.getdbt.com/montreal-analytics/snowflake_utils/latest/) for the latest installation instructions, or [read the docs](https://docs.getdbt.com/docs/package-management) for more information on installing packages.

## Prerequisites
- This package is compatible with dbt 1.0.0 and later.
- Snowflake credentials with the right level of access to create/destroy and configure the following objects: role, user, database, schema, warehouse (these are high level priviledges)

----

## Package Overview

This package provides a set of macros that are grouped logically, where each group provides "opinionated" logic and specialises on setting up a Snowflake environment 
in very specific way. However, the logic can easily be expanded and adjusted to suit different needs

Each environment setup focuses on implementing the following Snowflake resources:
- Account (configuration only)
- Role (creation and configuration)
- Warehouse (creation and configuration)
- Database (creation and configuration)
- Schema (creation and confiugration)
- User (creation and configuration)
- Internal Stage (creation and configuration)

## Environment Setups Available

### Setup 1
- Account: the flag quoted_identifiers_ignore_case is enabled
- Role: dedicated Admin role is created and given full access the the environment
- Warehouse: two Warehouses are created: non-pro and prod
- Database: a new database is created (by default it points to the target database)
- Schema: a new schema is created (by default it points to the target schema)
- User: a new user is created with a temporary password. By default the user is asigned to the new role, warehouse and database
- Internal Stage: a new internal stage is created on the relevant schema

## Usage
```
dbt run-operation snowflake_setup

dbt run-operation snowflake_setup --args "{env: 1, user: my_loader_user}"
```

Note that all arguments are optional. These are the default values:
- env=1
- database=target.database
- schema=target.schema
- role="my_role"
- user="my_user"
- internal_stage="internal_stage"
- file_format="json"
