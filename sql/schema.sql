-- Create SUPPLIER table
CREATE TABLE Supplier (
    supplier_id INT AUTO_INCREMENT,
    supplier_name VARCHAR(150) NOT NULL,
    supplier_contact VARCHAR(100),
    supplier_phone VARCHAR(20),
    supplier_email VARCHAR(150),
    supplier_lead_days INT NOT NULL DEFAULT 7,
    PRIMARY KEY (supplier_id)
);

-- Create BOOK table
CREATE TABLE Book (
    book_id INT AUTO_INCREMENT,
    book_title VARCHAR(150) NOT NULL,
    book_genre ENUM('Fiction', 'Non-Fiction', 'Mystery', 'Sci-Fi', 'Biography', 'Other') NOT NULL DEFAULT 'Fiction',
    book_price DECIMAL(6,2) NOT NULL DEFAULT 0.00,
    book_stock_qty INT NOT NULL DEFAULT 0,
    book_pub_date DATE,
    book_is_available TINYINT(1) NOT NULL DEFAULT 1,
    supplier_id INT NOT NULL,
    PRIMARY KEY (book_id),
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);

-- Create CUSTOMER table
CREATE TABLE Customer (
    cust_id INT AUTO_INCREMENT,
    cust_first_name VARCHAR(75) NOT NULL,
    cust_last_name VARCHAR(75) NOT NULL,
    cust_email VARCHAR(150) NOT NULL,
    cust_phone VARCHAR(20),
    cust_date_joined DATE NOT NULL DEFAULT (CURDATE()),
    PRIMARY KEY (cust_id)
);

-- Create AUTHOR table
CREATE TABLE Author (
    author_id INT AUTO_INCREMENT,
    author_first_name VARCHAR(75) NOT NULL,
    author_last_name VARCHAR(75) NOT NULL,
    author_nationality VARCHAR(100),
    author_birth_date DATE,
    author_active TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY (author_id)
);

-- Create SALE table
CREATE TABLE Sale (
    sale_id INT AUTO_INCREMENT,
    cust_id INT NOT NULL,
    book_id INT NOT NULL,
    sale_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    sale_quantity INT NOT NULL DEFAULT 1,
    sale_total_price DECIMAL(8,2) NOT NULL DEFAULT 0.00,
    PRIMARY KEY (sale_id),
    FOREIGN KEY (cust_id) REFERENCES Customer(cust_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id)
);

-- Create BOOK_AUTHOR linking table
CREATE TABLE Book_Author (
    ba_id INT AUTO_INCREMENT,
    book_id INT NOT NULL,
    author_id INT NOT NULL,
    PRIMARY KEY (ba_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (author_id) REFERENCES Author(author_id)
);