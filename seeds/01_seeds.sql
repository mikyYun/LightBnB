INSERT INTO users (name, email, password)
VALUES ('Eva Stanley', 'sebastianguerra@ymail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Louisa Meyer', 'jacksonrose@hotmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Dominic Parks', 'victoriablackwell@outlook.com', ' $2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Sue Luna', 'jasonvincent@gmx.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Sue Lunaa', 'jacksondavid@gmx.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Sue Lunae', 'charlielevy@yahoo.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Sue Lunay', 'makaylaweiss@icloud.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Sue Lunal', 'jaycereynolds@inbox.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');


INSERT INTO properties (owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street,  city, province, post_code, active )
VALUES (1, 'Glass Ceil', 'description', 'https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg', '500', 6, 4, 7, 'Canada', '1 st Road', 'Vic', 'BC', '12345', 'true'),
(1, 'Glass Ground', 'description', 'https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg', '5000', 6, 5, 7, 'Canada', '2 nd Road', 'Victoria', 'BC', '12346', 'true'),
(3, 'Space House', 'description', 'https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg', '1111', 5, 4, 5, 'Canada', '3 rd Road', 'Nanaimo', 'BC', '12341', 'true'),
(3, 'Fall Fall', 'description', 'https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg', '20000', 2, 2, 2, 'Canada', '5 st Road', 'Squamish', 'BC', '12345', 'true'),
(2, 'Fall Fall', 'description', 'https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg', '15000', 3, 4, 3, 'Canada', '10th Avenue', 'Vancouver', 'BC', '22222', 'true'),
(5, 'Snowy Fall', 'description', 'https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg', '55886', 2, 2, 2, 'Canada', '999 Street', 'Whistler', 'BC', '7000', 'true'),
(4, 'Under The Moon', 'description', 'https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg', '65634', 1, 2, 2, 'Canada', '0 Street', 'Richmond', 'BC', '22111', 'true'),
(6, 'Tree Forest', 'description', 'https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg', '15222', 4, 6, 6, 'Canada', 'Forest Street', 'Mission', 'BC', '9999', 'true');

INSERT INTO reservations (start_date, end_date, property_id, guest_id)
VALUES ('2018-08-30', '2018-09-26', 3, 4),
('2018-09-11', '2018-09-26', 2, 2),
('2018-09-11', '2018-09-12', 1, 3),
('2018-09-11', '2018-09-26', 4, 8),
('2018-09-11', '2018-09-26', 6, 7),
('2018-09-26', '2018-10-01', 5, 1),
('2019-12-23', '2019-12-31', 5, 4),
('2020-09-15', '2020-09-19', 1, 4);

INSERT INTO property_reviews(guest_id, property_id, reservation_id, rating, message)
VALUES (2, 3, 1, 3, 'message'),
(1, 2, 2, 5, 'message'),
(3, 1, 3, 3, 'message'),
(8, 4, 4, 3, 'message'),
(7, 2, 5, 3, 'message'),
(1, 5, 6, 4, 'message'),
(4, 5, 7, 5, 'message'),
(4, 1, 8, 5, 'message');