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
        (2, 'kruckert1@shareasale.com', 'BPbl5J'),
        (3, 'mrippen2@domainmarket.com', 'jE08z4QRL'),
        (4, 'jscase3@comcast.net', 'NkClyuvak'),
        (5, 'asnasdell4@flavors.me', 'hiIAyYF');

INSERT INTO users (user_id, email, password)
    VALUES (1, 'agohier0@booking.com', 'xpnTTJ8'),
        (2, 'bswaden1@youku.com', 'snzG67SUR'),
        (3, 'cmathewes2@ibm.com', 'HEvXuBuQl3Z'),
        (4, 'bforten3@sciencedaily.com', 'VYzYI8jyC'),
        (5, 'ibeardow4@adobe.com', '7J0upL'),
        (6, 'ohuntingford5@wufoo.com', 'vIZzqNaWyW'),
        (7, 'rmckechnie6@zdnet.com', 'iYhnr62Fn'),
        (8, 'cbutlerbowdon7@google.cn', 'a6tZQabIL'),
        (9, 'msoaper8@paginegialle.it', 'DDuqpotcX'),
        (10, 'felijah9@elegantthemes.com', 'nmsgpuUo43b');

INSERT INTO address (user_id, street_number, street_name, city, state, country, postal_code, designation) 
    VALUES (1, '27527', 'Shoshone', 'Atlanta', 'Georgia', 'United States', '30351', 'work'),
        (2, '0', 'Waxwing', 'Rockford', 'Illinois', 'United States', '61105', 'home'),
        (3, '7838', 'Evergreen', 'Phoenix', 'Arizona', 'United States', '85025', 'home'),
        (4, '9', 'Killdeer', 'Ladysmith', 'British Columbia', 'Canada', NULL, 'home'),
        (5, '88', 'Towne', 'Seattle', 'Washington', 'United States', '98104', 'work'),
        (6, '79108', 'Vermont', 'Barrie', 'Ontario', 'Canada', 'L9J', 'home'),
        (7, '966', 'Steensland', 'Saint-Sauveur', 'Québec', 'Canada', 'J0R', NULL),
        (8, '01754', 'Hanson', 'Marystown', 'Newfoundland and Labrador', 'Canada', 'L2N', NULL),
        (9, '1695', 'Lakeland', 'Albuquerque', 'New Mexico', 'United States', '87105', 'work'),
        (10, '52440', 'Merry', 'Arlington', 'Texas', 'United States', '76011', 'home');

INSERT INTO telephone (user_id, phone_number, designation)
    VALUES (1, '5623560622', 'work'),
        (2, '4473604365', 'home'),
        (3, '3695527831', 'mobile'),
        (4, '4344699876', 'home'),
        (5, '5369351277', 'work'),
        (6, '5087655329', 'mobile'),
        (7, '4374569631', 'work'),
        (8, '2618996475', 'home'),
        (9, '3605600615', 'mobile'),
        (10, '6072920866', 'work');

INSERT INTO payment_method (user_id, method_id, account_number)
    VALUES (1, 1, '34-175-9681'),
        (2, 1, '22-867-5650'),
        (3, 1, '22-796-6933'),
        (4, 1, '38-616-9923'),
        (5, 1, '57-972-6811'),
        (6, 1, '21-487-4424'),
        (7, 1, '26-721-5240'),
        (8, 1, '16-976-3616'),
        (9, 1, '50-151-9909'),
        (10, 1, '55-342-6162');

INSERT INTO bill (bill_id, user_id, bill_amount)
    VALUES (1, 1, 50),
        (2, 2, 100),
        (3, 3, 10),
        (4, 4, 20),
        (5, 5, 100),
        (6, 6, 20),
        (8, 8, 10),
        (9, 9, 50),
        (10, 10, 50);

INSERT INTO payment (payment_id, user_id, bill_id, payment_amount)
    VALUES (1, 4, 4, 20),
        (2, 5, 5, 60.8),
        (3, 1, 1, 22.08),
        (4, 8, 8, 5.41),
        (5, 6, 6, 19.91),
        (6, 2, 2, 100),
        (7, 9, 9, 50),
        (8, 10, 10, 49.99);
