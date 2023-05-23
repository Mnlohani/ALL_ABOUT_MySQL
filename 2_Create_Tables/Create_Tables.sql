USE db_sales;

CREATE TABLE sales (
    purchase_number INT NOT NULL AUTO_INCREMENT,
    date_of_purchase DATE NOT NULL,
    customer_id INT,
    item_code VARCHAR(10) NOT NULL,
    PRIMARY KEY (purchase_number),
    FOREIGN KEY (customer_id)
        REFERENCES customer (customer_id)
        ON DELETE CASCADE,
    FOREIGN KEY (item_code)
        REFERENCES items (item_code)
        ON DELETE CASCADE
);

CREATE TABLE customers (
    customer_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT DEFAULT 0,
    PRIMARY KEY (customer_id),
    UNIQUE KEY (email_address)
);

CREATE TABLE items (
    item_code VARCHAR(255),
    item VARCHAR(255),
    unit_price NUMERIC(10 , 2 ),
    company_id VARCHAR(255),
    PRIMARY KEY (item_code),
    FOREIGN KEY (company_id)
        REFERENCES companies (company_id)
        ON DELETE CASCADE
);

CREATE TABLE companies (
    company_id VARCHAR(255),
    company_name VARCHAR(255),
    headquarters_phone_number INT(12),
    PRIMARY KEY (company_id)
);
# Importante
# drop all tables from the “Sales” database in the following order: 
# first drop “sales”, then “customers”, “items”, and finally “companies”.
# will not allow to drop customers first

