-- Create target tables in data warehouse
CREATE TABLE dbo.SalesData (
    OrderID INT,
    CustomerID VARCHAR(50),
    ProductName VARCHAR(255),
    Quantity INT,
    Amount DECIMAL(18,2),
    OrderDate DATE,
    LastModifiedDate DATETIME2,
    LoadedDate DATETIME2 DEFAULT GETDATE()
);

CREATE TABLE dbo.ProductData (
    ProductID INT,
    ProductName VARCHAR(255),
    Category VARCHAR(100),
    Price DECIMAL(18,2),
    UpdatedDate DATETIME2,
    LoadedDate DATETIME2 DEFAULT GETDATE()
);

CREATE TABLE dbo.UserData (
    UserID INT,
    UserName VARCHAR(255),
    Email VARCHAR(255),
    Phone VARCHAR(50),
    CreatedDate DATETIME2,
    LoadedDate DATETIME2 DEFAULT GETDATE()
);
