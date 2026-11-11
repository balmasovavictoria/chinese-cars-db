CREATE DATABASE IF NOT EXISTS ChineseCarsDB;            
USE ChineseCarsDB;

CREATE TABLE Brands (                                   
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(50) NOT NULL
);

CREATE TABLE Models (
    model_id INT PRIMARY KEY,
    model_name VARCHAR(100) NOT NULL,
    brand_id INT NOT NULL,
    FOREIGN KEY (brand_id) REFERENCES Brands(brand_id)
);

CREATE TABLE DriveTypes (
    drive_id INT PRIMARY KEY,
    drive_name VARCHAR(20) NOT NULL
);

CREATE TABLE BodyTypes (
    body_id INT PRIMARY KEY,
    body_name VARCHAR(30) NOT NULL
);

CREATE TABLE EngineTypes (
    engine_id INT PRIMARY KEY,
    engine_name VARCHAR(30) NOT NULL
);

CREATE TABLE Countries (
    country_id INT PRIMARY KEY,
    country_name VARCHAR(50) NOT NULL
);

CREATE TABLE Cars (
    car_id INT PRIMARY KEY,
    model_id INT NOT NULL,
    price DECIMAL(5,3) NOT NULL,
    hp INT NOT NULL,
    fuel DECIMAL(3,1) NOT NULL,
    engine_volume DECIMAL(2,1) NOT NULL,
    drive_id INT NOT NULL,
    body_id INT NOT NULL,
    engine_id INT NOT NULL,
    country_id INT NOT NULL,
    rating DECIMAL(2,1) NOT NULL,
    FOREIGN KEY (model_id) REFERENCES Models(model_id),
    FOREIGN KEY (drive_id) REFERENCES DriveTypes(drive_id),
    FOREIGN KEY (body_id) REFERENCES BodyTypes(body_id),
    FOREIGN KEY (engine_id) REFERENCES EngineTypes(engine_id),
    FOREIGN KEY (country_id) REFERENCES Countries(country_id)
);

CREATE TABLE Reviews (
    review_id INT PRIMARY KEY,
    car_id INT NOT NULL,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    review_date DATE NOT NULL,
    FOREIGN KEY (car_id) REFERENCES Cars(car_id)
);

ALTER TABLE Cars ADD COLUMN trunk_volume INT;           


INSERT INTO Brands (brand_id, brand_name) VALUES      
(1, 'Haval'), (2, 'Chery'), (3, 'Geely'), (4, 'Changan'), (5, 'OMODA'), (6, 'Jaecoo'), (7, 'Tank'), (8, 'GAC'), (9, 'Exeed'), (10, 'Jetour'), (11, 'Hongqi'), (12, 'Voyah'), (13, 'Li Auto'), (14, 'Zeekr');

INSERT INTO DriveTypes (drive_id, drive_name) VALUES (0, 'Передний'), (1, 'Полный');
INSERT INTO BodyTypes (body_id, body_name) VALUES (1, 'Седан'), (2, 'Кроссовер'), (3, 'Внедорожник'), (4, 'Минивэн');
INSERT INTO EngineTypes (engine_id, engine_name) VALUES (1, 'Бензиновый'), (2, 'Гибрид'), (3, 'Электро');
INSERT INTO Countries (country_id, country_name) VALUES (1, 'Китай'), (2, 'Россия'), (3, 'Беларусь');

INSERT INTO Models (model_id, model_name, brand_id) VALUES 
(1, 'Jolion', 1), (2, 'F7x', 1), (3, 'F7 II', 1), (4, 'M6 II', 1), (5, 'H9 II', 1), (6, 'H7 I', 1), (7, 'Dargo I', 1), (8, 'H5 II', 1), (9, 'H3 I', 1),
(10, 'Tiggo 7 Pro Max', 2), (11, 'Tiggo 9', 2), (12, 'Tiggo 4', 2), (13, 'Tiggo 8 Pro Max', 2), (14, 'Tiggo 7L', 2), (15, 'Arrizo 8', 2),
(16, 'Coolray', 3), (17, 'Monjaro I', 3), (18, 'Preface I', 3), (19, 'Atlas II', 3), (20, 'Cityray', 3), (21, 'EX5 EM-i', 3),
(22, 'UNI-K', 4), (23, 'CS35 Max', 4), (24, 'UNI-V', 4), (25, 'CS75 Plus III', 4), (26, 'CS95 Plus', 4), (27, 'Alsvin', 4), (28, 'UNI-S I', 4), (29, 'Deepal G318', 4), (30, 'CS75 Plus IV', 4), (31, 'CS75 Pro', 4), (32, 'UNI-Z', 4),
(33, 'C5', 5), (34, 'S5', 5), (35, 'S5 GT', 5), (36, 'C7', 5),
(37, 'J6', 6), (38, 'J7', 6), (39, 'J8', 6),
(40, '300 I', 7), (41, '400 I', 7), (42, '500 I', 7), (43, '700', 7),
(44, 'GS8 II', 8), (45, 'GS8 Dragon', 8), (46, 'GS4', 8), (47, 'M8', 8), (48, 'Emrow', 8), (49, 'GS8 Traveller', 8), (50, 'S7', 8), (51, 'S9', 8),
(52, 'VX', 9), (53, 'TXL', 9), (54, 'Exlantix ET', 9), (55, 'Exlantix ES', 9), (56, 'RX', 9),
(57, 'T1', 10), (58, 'X90+', 10), (59, 'T2', 10), (60, 'Dashing', 10),
(61, 'HS3', 11), (62, 'H6', 11), (63, 'HS7', 11), (64, 'H5', 11), (65, 'H9', 11),
(66, 'Free', 12),
(67, 'L6', 13), (68, 'L9', 13), (69, 'L7', 13),
(70, '9X', 14), (71, '8X', 14);

INSERT INTO Cars (car_id, model_id, price, hp, fuel, engine_volume, drive_id, body_id, engine_id, country_id, rating) VALUES 
(1, 1, 2.599, 143, 8.1, 1.5, 1, 2, 1, 1, 4.6), (2, 10, 2.800, 147, 7.6, 1.6, 1, 2, 1, 1, 4.5), (3, 16, 2.740, 147, 6.5, 1.5, 0, 2, 1, 1, 4.5), (4, 33, 2.779, 150, 7.4, 1.6, 1, 2, 1, 1, 4.6), (5, 50, 5.999, 340, 7.0, 1.5, 1, 4, 2, 1, 4.8), (6, 2, 3.744, 231, 8.5, 2.0, 1, 2, 1, 1, 4.5), (7, 3, 2.744, 150, 7.3, 1.5, 0, 2, 1, 1, 4.8), (8, 4, 2.299, 143, 8.7, 1.5, 0, 2, 1, 1, 4.3), (9, 5, 5.299, 218, 10.6, 2.0, 1, 3, 1, 1, 4.9), (10, 6, 4.199, 231, 9.0, 2.0, 1, 2, 1, 1, 4.8), (11, 7, 3.899, 192, 9.2, 2.0, 1, 3, 1, 1, 4.6), (12, 8, 4.349, 200, 9.8, 2.0, 1, 3, 1, 1, 4.6), (13, 9, 2.499, 143, 7.7, 1.5, 0, 2, 1, 1, 4.6), (14, 21, 2.999, 167, 6.2, 1.5, 0, 2, 2, 1, 4.5), (15, 17, 4.379, 238, 8.5, 2.0, 1, 2, 1, 1, 4.6), (16, 18, 2.799, 150, 7.1, 2.0, 0, 1, 1, 1, 5.0), (17, 19, 2.829, 147, 6.8, 1.5, 0, 2, 1, 1, 4.6), (18, 20, 2.488, 147, 6.5, 1.5, 0, 2, 1, 1, 4.7), (19, 22, 3.929, 226, 8.9, 2.0, 1, 2, 1, 1, 4.5), (20, 23, 2.539, 147, 7.8, 1.5, 0, 2, 1, 1, 4.5), (21, 24, 3.029, 181, 6.2, 1.5, 0, 1, 1, 1, 4.5), (22, 25, 3.179, 226, 7.9, 2.0, 1, 2, 1, 1, 4.5), (23, 26, 4.509, 233, 10.3, 2.2, 1, 3, 1, 1, 4.4), (24, 27, 1.719, 98, 6.2, 1.5, 0, 1, 1, 1, 3.9), (25, 28, 2.599, 181, 5.9, 1.5, 0, 2, 1, 1, 4.6), (26, 29, 4.625, 439, 7.5, 1.5, 1, 3, 2, 1, 4.6), (27, 30, 3.959, 235, 8.8, 2.0, 1, 2, 1, 1, 4.6), (28, 31, 2.855, 181, 7.2, 1.5, 0, 2, 1, 1, 4.6), (29, 32, 2.499, 181, 6.8, 1.5, 0, 2, 1, 1, 4.6), (30, 40, 5.699, 245, 10.2, 2.0, 1, 3, 1, 1, 4.7), (31, 41, 6.799, 299, 8.5, 2.0, 1, 3, 1, 1, 4.8), (32, 42, 4.949, 220, 10.7, 2.0, 1, 3, 1, 1, 4.8), (33, 43, 10.299, 354, 12.5, 3.0, 1, 3, 1, 1, 4.9), (34, 44, 4.774, 231, 9.2, 2.0, 1, 3, 1, 1, 4.8), (35, 45, 4.774, 231, 10.4, 2.0, 1, 3, 1, 1, 4.8), (36, 46, 3.299, 231, 9.2, 2.0, 1, 3, 1, 1, 4.8), (37, 47, 5.690, 231, 8.5, 2.0, 1, 4, 1, 1, 4.6), (38, 48, 3.019, 170, 5.9, 1.5, 0, 3, 1, 1, 4.8), (39, 49, 4.949, 231, 10.1, 2.0, 1, 3, 1, 1, 4.6), (40, 50, 6.799, 340, 7.4, 1.5, 1, 4, 2, 1, 4.8), (41, 37, 4.132, 149, 8.1, 2.0, 1, 3, 1, 1, 4.5), (42, 38, 2.398, 147, 7.5, 1.5, 0, 2, 1, 1, 4.5), (43, 38, 2.669, 150, 7.1, 1.6, 0, 2, 1, 1, 4.5), (44, 11, 3.505, 245, 8.3, 2.0, 1, 2, 1, 1, 4.8), (45, 15, 3.025, 150, 7.5, 1.6, 0, 1, 1, 1, 4.7), (46, 14, 2.575, 150, 10.0, 1.6, 1, 2, 1, 1, 4.7), (47, 13, 2.790, 197, 8.3, 2.0, 1, 2, 1, 1, 4.6), (48, 12, 1.990, 147, 6.8, 1.5, 0, 2, 1, 1, 4.8), (49, 11, 3.539, 261, 8.5, 2.0, 1, 2, 1, 1, 4.6), (50, 36, 3.099, 150, 8.0, 1.6, 1, 2, 1, 1, 4.8), (51, 34, 1.729, 113, 7.3, 1.5, 0, 1, 1, 1, 4.6), (52, 35, 2.079, 147, 6.9, 1.5, 0, 1, 1, 1, 4.8), (53, 61, 3.330, 245, 7.5, 2.0, 1, 2, 1, 1, 4.5), (54, 62, 4.099, 245, 6.8, 2.0, 0, 1, 1, 1, 4.7), (55, 63, 5.290, 245, 8.2, 2.0, 1, 2, 1, 1, 4.3), (56, 64, 4.380, 218, 6.6, 2.0, 0, 1, 1, 1, 4.6), (57, 65, 5.590, 245, 7.1, 2.0, 0, 1, 1, 1, 4.4), (58, 52, 4.690, 249, 8.2, 2.0, 1, 3, 1, 1, 4.7), (59, 53, 3.519, 197, 9.2, 2.0, 1, 3, 1, 1, 5.0), (60, 54, 5.865, 469, 6.4, 1.5, 1, 3, 3, 1, 4.7), (61, 55, 5.000, 469, 6.4, 1.5, 1, 1, 3, 1, 4.7), (62, 56, 4.052, 249, 8.5, 2.0, 1, 3, 1, 1, 4.6), (63, 57, 3.974, 245, 9.7, 2.0, 1, 3, 1, 1, 4.7), (64, 58, 3.999, 245, 8.1, 2.0, 1, 3, 1, 1, 4.3), (65, 59, 4.359, 245, 9.7, 2.0, 1, 3, 1, 1, 4.8), (66, 60, 2.209, 147, 7.8, 1.5, 0, 2, 1, 1, 4.5), (67, 66, 4.725, 490, 0.8, 1.5, 1, 3, 2, 1, 4.6), (68, 67, 6.427, 408, 0.7, 1.5, 1, 3, 2, 1, 4.9), (69, 68, 10.551, 449, 7.6, 1.5, 1, 3, 2, 1, 4.9), (70, 69, 8.898, 449, 7.4, 1.5, 1, 3, 2, 1, 4.9), (71, 70, 10.649, 898, 7.1, 2.0, 1, 3, 3, 1, 4.5), (72, 71, 11.199, 898, 0.3, 2.0, 1, 3, 3, 1, 4.5);



INSERT INTO Reviews (review_id, car_id, rating, review_date) VALUES 
(1, 1, 5, '2026-03-15'), (2, 1, 4, '2026-04-22'), (3, 1, 5, '2026-05-03'),
(4, 2, 4, '2026-02-10'), (5, 2, 5, '2026-05-18'), (6, 3, 4, '2026-03-05'), 
(7, 3, 5, '2026-04-12'), (8, 4, 5, '2026-01-20'), (9, 4, 4, '2026-06-14'), 
(10, 5, 5, '2026-05-08'), (11, 5, 5, '2026-06-25'), (12, 9, 5, '2026-01-13'), 
(13, 9, 5, '2026-05-27'), (14, 16, 5, '2026-03-06'), (15, 16, 5, '2026-04-20'), 
(16, 33, 5, '2026-03-20'), (17, 33, 4, '2026-06-14'), (18, 50, 5, '2026-05-08'), 
(19, 50, 5, '2026-06-25');


UPDATE Cars SET price = 2.650 WHERE car_id = 1;                
DELETE FROM Reviews WHERE review_id = 19;                      

CREATE USER 'analyst_user'@'localhost' IDENTIFIED BY 'analyst_pass';  
CREATE USER 'buyer_user'@'localhost' IDENTIFIED BY 'buyer_pass';
GRANT SELECT, INSERT, UPDATE ON ChineseCarsDB.* TO 'analyst_user'@'localhost';
GRANT SELECT ON ChineseCarsDB.* TO 'buyer_user'@'localhost';
FLUSH PRIVILEGES;

DESCRIBE Brands;       
DESCRIBE Models;
DESCRIBE DriveTypes;
DESCRIBE BodyTypes;
DESCRIBE EngineTypes;
DESCRIBE Countries;
DESCRIBE Cars;
DESCRIBE Reviews;

SELECT m.model_name, c.price, c.hp 
FROM Cars c, Models m 
WHERE c.model_id = m.model_id AND c.price <= 2.800
ORDER BY c.hp DESC;

SELECT m.model_name, r.rating, r.review_date
FROM Reviews r
JOIN Cars c ON r.car_id = c.car_id
JOIN Models m ON c.model_id = m.model_id
ORDER BY r.review_date ASC;

SELECT 
    COUNT(*) AS 'Всего моделей',
    MAX(price) AS 'Макс. цена',
    MIN(price) AS 'Мин. цена',
    ROUND(AVG(fuel), 2) AS 'Средний расход',
    ROUND(AVG(hp), 2) AS 'Средняя мощность',
    SUM(price) AS 'Суммарная стоимость'
FROM Cars;

SELECT 
    m.model_name AS 'Модель', 
    ROUND(AVG(r.rating), 2) AS 'Средний балл',
    COUNT(r.review_id) AS 'Кол-во отзывов'
FROM Reviews r
JOIN Cars c ON r.car_id = c.car_id
JOIN Models m ON c.model_id = m.model_id
GROUP BY m.model_name
HAVING AVG(r.rating) > 4.5
ORDER BY AVG(r.rating) DESC;

SELECT 
    m.model_name AS 'Модель',
    ROUND(AVG(r.rating), 2) AS 'Средний балл',
    COUNT(r.review_id) AS 'Количество отзывов'
FROM Reviews r
JOIN Cars c ON r.car_id = c.car_id
JOIN Models m ON c.model_id = m.model_id
GROUP BY m.model_name
ORDER BY AVG(r.rating) DESC
LIMIT 10;

SELECT 
    CASE 
        WHEN price < 3.0 THEN 'Бюджетный (до 3 млн)'
        WHEN price BETWEEN 3.0 AND 5.0 THEN 'Средний (3-5 млн)'
        ELSE 'Премиум (свыше 5 млн)'
    END AS 'Ценовой сегмент',
    COUNT(*) AS 'Количество моделей',
    ROUND(AVG(hp), 1) AS 'Средняя мощность'
FROM Cars
GROUP BY 
    CASE 
        WHEN price < 3.0 THEN 'Бюджетный (до 3 млн)'
        WHEN price BETWEEN 3.0 AND 5.0 THEN 'Средний (3-5 млн)'
        ELSE 'Премиум (свыше 5 млн)'
    END;

SELECT 
    m.model_name AS 'Модель',
    c.price AS 'Цена (млн руб.)',
    c.hp AS 'Мощность (л.с.)'
FROM Cars c
JOIN Models m ON c.model_id = m.model_id
WHERE c.price < 3.0
ORDER BY c.price ASC;

SELECT 
    b.brand_name AS 'Бренд', 
    COUNT(m.model_id) AS 'Кол-во моделей', 
    ROUND(AVG(c.price), 2) AS 'Средняя цена (млн руб.)' 
FROM Brands b 
JOIN Models m ON b.brand_id = m.brand_id 
JOIN Cars c ON m.model_id = c.model_id 
GROUP BY b.brand_name
ORDER BY COUNT(m.model_id) DESC;