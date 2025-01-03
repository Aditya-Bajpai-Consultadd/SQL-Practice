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
    3. Performance - The performance of the database is linked tightly with the complexity of relation between tables.

### Non-Relational Database 
A non-relational database, sometimes called NoSQL (Not Only SQL), is any kind of database that doesn’t use the tables, fields,
and columns structured data concept from relational databases.
Different database store data in different ways.

### When to use a relational database  
If you’re creating a project where the data is predictable, in terms of structure, size, and frequency of access, relational databases are the best choice.  
Normalization can help reduce the size of the data on disk by limiting duplicate data and anomalies, decreasing the risk of requiring vertical scaling in future.

### When to use a non relational database
    If the data being stored needs to be flexible in terms of shape or size, or if it needs to be open to change in future, then a non-relational database is more appropriate.
