-- Configuration table for dynamic pipeline execution
CREATE TABLE dbo.ETLConfiguration (
    ConfigID INT IDENTITY(1,1) PRIMARY KEY,
    SourceSchema VARCHAR(50),
    SourceTable VARCHAR(255),
    SinkSchema VARCHAR(50),
    SinkTable VARCHAR(255),
    WatermarkColumn VARCHAR(100),
    IsActive BIT DEFAULT 1,
    LoadType VARCHAR(20) -- 'Full' or 'Incremental'
);

-- Insert sample configuration
INSERT INTO dbo.ETLConfiguration 
    (SourceSchema, SourceTable, SinkSchema, SinkTable, WatermarkColumn, LoadType)
VALUES 
    ('dbo', 'SourceSales', 'dbo', 'SalesData', 'LastModifiedDate', 'Incremental'),
    ('dbo', 'SourceProducts', 'dbo', 'ProductData', 'UpdatedDate', 'Incremental'),
    ('dbo', 'SourceCustomers', 'dbo', 'CustomerData', 'ModifiedDate', 'Incremental');
