DELETE FROM application_search;
DELETE FROM posting_search;
DELETE FROM job_seeker_search;
DELETE FROM employer_search;
DELETE FROM search;
DELETE FROM application;
DELETE FROM posting;
DELETE FROM job_seeker;
DELETE FROM employer;
DELETE FROM payment;
DELETE FROM bill;
DELETE FROM payment_method;
DELETE FROM telephone;
DELETE FROM address;
DELETE FROM users;
DELETE FROM admin;


INSERT INTO admin (admin_id, email, password)
    VALUES (1, 'pcommander0@miitbeian.gov.cn', 'SkooM8d9mDD'),
    VALUES (2, 'kruckert1@shareasale.com', 'BPbl5J'),
    VALUES (3, 'mrippen2@domainmarket.com', 'jE08z4QRL'),
    VALUES (4, 'jscase3@comcast.net', 'NkClyuvak'),
    VALUES (5, 'asnasdell4@flavors.me', 'hiIAyYF');

INSERT INTO users (user_id, email, password)
    VALUES (1, 'agohier0@booking.com', 'xpnTTJ8'),
    VALUES (2, 'bswaden1@youku.com', 'snzG67SUR'),
    VALUES (3, 'cmathewes2@ibm.com', 'HEvXuBuQl3Z'),
    VALUES (4, 'bforten3@sciencedaily.com', 'VYzYI8jyC'),
    VALUES (5, 'ibeardow4@adobe.com', '7J0upL'),
    VALUES (6, 'ohuntingford5@wufoo.com', 'vIZzqNaWyW'),
    VALUES (7, 'rmckechnie6@zdnet.com', 'iYhnr62Fn'),
    VALUES (8, 'cbutlerbowdon7@google.cn', 'a6tZQabIL'),
    VALUES (9, 'msoaper8@paginegialle.it', 'DDuqpotcX'),
    VALUES (10, 'felijah9@elegantthemes.com', 'nmsgpuUo43b');

INSERT INTO address (user_id, street_number, street_name, city, state, country, postal_code, designation) 
    VALUES (1, '27527', 'Shoshone', 'Atlanta', 'Georgia', 'United States', '30351', 'work'),
    VALUES (2, '0', 'Waxwing', 'Rockford', 'Illinois', 'United States', '61105', 'home'),
    VALUES (3, '7838', 'Evergreen', 'Phoenix', 'Arizona', 'United States', '85025', 'home'),
    VALUES (4, '9', 'Killdeer', 'Ladysmith', 'British Columbia', 'Canada', NULL, 'home'),
    VALUES (5, '88', 'Towne', 'Seattle', 'Washington', 'United States', '98104', 'work'),
    VALUES (6, '79108', 'Vermont', 'Barrie', 'Ontario', 'Canada', 'L9J', 'home'),
    VALUES (7, '966', 'Steensland', 'Saint-Sauveur', 'Québec', 'Canada', 'J0R', NULL),
    VALUES (8, '01754', 'Hanson', 'Marystown', 'Newfoundland and Labrador', 'Canada', 'L2N', NULL),
    VALUES (9, '1695', 'Lakeland', 'Albuquerque', 'New Mexico', 'United States', '87105', 'work'),
    VALUES (10, '52440', 'Merry', 'Arlington', 'Texas', 'United States', '76011', 'home');

INSERT INTO telephone (user_id, phone_number, designation)
    VALUES (1, '5623560622', 'work'),
    VALUES (2, '4473604365', 'home'),
    VALUES (3, '3695527831', 'mobile'),
    VALUES (4, '4344699876', 'home'),
    VALUES (5, '5369351277', 'work'),
    VALUES (6, '5087655329', 'mobile'),
    VALUES (7, '4374569631', 'work'),
    VALUES (8, '2618996475', 'home'),
    VALUES (9, '3605600615', 'mobile'),
    VALUES (10, '6072920866', 'work');

INSERT INTO payment_method (user_id, method_id, account_number)
    VALUES (1, 1, '34-175-9681'),
    VALUES (2, 1, '22-867-5650'),
    VALUES (3, 1, '22-796-6933'),
    VALUES (4, 1, '38-616-9923'),
    VALUES (5, 1, '57-972-6811'),
    VALUES (6, 1, '21-487-4424'),
    VALUES (7, 1, '26-721-5240'),
    VALUES (8, 1, '16-976-3616'),
    VALUES (9, 1, '50-151-9909'),
    VALUES (10, 1, '55-342-6162');

INSERT INTO bill (bill_id, user_id, bill_amount)
    VALUES (1, 1, 50),
    VALUES (2, 2, 100),
    VALUES (3, 3, 10),
    VALUES (4, 4, 20),
    VALUES (5, 5, 100),
    VALUES (6, 6, 20),
    VALUES (8, 8, 10),
    VALUES (9, 9, 50),
    VALUES (10, 10, 50);

INSERT INTO payment (payment_id, user_id, bill_id, payment_amount)
    VALUES (1, 4, 4, 20),
    VALUES (2, 5, 5, 60.8),
    VALUES (3, 1, 1, 22.08),
    VALUES (4, 8, 8, 5.41),
    VALUES (5, 6, 6, 19.91),
    VALUES (6, 2, 2, 100),
    VALUES (7, 9, 9, 50),
    VALUES (8, 10, 10, 49.99);
