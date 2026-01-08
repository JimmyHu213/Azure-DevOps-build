-- Stored procedure to update watermark after successful load
CREATE PROCEDURE dbo.usp_UpdateWatermark
    @TableName VARCHAR(255),
    @LastModifiedtime DATETIME2
AS
BEGIN
    UPDATE dbo.WatermarkTable
    SET WatermarkValue = @LastModifiedtime,
        LastUpdated = GETDATE()
    WHERE TableName = @TableName;
END;
