CREATE TABLE DimCustomers (
  customer_id INT NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  address VARCHAR(255) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NOT NULL,
  country VARCHAR(50) NOT NULL,
  zipcode VARCHAR(20) NOT NULL,
  joindate DATE NOT NULL,
  PRIMARY KEY (customer_id)
);

CREATE TABLE DimPhoneBook (
  phone_id INT NOT NULL,
  phone_number VARCHAR(15) NOT NULL,
  phone_type VARCHAR(20) NOT NULL,
  is_primary BIT NOT NULL,
  customer_id INT NOT NULL,
  PRIMARY KEY (phone_id),
  FOREIGN KEY (customer_id) REFERENCES DimCustomers(customer_id)
);

CREATE TABLE DimSuppliers (
  supplier_id INT NOT NULL,
  name VARCHAR(100) NOT NULL,
  contact_name VARCHAR(100) NOT NULL,
  phone_number VARCHAR(15) NOT NULL,
  email VARCHAR(100) NOT NULL,
  address VARCHAR(255) NOT NULL,
  PRIMARY KEY (supplier_id)
);

CREATE TABLE DimStores (
  store_id INT NOT NULL,
  name VARCHAR(100) NOT NULL,
  location VARCHAR(255),
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NOT NULL,
  country VARCHAR(50) NOT NULL,
  zipcode VARCHAR(20) NOT NULL,
  PRIMARY KEY (store_id)
);

CREATE TABLE DimTime (
  time_id INT NOT NULL,
  date DATE NOT NULL,
  day INT NOT NULL,
  month INT NOT NULL,
  year INT NOT NULL,
  quarter INT NOT NULL,
  week INT NOT NULL,
  day_name VARCHAR(20) NOT NULL,
  month_name VARCHAR(20) NOT NULL,
  PRIMARY KEY (time_id)
);

CREATE TABLE DimProducts (
  product_id INT NOT NULL,
  name VARCHAR(100) NOT NULL,
  category VARCHAR(50) NOT NULL,
  subcategory VARCHAR(50) NOT NULL,
  brand VARCHAR(50) NOT NULL,
  cost DECIMAL(10, 2) NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  supplier_id INT NOT NULL,
  PRIMARY KEY (product_id),
  FOREIGN KEY (supplier_id) REFERENCES DimSuppliers(supplier_id)
);

CREATE TABLE FactSales (
  sale_id INT NOT NULL,
  quantity_sold INT NOT NULL,
  total_sale_amount DECIMAL(10, 2),
  discount DECIMAL(10, 2) NOT NULL,
  profit DECIMAL(10, 2),
  time_id INT NOT NULL,
  customer_id INT NOT NULL,
  product_id INT NOT NULL,
  store_id INT NOT NULL,
  PRIMARY KEY (sale_id),
  FOREIGN KEY (time_id) REFERENCES DimTime(time_id),
  FOREIGN KEY (customer_id) REFERENCES DimCustomers(customer_id),
  FOREIGN KEY (product_id) REFERENCES DimProducts(product_id),
  FOREIGN KEY (store_id) REFERENCES DimStores(store_id)
);

CREATE TABLE FactInventory (
  inventory_id INT NOT NULL,
  beginning_inventory INT NOT NULL,
  received_inventory INT NOT NULL,
  sold_inventory INT NOT NULL,
  ending_inventory INT NOT NULL,
  time_id INT NOT NULL,
  product_id INT NOT NULL,
  store_id INT NOT NULL,
  PRIMARY KEY (inventory_id),
  FOREIGN KEY (time_id) REFERENCES DimTime(time_id),
  FOREIGN KEY (product_id) REFERENCES DimProducts(product_id),
  FOREIGN KEY (store_id) REFERENCES DimStores(store_id)
);

CREATE TABLE [dbo].[DimAccounts](
	[account_id] [int] NOT NULL,
	[account_name] [varchar](100) NOT NULL,
	[account_type] [varchar](50) NOT NULL,
	[parent_account_id] [int] NULL,
	[account_number] [varchar](20) NOT NULL,
	[balance] [decimal](15, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
([account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
ALTER TABLE [dbo].[DimAccounts] ADD  DEFAULT ((0.00)) FOR [balance]
ALTER TABLE [dbo].[DimAccounts]  WITH CHECK ADD FOREIGN KEY([parent_account_id])
REFERENCES [dbo].[DimAccounts] ([account_id]);

CREATE TABLE [dbo].[FactJournals](
	[journal_id] [int] NOT NULL,
	[debit_account_id] [int] NOT NULL,
	[credit_account_id] [int] NOT NULL,
	[amount] [decimal](10, 2) NOT NULL,
	[description] [varchar](255) NOT NULL,
	[time_id] [int] NOT NULL,
	[account_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[journal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
ALTER TABLE [dbo].[FactJournals]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[DimAccounts] ([account_id])
ALTER TABLE [dbo].[FactJournals]  WITH CHECK A
;

CREATE TABLE FactBudget (
  budget_id INT NOT NULL,
  budgeted_amount DECIMAL(10, 2) NOT NULL,
  actual_amount DECIMAL(10, 2) NOT NULL,
  account_id INT NOT NULL,
  store_id INT NOT NULL,
  time_id INT NOT NULL,
  PRIMARY KEY (budget_id),
  FOREIGN KEY (account_id) REFERENCES DimAccounts(account_id),
  FOREIGN KEY (store_id) REFERENCES DimStores(store_id),
  FOREIGN KEY (time_id) REFERENCES DimTime(time_id)
);
