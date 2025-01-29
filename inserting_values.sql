-- DimCustomers
INSERT INTO DimCustomers (customer_id, first_name, last_name, email, address, city, state, country, zipcode, joindate)
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '123 Main St', 'New York', 'NY', 'USA', '10001', '2023-01-15'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '456 Oak St', 'Los Angeles', 'CA', 'USA', '90001', '2023-02-20');

-- DimPhoneBook
INSERT INTO DimPhoneBook (phone_id, phone_number, phone_type, is_primary, customer_id)
VALUES
(1, '1234567890', 'Mobile', 1, 1),
(2, '9876543210', 'Home', 0, 2);

-- DimSuppliers
INSERT INTO DimSuppliers (supplier_id, name, contact_name, phone_number, email, address)
VALUES
(1, 'ABC Supplies', 'Emily Brown', '5551234567', 'contact@abcsupplies.com', '789 Elm St'),
(2, 'XYZ Wholesale', 'Michael Green', '5559876543', 'support@xyzwholesale.com', '321 Pine St');

-- DimStores
INSERT INTO DimStores (store_id, name, location, city, state, country, zipcode)
VALUES
(1, 'Downtown Store', 'Downtown', 'New York', 'NY', 'USA', '10002'),
(2, 'Westside Store', 'Westside', 'Los Angeles', 'CA', 'USA', '90002');

-- DimTime
INSERT INTO DimTime (time_id, date, day, month, year, quarter, week, day_name, month_name)
VALUES
(1, '2023-01-15', 15, 1, 2023, 1, 3, 'Sunday', 'January'),
(2, '2023-02-20', 20, 2, 2023, 1, 8, 'Monday', 'February');

-- DimProducts
INSERT INTO DimProducts (product_id, name, category, subcategory, brand, cost, price, supplier_id)
VALUES
(1, 'Laptop', 'Electronics', 'Computers', 'Dell', 500, 800, 1),
(2, 'Smartphone', 'Electronics', 'Mobile Phones', 'Samsung', 300, 600, 2);

-- FactSales
INSERT INTO FactSales (sale_id, quantity_sold, total_sale_amount, discount, profit, time_id, customer_id, product_id, store_id)
VALUES
(1, 2, 1600, 100, 300, 1, 1, 1, 1),
(2, 1, 600, 50, 100, 2, 2, 2, 2);

-- FactInventory
INSERT INTO FactInventory (inventory_id, beginning_inventory, received_inventory, sold_invetory, ending_invetory, time_id, product_id, store_id)
VALUES
(1, 100, 50, 20, 130, 1, 1, 1),
(2, 200, 30, 10, 220, 2, 2, 2);

-- DimAccounts
INSERT INTO DimAccounts (account_id, account_number, account_name, account_type, parent_account_id, balance)
VALUES
    (1, '1000', 'Assets', 'Category', NULL, 100000.00),
    (2, '1010', 'Cash', 'Subcategory', 1, 50000.00),   
    (3, '1020', 'Accounts Receivable', 'Subcategory', 1, 30000.00), 
    (4, '2000', 'Liabilities', 'Category', NULL, 50000.00), 
    (5, '2010', 'Accounts Payable', 'Subcategory', 4, 20000.00),
    (6, '3000', 'Equity', 'Category', NULL, 100000.00),
    (7, '3010', 'Retained Earnings', 'Subcategory', 6, 80000.00),
    (8, '4000', 'Revenue', 'Category', NULL, 150000.00), 
    (9, '4010', 'Sales Revenue', 'Subcategory', 8, 120000.00), 
    (10, '5000', 'Expenses', 'Category', NULL, 50000.00), 
    (11, '5010', 'Operating Expenses', 'Subcategory', 10, 30000.00),



-- FactJournals
INSERT INTO FactJournals (journal_id, date_id, debit_account_id, credit_account_id, amount, description, time_id, account_id)
VALUES
(1, 1, 2, 1, 500, 'Office Supplies', 1, 1),
(2, 2, 2, 1, 300, 'Marketing Expense', 2, 2);

-- FactBudget
INSERT INTO FactBudget (budget_id, budgeted_amount, actual_amount, account_id, store_id, time_id)
VALUES
(1, 5000, 4500, 1, 1, 1),
(2, 7000, 7500, 2, 2, 2);

