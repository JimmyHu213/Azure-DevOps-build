# Azure Data Factory - ETL Portfolio Project

## Overview
This project demonstrates end-to-end ETL capabilities using Azure Data Factory with multiple data sources and advanced patterns.

## Architecture

### Data Sources
1. **Azure Blob Storage** - CSV files
2. **Azure Blob Storage** - JSON files
3. **REST API** - JSONPlaceholder API
4. **Azure SQL Database** - Source tables

### Data Destination
- Azure SQL Database (Data Warehouse)
- Azure Synapse Analytics (optional)

## Pipelines

### 1. PL_IncrementalLoad_Watermark
**Purpose**: Implements watermark-based incremental loading pattern

**Features**:
- Looks up last watermark value
- Extracts only changed/new records
- Updates watermark after successful load
- Parameterized for reusability

**Parameters**:
- SourceSchemaName
- SourceTableName
- SinkSchemaName
- SinkTableName
- WatermarkColumn

### 2. PL_MultiSource_ETL
**Purpose**: Extract data from multiple heterogeneous sources

**Features**:
- CSV to SQL copy
- JSON to SQL copy
- REST API to SQL copy
- Sequential execution with error handling

**Parameters**:
- CSVFileName, CSVFolderPath, CSVTargetTable
- JSONFileName, JSONTargetTable
- APIEndpoint, APITargetTable

### 3. PL_Master_DynamicETL
**Purpose**: Orchestrate multiple ETL processes dynamically

**Features**:
- Metadata-driven approach
- Parallel execution (batch of 4)
- Configuration-based table processing
- Scalable for multiple tables

## Key Patterns Implemented

### 1. Incremental Loading
- Watermark column tracking
- Change Data Capture (CDC) ready
- Optimized for large datasets

### 2. Parameterization
- Reusable pipeline templates
- Dynamic expressions
- Environment-specific configurations

### 3. Security
- Azure Key Vault integration
- Connection strings secured
- Managed identities support

### 4. Scheduling
- Time-based triggers
- Event-based triggers (optional)
- Manual execution support

## Deployment

### Prerequisites
- Azure Subscription
- Azure Data Factory instance
- Azure SQL Database
- Azure Blob Storage account
- Azure Key Vault

### Setup Steps

1. **Deploy Linked Services**
```bash
# Deploy all linked services
az datafactory linked-service create --factory-name <adf-name> \
  --resource-group <rg-name> \
  --linked-service-name LS_AzureKeyVault \
  --properties @linkedService/LS_AzureKeyVault.json
```

2. **Deploy Datasets**
```bash
# Deploy datasets
az datafactory dataset create --factory-name <adf-name> \
  --resource-group <rg-name> \
  --name DS_Blob_CSV_Source \
  --properties @dataset/DS_Blob_CSV_Source.json
```

3. **Deploy Pipelines**
```bash
# Deploy pipelines
az datafactory pipeline create --factory-name <adf-name> \
  --resource-group <rg-name> \
  --name PL_IncrementalLoad_Watermark \
  --pipeline @pipeline/PL_IncrementalLoad_Watermark.json
```

4. **Create SQL Objects**
```sql
-- Run SQL scripts in order
-- 01_CreateWatermarkTable.sql
-- 02_CreateUpdateWatermarkProc.sql
-- 03_CreateETLConfigTable.sql
-- 04_CreateTargetTables.sql
```

5. **Upload Sample Data**
```bash
# Upload to blob storage
az storage blob upload --account-name <storage-name> \
  --container-name raw-data \
  --name csv-files/sales_data.csv \
  --file sample-data/sales_data.csv
```

## Monitoring & Troubleshooting

- Monitor pipeline runs in ADF UI
- Check Activity Runs for detailed logs
- Review watermark table for incremental load status
- Use Azure Monitor for alerts

## Performance Optimization

1. **Parallel Processing**: ForEach with batchCount=4
2. **Incremental Loads**: Only process changed data
3. **Staging**: Enable for large datasets
4. **Partitioning**: Available for supported sources

## Future Enhancements

- [ ] Add Data Flow transformations
- [ ] Implement SCD Type 2
- [ ] Add data quality checks
- [ ] Integrate with Azure Synapse Analytics
- [ ] Add email notifications on failure

