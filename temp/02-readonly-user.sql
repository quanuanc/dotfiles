-- Connect as superuser (postgres) to execute these commands
-- Replace 'urp_test_ro', 'urp_ui', 'urp_api' and 'password' with your actual values

-- 1. Create the readonly user
CREATE
    USER urp_test_ro WITH PASSWORD 'password' LOGIN;

-- 2. Grant CONNECT privilege to both databases
GRANT CONNECT
    ON DATABASE urp_ui TO urp_test_ro;
GRANT CONNECT
    ON DATABASE urp_api TO urp_test_ro;

-- 3. Connect to the first database and grant schema and table privileges
\c
urp_ui

-- Grant USAGE on public schema
GRANT USAGE ON SCHEMA public TO urp_test_ro;

-- Grant SELECT on all existing tables in public schema
GRANT
    SELECT
    ON ALL TABLES IN SCHEMA public TO urp_test_ro;

-- Grant SELECT on all existing sequences in public schema (for serial columns)
GRANT
    SELECT
    ON ALL SEQUENCES IN SCHEMA public TO urp_test_ro;

-- Grant SELECT on future tables that will be created in public schema
ALTER
    DEFAULT PRIVILEGES IN SCHEMA public GRANT
    SELECT
    ON TABLES TO urp_test_ro;

-- Grant SELECT on future sequences that will be created in public schema
ALTER
    DEFAULT PRIVILEGES IN SCHEMA public GRANT
    SELECT
    ON SEQUENCES TO urp_test_ro;

-- 4. Connect to the second database and grant the same privileges
\c
urp_api

-- Grant USAGE on public schema
GRANT USAGE ON SCHEMA public TO urp_test_ro;

-- Grant SELECT on all existing tables in public schema
GRANT
    SELECT
    ON ALL TABLES IN SCHEMA public TO urp_test_ro;

-- Grant SELECT on all existing sequences in public schema
GRANT
    SELECT
    ON ALL SEQUENCES IN SCHEMA public TO urp_test_ro;

-- Grant SELECT on future tables that will be created in public schema
ALTER
    DEFAULT PRIVILEGES IN SCHEMA public GRANT
    SELECT
    ON TABLES TO urp_test_ro;

-- Grant SELECT on future sequences that will be created in public schema
ALTER
    DEFAULT PRIVILEGES IN SCHEMA public GRANT
    SELECT
    ON SEQUENCES TO urp_test_ro;
