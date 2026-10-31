-- Bookstore database: reporting queries (MySQL)

-- Query 1 — All Books with Supplier Info (2-table JOIN)
SELECT b.book_title, b.book_price, b.book_stock_qty, s.supplier_name
FROM Book b
JOIN Supplier s ON b.supplier_id = s.supplier_id;

-- Query 2 — Customer Purchase History (2-table JOIN)
SELECT c.cust_first_name, c.cust_last_name, sa.sale_date, sa.sale_total_price
FROM Customer c
JOIN Sale sa ON c.cust_id = sa.cust_id;

-- Query 3 — Books Sold with Customer Info (2-table JOIN)
SELECT b.book_title, c.cust_first_name, c.cust_last_name, sa.sale_quantity
FROM Sale sa
JOIN Book b ON sa.book_id = b.book_id
JOIN Customer c ON sa.cust_id = c.cust_id;

-- Query 4 — Available Books by Genre (2-table JOIN)
SELECT b.book_genre, b.book_title, b.book_price, s.supplier_name
FROM Book b
JOIN Supplier s ON b.supplier_id = s.supplier_id
WHERE b.book_is_available = 1
ORDER BY b.book_genre;

-- Query 5 — Books with Authors and Supplier (3-table JOIN)
SELECT b.book_title, a.author_first_name, a.author_last_name, s.supplier_name
FROM Book b
JOIN Book_Author ba ON b.book_id = ba.book_id
JOIN Author a ON ba.author_id = a.author_id
JOIN Supplier s ON b.supplier_id = s.supplier_id;

-- Query 6 — Total Revenue per Customer (GROUP BY + Aggregation)
SELECT c.cust_first_name, c.cust_last_name, COUNT(sa.sale_id) AS total_purchases,
       SUM(sa.sale_total_price) AS total_spent
FROM Customer c
JOIN Sale sa ON c.cust_id = sa.cust_id
GROUP BY c.cust_id
ORDER BY total_spent DESC;

-- Query 7 — Total Books Sold per Genre (GROUP BY + Aggregation)
SELECT b.book_genre, SUM(sa.sale_quantity) AS total_sold,
       AVG(b.book_price) AS avg_price
FROM Book b
JOIN Sale sa ON b.book_id = sa.book_id
GROUP BY b.book_genre
ORDER BY total_sold DESC;
