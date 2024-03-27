USE master
GO
DROP DATABASE IF EXISTS NorthWind
GO

CREATE DATABASE NorthWind
GO
USE NorthWind
GO

-- Create tables
CREATE TABLE categories (
    category_id int NOT NULL PRIMARY KEY,
    category_name varchar(100) NOT NULL,
    description text
);

CREATE TABLE customer_demographics (
    customer_type_id varchar(100) NOT NULL PRIMARY KEY,
    customer_desc text
);

CREATE TABLE customers (
    customer_id varchar(100) NOT NULL PRIMARY KEY,
    company_name varchar(40) NOT NULL,
    contact_name varchar(30),
    contact_title varchar(30),
    address varchar(60),
    city varchar(15),
    region varchar(15),
    postal_code varchar(10),
    country varchar(15),
    phone varchar(24),
    fax varchar(24)
);

CREATE TABLE customer_customer_demo (
    customer_id varchar(100) NOT NULL,
    customer_type_id varchar(100) NOT NULL,
    PRIMARY KEY (customer_id, customer_type_id),
    FOREIGN KEY (customer_type_id) REFERENCES customer_demographics(customer_type_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE employees (
    employee_id int NOT NULL PRIMARY KEY,
    last_name varchar(20) NOT NULL,
    first_name varchar(10) NOT NULL,
    title varchar(30),
    title_of_courtesy varchar(25),
    birth_date date,
    hire_date date,
    address varchar(60),
    city varchar(15),
    region varchar(15),
    postal_code varchar(10),
    country varchar(15),
    home_phone varchar(24),
    extension varchar(4),
    notes text,
    reports_to int,
    photo_path varchar(255),
    FOREIGN KEY (reports_to) REFERENCES employees(employee_id)
);

CREATE TABLE suppliers (
    supplier_id int NOT NULL PRIMARY KEY,
    company_name varchar(40) NOT NULL,
    contact_name varchar(30),
    contact_title varchar(30),
    address varchar(60),
    city varchar(15),
    region varchar(15),
    postal_code varchar(10),
    country varchar(15),
    phone varchar(24),
    fax varchar(24),
    homepage text
);

CREATE TABLE products (
    product_id int NOT NULL PRIMARY KEY,
    product_name varchar(40) NOT NULL,
    supplier_id int,
    category_id int,
    quantity_per_unit varchar(20),
    unit_price real,
    units_in_stock int,
    units_on_order int,
    reorder_level int,
    discontinued int NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

CREATE TABLE region (
    region_id int NOT NULL PRIMARY KEY,
    region_description varchar(100) NOT NULL
);

CREATE TABLE shippers (
    shipper_id int NOT NULL PRIMARY KEY,
    company_name varchar(40) NOT NULL,
    phone varchar(24)
);

CREATE TABLE orders (
    order_id int NOT NULL PRIMARY KEY,
    customer_id varchar(100),
    employee_id int,
    order_date date,
    required_date date,
    shipped_date date,
    ship_via int,
    freight real,
    ship_name varchar(40),
    ship_address varchar(60),
    ship_city varchar(15),
    ship_region varchar(15),
    ship_postal_code varchar(10),
    ship_country varchar(15),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (ship_via) REFERENCES shippers(shipper_id)
);

CREATE TABLE territories (
    territory_id varchar(20) NOT NULL PRIMARY KEY,
    territory_description varchar(100) NOT NULL,
    region_id int NOT NULL,
    FOREIGN KEY (region_id) REFERENCES region(region_id)
);

CREATE TABLE employee_territories (
    employee_id int NOT NULL,
    territory_id varchar(20) NOT NULL,
    PRIMARY KEY (employee_id, territory_id),
    FOREIGN KEY (territory_id) REFERENCES territories(territory_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE order_details (
    order_id int NOT NULL,
    product_id int NOT NULL,
    unit_price real NOT NULL,
    quantity int NOT NULL,
    discount real NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE us_states (
    state_id int NOT NULL PRIMARY KEY,
    state_name varchar(100),
    state_abbr varchar(2),
    state_region varchar(50)
);
