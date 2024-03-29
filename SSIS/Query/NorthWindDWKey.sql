ALTER TABLE DIM_Supplier
ADD CONSTRAINT fk_sup_supl
FOREIGN KEY (postal_code, country)
REFERENCES DIM_Supplier_Location(postal_code, country);
GO

ALTER TABLE DIM_Customer
ADD CONSTRAINT fk_cus_cusl
FOREIGN KEY (postal_code, country)
REFERENCES DIM_Customer_Location(postal_code, country);
GO

ALTER TABLE DIM_Product
ADD CONSTRAINT fk_category
FOREIGN KEY (category_id)
REFERENCES DIM_Category(category_id);
GO

ALTER TABLE FACT
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id)
REFERENCES DIM_Customer(customer_id);
GO

ALTER TABLE FACT
ADD CONSTRAINT fk_employee
FOREIGN KEY (employee_id)
REFERENCES DIM_Employee(employee_id);
GO

ALTER TABLE FACT
ADD CONSTRAINT fk_product
FOREIGN KEY (product_id)
REFERENCES DIM_Product(product_id);
GO

ALTER TABLE FACT
ADD CONSTRAINT fk_date
FOREIGN KEY (order_date)
REFERENCES DIM_Date(date);
GO

ALTER TABLE FACT
ADD CONSTRAINT fk_shipper
FOREIGN KEY (ship_via)
REFERENCES DIM_Ship(shipper_id);
GO