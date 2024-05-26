-- TABLES SECTION

-- CREATE DATABASE PersonalProject2; 

CREATE TABLE Location
(
    LocationID INT PRIMARY KEY AUTO_INCREMENT,
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode INT
);

-- STORE TABLE
CREATE TABLE Store 
(
    StoreID INT PRIMARY KEY AUTO_INCREMENT,
    StoreName VARCHAR(50) NOT NULL,
    LocationID INT,
    CONSTRAINT FK_Store_Location FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

-- EMPLOYEES TABLE
CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    NameLast VARCHAR(50) NOT NULL,
    NameFirst VARCHAR(50),
    StoreID INT,
    Age INT,
    Birthday INT,
    FOREIGN KEY (StoreID) REFERENCES Store(StoreID)
);

CREATE TABLE Food
(
    FoodID INT PRIMARY KEY,
    FoodName VARCHAR(50) NOT NULL
);

-- MENU TABLE
CREATE TABLE MENU
(
    StoreID INT,
    FoodID INT,
    Price DECIMAL(6, 2),
    CONSTRAINT PK_StoreFood PRIMARY KEY (StoreID, FoodID),
    CONSTRAINT FK_StoreFood_Store FOREIGN KEY (StoreID) REFERENCES Store(StoreID),
    CONSTRAINT FK_StoreFood_Food FOREIGN KEY (FoodID) REFERENCES Food(FoodID)
);

-- INSERTS SECTION

-- LOCATION INSERT
INSERT INTO Location (City, State, ZipCode)
VALUES
('Rexburg', 'Idaho', 83440),
('SugarCity', 'Idaho', 83448),
('Spokane', 'Washington', 99201),
('Boise', 'Idaho', 83702);

-- STORE INSERT
INSERT INTO Store (StoreName, LocationID)
VALUES
('Bendy', 1),
('King Burger', 2),
('Charlie in the Box', 4),
('Sir Donald', 3);

-- EMPLOYEE INSERT
INSERT INTO Employees (NameLast, NameFirst, StoreID, Age, Birthday)
VALUES 
('Patterson', 'Robert', 1, 23, 1995),
('Ross', 'Bob', 1, 53, 1942),
('Wonder', 'Stevie', 2, 74, 1950),
('Bowie', 'David', 3, 69, 1947),
('Jackson', 'Michael', 4, 51, 1958),
('Presley', 'Elvis', 2, 42, 1935);

-- Food Insert
INSERT INTO Food (FoodID, FoodName)
VALUES
(1, 'Burger'),
(2, 'Fries'),
(3, 'Soda'), 
(4, 'Ice Cream'),
(5, 'Salad');

-- MENU INSERT
INSERT INTO Menu (StoreID, FoodID, Price)
VALUES
(1, 1, 4.99),
(1, 2, 1.99),
(1, 3, 2.99),
(1, 4, 0.99),
(1, 5, 3.99),
(2, 1, 5.99),
(2, 2, 2.99),
(2, 3, 3.99),
(2, 5, 7.99),
(3, 1, 5.99),
(3, 2, 1.99),
(3, 3, 3.99),
(3, 5, 4.50),
(4, 1, 6.99),
(4, 2, 4.99),
(4, 3, 0.99),
(4, 4, 0.01),
(4, 5, 5.99);


-- Table Display
SELECT * FROM Location;
SELECT * FROM Store;
SELECT * FROM Employees;
SELECT * FROM Food;
SELECT * FROM Menu;

-- UPDATE PRICE of Ice Cream from Sir Donald

UPDATE Menu
SET Price = 9.99
WHERE StoreID = 4 AND FoodID = 4;

-- Remove Salad from a range of Stores

DELETE FROM Menu
WHERE StoreID IN (2, 3, 4) AND FoodID = 5;

-- Prices of Menu from Lowest to Highest
SELECT StoreID, FoodID, Price FROM Menu
ORDER BY Price;

-- Count the number of Employees
SELECT SUM(1) AS EmployeesTotal
FROM Employees;