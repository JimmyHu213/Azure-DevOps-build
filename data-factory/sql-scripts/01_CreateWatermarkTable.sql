-- Create watermark table to track incremental loads
CREATE TABLE dbo.WatermarkTable (
    TableName VARCHAR(255) PRIMARY KEY,
    WatermarkValue DATETIME2,
    LastUpdated DATETIME2 DEFAULT GETDATE()
);

-- Insert initial watermark values
INSERT INTO dbo.WatermarkTable (TableName, WatermarkValue)
VALUES 
    ('SalesData', '1900-01-01'),
    ('ProductData', '1900-01-01'),
    ('UserData', '1900-01-01');
