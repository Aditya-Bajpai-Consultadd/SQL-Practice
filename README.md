# SQL-Practice

# Topics Covered - 
**Introduction to Databases**   
    1. [Types of Databases- Relational vs Non-Relational](#types-of-databases--relational-vs-non-relational)  
    2. SQL vs NoSQL Databases
    
2. Relational Database Fundamentals
    1. Database design concepts
    2. Entity-Relationship (ER) model
    3. Tables, rows, and columns
    4. Primary keys and foreign keys
    5. Normalization (1NF, 2NF, 3NF, BCNF)
    6. Denormalization and when to use it



# Introduction to Databases 

## Types of Databases- Relational vs Non-Relational  
### Relational Databases
    Relational Database store information in the form of tables. Multiple tables share information between them causeing them to have a relationship.
    Hence, the name relational database.

    In a relational database, every table has a defined number of columns that define the information being stored and rows that stores the actual data.
    Each table must have a unique column to uniquely identify every single row of the table. That column is named the primary key. To establish 
    relationship between multple tables foreign key concept is used. SQL is used to interact with a relational database to perform CRUD operations.
#### Advantages 
    1. ACID Compliance  
    2. Data Accuracy  
    3. Normalization  
    4. Simplicity

#### Disadvantages
    1. Scalability - These are intended to run on a single machine. Hence vertical scalability becomes an issue.  
    2. Flexibility - The Schema is predefined once and is rigid to any change.
    3. Performance - The performance of the database is linked tightly with the complexity of relatino between tables.


    
