-- Create Database 'DataWarehouse'
/*
============================================================
Create Database 'DataWarehouse' and Schemas for Data Layers
============================================================
Script Purpose:
This script creates a new database named 'DataWarehouse' and
sets up three schemas within it:
    1. bronze - for raw data ingestion
    2. silver - for cleaned and transformed data
    3. gold - for aggregated and business-level data

WARNING: Running this script will drop the existing
'DataWarehouse' database if it exists, resulting in data loss.
Ensure you have backups if necessary.
 */

USE master;

-- Drop and recreate the DataWarehouse database if it exists
IF EXISTS (
    SELECT
        name
    FROM
        sys.databases
    WHERE
        name = 'DataWarehouse'
) BEGIN
ALTER DATABASE DataWarehouse
SET
    SINGLE_USER
WITH
    ROLLBACK IMMEDIATE;

DROP DATABASE DataWarehouse;

END;

GO
-- Create the DataWarehouse database
CREATE DATABASE DataWarehouse;

USE DataWarehouse;

GO
-- Create Schemas for different data layers
CREATE SCHEMA bronze;

GO;

CREATE SCHEMA silver;

GO CREATE SCHEMA gold;

GO