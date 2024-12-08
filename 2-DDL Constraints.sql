-- Step 1: Create the Sales database
CREATE DATABASE Sales

-- Step 2: Create the Orders table with constraints
CREATE TABLE Orders (
    Order_Id VARCHAR(20) PRIMARY KEY,
    Customer_name VARCHAR(20) NOT NULL,
    Product_Category VARCHAR(20) NOT NULL,
    Ordered_item VARCHAR(20) NOT NULL,
    Contact_No VARCHAR(20) NOT NULL UNIQUE
);


-- Step 3: Add the order_quantity column to the Orders table
ALTER TABLE Orders ADD COLUMN Order_quantity INT

-- Step 4: Rename the Orders table to sales_orders
RENAME TABLE Orders to Sales_orders

-- Step 5: Insert 10 rows into the sales_orders table
INSERT INTO Sales_orders(Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No, Order_quantity)
Values
(1, 'John Doe', 'Electronics', 'Smartphone', '123-456-7890', 2),
(2, 'Jane Smith', 'Furniture', 'Sofa', '987-654-3210', 1),
(3, 'Alice Johnson', 'Clothing', 'T-shirt', '555-123-4567', 3),
(4, 'Bob Brown', 'Electronics', 'Laptop', '555-234-5678', 1),
(5, 'Charlie Davis', 'Food', 'Coffee Maker', '555-345-6789', 2),
(6, 'David Wilson', 'Clothing', 'Jeans', '555-456-7890', 4),
(7, 'Emma White', 'Books', 'Fiction Novel', '555-567-8901', 1),
(8, 'George Taylor', 'Appliances', 'Washing Machine', '555-678-9012', 1),
(9, 'Hannah Lewis', 'Clothing', 'Jacket', '555-789-0123', 2),
(10, 'Isaac Martin', 'Sports', 'Football', '555-890-1234', 5);

-- Step 6: Retrieve Customer_name and Ordered_item from the sales_orders table
SELECT Customer_name, ordered_item from Sales_orders;

-- Step 7: Update the Ordered_item for a specific row
UPDATE sales_orders
SET Ordered_item = 'smartwatch'
WHERE Order_Id = 1;


-- Step 8: Delete the sales_orders table from the database
Drop TABLE sales_orders