

ALTER TABLE Customer 
ADD FOREIGN KEY (ORDER_ID) References ORDERS(ORDER_ID);

ALTER TABLE Customer 
ADD FOREIGN KEY (ADDRESS_ID) References ADDRESS(ADDRESS_ID);

ALTER TABLE Orders 
ADD FOREIGN KEY (PRODUCT_ID) References PRODUCT(PRODUCT_ID);