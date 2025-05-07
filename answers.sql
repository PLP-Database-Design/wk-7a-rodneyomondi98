-- Question 1: Achieving 1NF (First Normal Form)
-- Transform the given ProductDetail table into 1NF where each row represents a single product for an order.

-- Create the normalized table
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(255),
    Product VARCHAR(255)
);

-- Insert data into the normalized table
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES 
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- Select from the normalized table to verify the transformation
SELECT * FROM ProductDetail_1NF;

-- Question 2: Achieving 2NF (Second Normal Form)
-- Transform the given OrderDetails table into 2NF by removing partial dependencies.

-- Step 1: Create a separate table for orders and customers
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

-- Insert data into the Orders table
INSERT INTO Orders (OrderID, CustomerName)
VALUES 
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Step 2: Create a separate table for order details
CREATE TABLE OrderDetails_2NF (
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    PRIMARY KEY (OrderID, Product), -- Composite primary key
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert data into the OrderDetails table
INSERT INTO OrderDetails_2NF (OrderID, Product, Quantity)
VALUES 
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

-- Select from both tables to verify the transformation
SELECT * FROM Orders;
SELECT * FROM OrderDetails_2NF;