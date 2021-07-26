-- Generated by xo for the public schema.

-- table categories
CREATE TABLE categories (
  category_id INTEGER NOT NULL,
  category_name VARCHAR(15) NOT NULL,
  description TEXT,
  picture BYTEA,
  PRIMARY KEY (category_id)
);

-- table customer_customer_demo
CREATE TABLE customer_customer_demo (
  customer_id BPCHAR NOT NULL REFERENCES customers (customer_id),
  customer_type_id BPCHAR NOT NULL REFERENCES customer_demographics (customer_type_id),
  PRIMARY KEY (customer_id, customer_type_id)
);

-- table customer_demographics
CREATE TABLE customer_demographics (
  customer_type_id BPCHAR NOT NULL,
  customer_desc TEXT,
  PRIMARY KEY (customer_type_id)
);

-- table customers
CREATE TABLE customers (
  customer_id BPCHAR NOT NULL,
  company_name VARCHAR(40) NOT NULL,
  contact_name VARCHAR(30),
  contact_title VARCHAR(30),
  address VARCHAR(60),
  city VARCHAR(15),
  region VARCHAR(15),
  postal_code VARCHAR(10),
  country VARCHAR(15),
  phone VARCHAR(24),
  fax VARCHAR(24),
  PRIMARY KEY (customer_id)
);

-- table employee_territories
CREATE TABLE employee_territories (
  employee_id INTEGER NOT NULL REFERENCES employees (employee_id),
  territory_id VARCHAR(20) NOT NULL REFERENCES territories (territory_id),
  PRIMARY KEY (employee_id, territory_id)
);

-- table employees
CREATE TABLE employees (
  employee_id INTEGER NOT NULL,
  last_name VARCHAR(20) NOT NULL,
  first_name VARCHAR(10) NOT NULL,
  title VARCHAR(30),
  title_of_courtesy VARCHAR(25),
  birth_date DATE,
  hire_date DATE,
  address VARCHAR(60),
  city VARCHAR(15),
  region VARCHAR(15),
  postal_code VARCHAR(10),
  country VARCHAR(15),
  home_phone VARCHAR(24),
  extension VARCHAR(4),
  photo BYTEA,
  notes TEXT,
  reports_to INTEGER REFERENCES employees (reports_to),
  photo_path VARCHAR(255),
  PRIMARY KEY (employee_id)
);

-- table order_details
CREATE TABLE order_details (
  order_id INTEGER NOT NULL REFERENCES orders (order_id),
  product_id INTEGER NOT NULL REFERENCES products (product_id),
  unit_price REAL NOT NULL,
  quantity INTEGER NOT NULL,
  discount REAL NOT NULL,
  PRIMARY KEY (order_id, product_id)
);

-- table orders
CREATE TABLE orders (
  order_id INTEGER NOT NULL,
  customer_id BPCHAR REFERENCES customers (customer_id),
  employee_id INTEGER REFERENCES employees (employee_id),
  order_date DATE,
  required_date DATE,
  shipped_date DATE,
  ship_via INTEGER REFERENCES shippers (ship_via),
  freight REAL,
  ship_name VARCHAR(40),
  ship_address VARCHAR(60),
  ship_city VARCHAR(15),
  ship_region VARCHAR(15),
  ship_postal_code VARCHAR(10),
  ship_country VARCHAR(15),
  PRIMARY KEY (order_id)
);

-- table products
CREATE TABLE products (
  product_id INTEGER NOT NULL,
  product_name VARCHAR(40) NOT NULL,
  supplier_id INTEGER REFERENCES suppliers (supplier_id),
  category_id INTEGER REFERENCES categories (category_id),
  quantity_per_unit VARCHAR(20),
  unit_price REAL,
  units_in_stock INTEGER,
  units_on_order INTEGER,
  reorder_level INTEGER,
  discontinued INTEGER NOT NULL,
  PRIMARY KEY (product_id)
);

-- table region
CREATE TABLE region (
  region_id INTEGER NOT NULL,
  region_description BPCHAR NOT NULL,
  PRIMARY KEY (region_id)
);

-- table shippers
CREATE TABLE shippers (
  shipper_id INTEGER NOT NULL,
  company_name VARCHAR(40) NOT NULL,
  phone VARCHAR(24),
  PRIMARY KEY (shipper_id)
);

-- table suppliers
CREATE TABLE suppliers (
  supplier_id INTEGER NOT NULL,
  company_name VARCHAR(40) NOT NULL,
  contact_name VARCHAR(30),
  contact_title VARCHAR(30),
  address VARCHAR(60),
  city VARCHAR(15),
  region VARCHAR(15),
  postal_code VARCHAR(10),
  country VARCHAR(15),
  phone VARCHAR(24),
  fax VARCHAR(24),
  homepage TEXT,
  PRIMARY KEY (supplier_id)
);

-- table territories
CREATE TABLE territories (
  territory_id VARCHAR(20) NOT NULL,
  territory_description BPCHAR NOT NULL,
  region_id INTEGER NOT NULL REFERENCES region (region_id),
  PRIMARY KEY (territory_id)
);

-- table us_states
CREATE TABLE us_states (
  state_id INTEGER NOT NULL,
  state_name VARCHAR(100),
  state_abbr VARCHAR(2),
  state_region VARCHAR(50),
  PRIMARY KEY (state_id)
);