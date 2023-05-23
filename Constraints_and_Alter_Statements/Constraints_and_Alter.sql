## 1.  FOREIGN KEY constraints
ALTER TABLE sales ADD
FOREIGN KEY(customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;
# OR
CREATE TABLE sales (
    purchase_number INT AUTO_INCREMENT,
    date_of_purchase DATE,
    customer_id INT,
    item_code VARCHAR(255),
    PRIMARY KEY (purchase_number),
    Constraint sales_ibfk1 FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id)
        ON DELETE CASCADE
);
# to drop FOREIGN KEY constraints
ALTER table sales drop foreign key sales_ibfk1;


## 2. UNIQUE KEY constraints
ALTER TABLE customers 
ADD UNIQUE KEY(email_address);
# Since automatic treatment of unique key as index in MYSQL.
ALTER TABLE customers DROP INDEX email_address; 

## 3. DEFAULT Constraint
ALTER TABLE customers
CHANGE column number_of_complaints number_of_complaints INT DEFAULT 0;

## 4. NOT NULL constraint
CREATE TABLE companies (
    company_id VARCHAR(255),
    company_name VARCHAR(255) NOT NULL,
    headquarters_phone_number INT(12),
    PRIMARY KEY (company_id)
);

# 5. To change or drop NOT NULL or DEFAULT constraints
ALTER TABLE companies 
MODIFY company_name varchar(255) NOT NULL;

ALTER TABLE companies 
CHANGE COLUMN company_name company_name VARCHAR(255) NOT NULL;

ALTER TABLE companies
RENAME column company_name to comp_name;

/*
The difference is whether you want to change the column name, 
column definition or both.

## CHANGE: Can change a column name or definition, or both
ALTER TABLE t1 CHANGE old_name new_name BIGINT NOT NULL

## MODIFY: Can change a column definition but not its name
ALTER TABLE t1 MODIFY col_name INT NOT NULL

## RENAME COLUMN (from MySQL 8.0): Can change a column name but not its definition
ALTER TABLE t1 RENAME COLUMN old_col_name TO new_col_name

*/

## 6. Adding a column in a Table
ALTER TABLE customers  
ADD COLUMN gender ENUM('M', 'F') AFTER last_name; 


