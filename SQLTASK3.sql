create database sqltaskkk;
use sqltaskkk;


CREATE TABLE ACCOUNTS (
    id INT PRIMARY KEY,
    username VARCHAR(255) NOT NULL
);


CREATE TABLE ITEMS (
    id INT PRIMARY KEY,
    TYPE ENUM('sword', 'shield', 'armor') NOT NULL,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE ACCOUNT_ITEMS (
    account_id INT,
    item_id INT,
    quality ENUM('common', 'epic', 'rare') NOT NULL,
    FOREIGN KEY (account_id) REFERENCES accounts(id),
    FOREIGN KEY (item_id) REFERENCES items(id)
);


INSERT INTO ACCOUNTS (id, username) VALUES
(1, 'cmunns1'),
(2, 'yworcs0');


INSERT INTO ITEMS (id, type, name) VALUES
(1, 'sword', 'Sword of Solanaceae'),
(2, 'shield', 'Shield of Rosaceae'),
(3, 'shield', 'Shield of Fagaceae'),
(5, 'shield', 'Shield of Lauraceae'),
(6, 'shield', 'Shield of Asteraceae'),
(7, 'armor', 'Armor of Myrtaceae'),
(8, 'shield', 'Shield of Rosaceae'),
(10, 'shield', 'Shield of Rosaceae');


INSERT INTO ACCOUNT_ITEMS (account_id, item_id, quality) VALUES
(1, 10, 'epic'),
(1, 2, 'rare'),
(1, 7, 'rare'),
(1, 1, 'common'),
(1, 3, 'common'),
(1, 5, 'common'),
(1, 8, 'common'),
(2, 8, 'epic'),
(2, 5, 'rare'),
(2, 3, 'common'),
(2, 6, 'common');



SELECT acc.username,i.type,accItem.quality,i.name FROM ACCOUNT_ITEMS as accItem
JOIN ACCOUNTS acc ON acc.id = accItem.account_id
JOIN ITEMS i ON accItem.item_id = i.id
WHERE accItem.quality = (
        SELECT accItem2.quality FROM ACCOUNT_ITEMS accItem2
        JOIN items i_sub ON accItem2.item_id = i_sub.id
        WHERE accItem2.account_id = accItem.account_id AND i_sub.type = i.type
		ORDER BY CASE 
                WHEN accItem2.quality = 'epic' THEN 1
                when accItem2.quality = 'common' THEN 2
                WHEN accItem2.quality = 'rare' THEN 3
                END LIMIT 1)
ORDER BY acc.username, CASE 
        WHEN i.type = 'armor' THEN 1
        WHEN i.type = 'shield' THEN 2
        WHEN i.type = 'sword' THEN 3
		END;


