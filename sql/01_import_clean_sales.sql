USE retail_sales_analysis;

CREATE TABLE clean_sales_base (
    Invoice VARCHAR(50),
    StockCode VARCHAR(50),
    Description TEXT,
    Quantity INT,
    InvoiceDate VARCHAR(50),
    Price DOUBLE,
    CustomerID VARCHAR(50),
    Country VARCHAR(100),
    Revenue DOUBLE,
    OrderDate VARCHAR(50),
    Year INT,
    Month INT,
    MonthStart VARCHAR(50)
);



USE retail_sales_analysis;

LOAD DATA LOCAL INFILE 'C:/Users/amir/Desktop/Portfolio/retail-demand-forecasting/excel/clean_sales_base.csv'
INTO TABLE clean_sales_base
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(Invoice, StockCode, Description, Quantity, InvoiceDate, Price,
 CustomerID, Country, Revenue, OrderDate, Year, Month, MonthStart);'


SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = ON;

SELECT COUNT(*) 
FROM retail_sales_analysis.clean_sales_base;


