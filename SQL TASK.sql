create database practical;
use practical;
create table if not exists unlabeled_image_predictions (
image_id int ,
score float
);
INSERT INTO unlabeled_image_predictions (image_id, score) VALUES (851, 0.9996);
INSERT INTO unlabeled_image_predictions (image_id, score) VALUES (165, 0.8932);
INSERT INTO unlabeled_image_predictions (image_id, score) VALUES (916, 0.9091);
INSERT INTO unlabeled_image_predictions (image_id, score) VALUES (533, 0.6347);
INSERT INTO unlabeled_image_predictions (image_id, score) VALUES (929, 0.3607);
INSERT INTO unlabeled_image_predictions (image_id, score) VALUES (204, 0.0308);
INSERT INTO unlabeled_image_predictions (image_id, score) VALUES (186, 0.9559);
INSERT INTO unlabeled_image_predictions (image_id, score) VALUES (103, 0.7456);
INSERT INTO unlabeled_image_predictions (image_id, score) VALUES (546, 0.681);
INSERT INTO unlabeled_image_predictions (image_id, score) VALUES (41, 0.1913);


-- select * from unlabeled_image_predictions order by score desc;

--PROPOSED SOLUTION TO THE GIVEN TASK
(Select image_id, score  from (
Select image_id, score,ROW_NUMBER() OVER (ORDER BY score DESC) as rownum from 
unlabeled_image_predictions ) as u Where u.rownum%3=1 AND score>0.5 LIMIT 10000)
UNION ALL
(Select image_id, score from (
Select image_id, score,ROW_NUMBER() OVER (ORDER BY score) as rownum from 
unlabeled_image_predictions )as u Where u.rownum%3=1 AND score<0.5 LIMIT 10000);





