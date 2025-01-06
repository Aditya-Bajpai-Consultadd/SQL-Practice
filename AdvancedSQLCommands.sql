

--INNER JOIN 
--Fetch customers along with the details of their orders.
SELECT Customer.CUSTOMER_ID, Orders.ORDER_ID, Orders.DATE_OF_ORDER 
FROM Customer
JOIN Orders ON Customer.ORDER_ID = Orders.ORDER_ID;

--LEFT JOIN 
--Fetch all customers, even those without orders.
SELECT Customer.CUSTOMER_ID, Orders.ORDER_ID, Orders.DATE_OF_ORDER 
FROM Customer
LEFT JOIN Orders ON Customer.ORDER_ID = Orders.ORDER_ID;

--RIGHT JOIN
--Fetch all orders, even those not associated with any customer.
SELECT Customer.CUSTOMER_ID, Orders.ORDER_ID, Orders.DATE_OF_ORDER 
FROM Customer
RIGHT JOIN Orders ON Customer.ORDER_ID = Orders.ORDER_ID;

--FULL OUTER JOIN 
--Fetch all customers and orders, including unmatched ones from both tables.
SELECT Customer.CUSTOMER_ID, Orders.ORDER_ID, Orders.DATE_OF_ORDER 
FROM Customer
FULL JOIN Orders ON Customer.ORDER_ID = Orders.ORDER_ID;

--CROSS JOIN 
--Fetch all possible combinations of customers and products.
SELECT Customer.CUSTOMER_ID, Product.PRODUCT_ID 
FROM Customer
CROSS JOIN Product;


--SUBQUERY (NESTED QUERY) 
--Find the customer who placed an order with the highest price.
SELECT CUSTOMER_ID 
FROM Customer 
WHERE ORDER_ID = (
    SELECT ORDER_ID 
    FROM Orders 
    WHERE PRODUCT_ID = (
        SELECT PRODUCT_ID 
        FROM Product 
        ORDER BY PRICE DESC 
        LIMIT 1
    )
);
b. Correlated Subquery
--Fetch customers whose order total exceeds the average product price.
SELECT CUSTOMER_ID FROM Customer 
WHERE ORDER_ID = (
SELECT ORDER_ID FROM Orders 
WHERE PRODUCT_ID = (
SELECT PRODUCT_ID FROM Product ORDER BY PRICE DESC LIMIT 1));

--CORRELATED QUERY 
--Fetch customers whose order total exceeds the average product price

SELECT CUSTOMER_ID FROM Customer 
WHERE ORDER_ID IN (
SELECT ORDER_ID FROM Orders 
WHERE PRODUCT_ID IN (SELECT PRODUCT_ID FROM Product 
WHERE PRICE > (SELECT AVG(PRICE) FROM Product)));

--SET OPERATIONS 
--UNION 
--Fetch all unique customer IDs from both the Customer and Orders tables.
SELECT CUSTOMER_ID FROM Customer
UNION
SELECT CUSTOMER_ID FROM Orders;

--INTERSECT
--Fetch customer IDs present in both Customer and Orders.
SELECT CUSTOMER_ID FROM Customer
INTERSECT
SELECT CUSTOMER_ID FROM Orders;

--EXCEPT
--Fetch customer IDs in Customer but not in Orders.
SELECT CUSTOMER_ID FROM Customer
EXCEPT
SELECT CUSTOMER_ID FROM Orders;

--WINDOW Function

--ROW_NUMBER()
--Assign a unique row number to each customer, ordered by their date of birth.
SELECT CUSTOMER_ID, CUSTOMER_DOB, ROW_NUMBER() OVER (ORDER BY CUSTOMER_DOB) AS RowNum
FROM Customer;

--RANK()
--Rank customers by their date of birth, with ties receiving the same rank.
SELECT CUSTOMER_ID, CUSTOMER_DOB, RANK() OVER (ORDER BY CUSTOMER_DOB) AS Rank
FROM Customer;

--DENSE_RANK()
--Rank customers by their date of birth, but without skipping ranks for ties.
SELECT CUSTOMER_ID, CUSTOMER_DOB, DENSE_RANK() OVER (ORDER BY CUSTOMER_DOB) AS DenseRank
FROM Customer;

--NTILE()
--Divide customers into 4 equal groups based on their date of birth.
SELECT CUSTOMER_ID, CUSTOMER_DOB, NTILE(4) OVER (ORDER BY CUSTOMER_DOB) AS Quartile
FROM Customer;

--LAG()
--Get the previous customer's date of birth for each customer.
SELECT CUSTOMER_ID, CUSTOMER_DOB, LAG(CUSTOMER_DOB) OVER (ORDER BY CUSTOMER_DOB) AS PreviousDOB
FROM Customer;

--LEAD()
--Get the next customer's date of birth for each customer.
SELECT CUSTOMER_ID, CUSTOMER_DOB, LEAD(CUSTOMER_DOB) OVER (ORDER BY CUSTOMER_DOB) AS NextDOB
FROM Customer;




