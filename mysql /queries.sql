USE Rreal_estate_rental;

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE property_photo;
TRUNCATE TABLE property;
TRUNCATE TABLE user_email;
TRUNCATE TABLE user_phone;
TRUNCATE TABLE user;
TRUNCATE TABLE location;

SET FOREIGN_KEY_CHECKS = 1;

insert into user (full_name, password, role) VALUES
('Abel Yohannis', 'abel1323', 'owner'),
('Bereket Simegn', 'bereket8823', 'tenant'),
('Dagmawit Binyam', 'dagma124', 'owner'),
('Ashenafi Gebremedhin', 'ashenafi1243', 'tenant'),
('Eden Alemayehu', 'eden1123', 'owner');

insert into user_email (user_id, email)
SELECT user_id, 'abel@gmail.com' from user where full_name='Abel Yohannis';

INSERT INTO user_email (user_id, email)
SELECT user_id, 'bereket@gmail.com' from user where full_name='Bereket Simegn';

INSERT INTO user_email (user_id, email)
SELECT user_id, 'dagmawit@gmail.com' from user where full_name='Dagmawit Binyam';

INSERT INTO user_email (user_id, email)
SELECT user_id, 'ashenafi@gmail.com' from user where full_name='Ashenafi Gebremedhin';

INSERT INTO user_email (user_id, email)
SELECT user_id, 'eden@gmail.com' from user where full_name='Eden Alemayehu';

INSERT INTO user_phone (user_id, phone)
SELECT user_id, '0911451811' from user where full_name='Abel Yohannis';

INSERT INTO user_phone (user_id, phone)
SELECT user_id, '0922672222' from user where full_name='Bereket Simegn';

INSERT INTO user_phone (user_id, phone)
SELECT user_id, '0933333333' from user where full_name='Dagmawit Binyam';

INSERT INTO user_phone (user_id, phone)
SELECT user_id, '0948944444' from user where full_name='Ashenafi Gebremedhin';

INSERT INTO user_phone (user_id, phone)
SELECT user_id, '0955554795' from user where full_name='Eden Alemayehu';

INSERT INTO location (city, subcity) VALUES
('Addis Ababa', 'Bole'),
('Addis Ababa', 'Kirkos'),
('Addis Ababa', 'Yeka');

--  INSERT PROPERTIES (ONLY OWNERS)
INSERT INTO property (user_id, location_id, title, description, property_type, price, bedrooms, area_size, status)
SELECT user_id, 1, 'Modern Apartment', 'Nice apartment in Bole', 'Apartment', 15000, 3, 120, 'available'
from user where full_name='Abel Yohannis';

INSERT INTO property (user_id, location_id, title, description, property_type, price, bedrooms, area_size, status)
SELECT user_id, 2, 'Family House', 'Spacious house in Kirkos', 'House', 20000, 4, 200, 'available'
from user where full_name='Dagmawit Binyam';

INSERT INTO property (user_id, location_id, title, description, property_type, price, bedrooms, area_size, status)
SELECT user_id, 3, 'Studio Room', 'Affordable studio in Yeka', 'Studio', 8000, 1, 60, 'available'
from user where full_name='Eden Alemayehu';

--  INSERT photo
INSERT INTO property_photo (property_id, photo_url)
SELECT property_id, 'https://homebnc.com/homeimg/2020/09/03e-small-apartment-living-room-decor-ideas-homebnc-v5.jpg'
from property where title='Modern Apartment';

INSERT INTO property_photo (property_id, photo_url)
SELECT property_id, 'https://cloudfrontgharpediabucket.gharpedia.com/uploads/2022/06/Small-apartment-Decorating-Ideas-01-0503010065-1.jpg'
from property where title='Modern Apartment';

INSERT INTO property_photo (property_id, photo_url)
SELECT property_id, 'https://cdn.decorilla.com/online-decorating/wp-content/uploads/2018/03/5ecf09d9b17b63c73fff8d26cff80b41fc151678.jpg'
from property where title='Family House';

INSERT INTO property_photo (property_id, photo_url)
SELECT property_id, 'https://tse2.mm.bing.net/th/id/OIP.usdFNywvFlToaw0Ir37pTQHaEt?rs=1&pid=ImgDetMain&o=7&rm=3'
FROM property WHERE title='Studio Room';
-- some queries are here
SELECT p.title, p.price, p.bedrooms, l.city, l.subcity, ph.photo_url
FROM property p
JOIN location l ON p.location_id = l.location_id
LEFT JOIN property_photo ph ON p.property_id = ph.property_id;

SELECT p.*, u.full_name, ue.email, up.phone, l.city, l.subcity
FROM property p
JOIN user u ON p.user_id = u.user_id
JOIN user_email ue ON u.user_id = ue.user_id
JOIN user_phone up ON u.user_id = up.user_id
JOIN location l ON p.location_id = l.location_id
WHERE p.property_id = 1;

SELECT * 
FROM property
WHERE price <= 20000
AND bedrooms >= 2
AND status = 'available';
-----
SELECT * 
FROM property
WHERE status = 'available';

----
USE Rreal_estate_rental;
SELECT 
    p.property_id,
    p.title,
    p.description,
    p.property_type,
    p.price,
    p.bedrooms,
    p.area_size,
    p.status,
    u.full_name AS owner_name,
    ue.email AS owner_email,
    up.phone AS owner_phone,
    l.city,
    l.subcity,
    pp.photo_url
FROM property p
JOIN user u ON p.user_id = u.user_id
LEFT JOIN user_email ue ON u.user_id = ue.user_id
LEFT JOIN user_phone up ON u.user_id = up.user_id
JOIN location l ON p.location_id = l.location_id
LEFT JOIN property_photo pp ON p.property_id = pp.property_id
ORDER BY p.property_id;


