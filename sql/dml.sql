DELETE FROM admin;
DELETE FROM users;
DELETE FROM address;
DELETE FROM telephone;
DELETE FROM payment_method;
DELETE FROM bill;
DELETE FROM payment;
DELETE FROM employer;
DELETE FROM job_seeker;
DELETE FROM posting;
DELETE FROM application;
DELETE FROM search;
DELETE FROM employer_search;
DELETE FROM job_seeker_search;
DELETE FROM posting_search;
DELETE FROM application_search;

INSERT INTO admin (admin_id, email, password)
    VALUES (1, 'pcommander0@miitbeian.gov.cn', 'SkooM8d9mDD');
INSERT INTO admin (admin_id, email, password)
    VALUES (2, 'kruckert1@shareasale.com', 'BPbl5J');
INSERT INTO admin (admin_id, email, password)
    VALUES (3, 'mrippen2@domainmarket.com', 'jE08z4QRL');
INSERT INTO admin (admin_id, email, password)
    VALUES (4, 'jscase3@comcast.net', 'NkClyuvak');
INSERT INTO admin (admin_id, email, password)
    VALUES (5, 'asnasdell4@flavors.me', 'hiIAyYF');

INSERT INTO users (user_id, email, password)
    VALUES (1, 'agohier0@booking.com', 'xpnTTJ8');
INSERT INTO users (user_id, email, password)
    VALUES (2, 'bswaden1@youku.com', 'snzG67SUR');
INSERT INTO users (user_id, email, password)
    VALUES (3, 'cmathewes2@ibm.com', 'HEvXuBuQl3Z');
INSERT INTO users (user_id, email, password)
    VALUES (4, 'bforten3@sciencedaily.com', 'VYzYI8jyC');
INSERT INTO users (user_id, email, password)
    VALUES (5, 'ibeardow4@adobe.com', '7J0upL');
INSERT INTO users (user_id, email, password)
    VALUES (6, 'ohuntingford5@wufoo.com', 'vIZzqNaWyW');
INSERT INTO users (user_id, email, password)
    VALUES (7, 'rmckechnie6@zdnet.com', 'iYhnr62Fn');
INSERT INTO users (user_id, email, password)
    VALUES (8, 'cbutlerbowdon7@google.cn', 'a6tZQabIL');
INSERT INTO users (user_id, email, password)
    VALUES (9, 'msoaper8@paginegialle.it', 'DDuqpotcX');
INSERT INTO users (user_id, email, password)
    VALUES (10, 'felijah9@elegantthemes.com', 'nmsgpuUo43b');

INSERT INTO address (user_id, street_number, street_name, city, state, country, postal_code, designation) 
    VALUES (1, '27527', 'Shoshone', 'Atlanta', 'Georgia', 'United States', '30351', 'work');
INSERT INTO address (user_id, street_number, street_name, city, state, country, postal_code, designation)
    VALUES (2, '0', 'Waxwing', 'Rockford', 'Illinois', 'United States', '61105', 'home');
INSERT INTO address (user_id, street_number, street_name, city, state, country, postal_code, designation)
    VALUES (3, '7838', 'Evergreen', 'Phoenix', 'Arizona', 'United States', '85025', 'home');
INSERT INTO address (user_id, street_number, street_name, city, state, country, postal_code, designation)
    VALUES (4, '9', 'Killdeer', 'Ladysmith', 'British Columbia', 'Canada', NULL, 'home');
INSERT INTO address (user_id, street_number, street_name, city, state, country, postal_code, designation)
    VALUES (5, '88', 'Towne', 'Seattle', 'Washington', 'United States', '98104', 'work');
INSERT INTO address (user_id, street_number, street_name, city, state, country, postal_code, designation)
    VALUES (6, '79108', 'Vermont', 'Barrie', 'Ontario', 'Canada', 'L9J', 'home');
INSERT INTO address (user_id, street_number, street_name, city, state, country, postal_code, designation)
    VALUES (7, '966', 'Steensland', 'Saint-Sauveur', 'Québec', 'Canada', 'J0R', NULL);
INSERT INTO address (user_id, street_number, street_name, city, state, country, postal_code, designation)
    VALUES (8, '01754', 'Hanson', 'Marystown', 'Newfoundland and Labrador', 'Canada', 'L2N', NULL);
INSERT INTO address (user_id, street_number, street_name, city, state, country, postal_code, designation)
    VALUES (9, '1695', 'Lakeland', 'Albuquerque', 'New Mexico', 'United States', '87105', 'work');
INSERT INTO address (user_id, street_number, street_name, city, state, country, postal_code, designation)
    VALUES (10, '52440', 'Merry', 'Arlington', 'Texas', 'United States', '76011', 'home');

INSERT INTO telephone (user_id, phone_number, designation)
    VALUES (1, '5623560622', 'work');
INSERT INTO telephone (user_id, phone_number, designation)
    VALUES (2, '4473604365', 'home');
INSERT INTO telephone (user_id, phone_number, designation)
    VALUES (3, '3695527831', 'mobile');
INSERT INTO telephone (user_id, phone_number, designation)
    VALUES (4, '4344699876', 'home');
INSERT INTO telephone (user_id, phone_number, designation)
    VALUES (5, '5369351277', 'work');
INSERT INTO telephone (user_id, phone_number, designation)
    VALUES (6, '5087655329', 'mobile');
INSERT INTO telephone (user_id, phone_number, designation)
    VALUES (7, '4374569631', 'work');
INSERT INTO telephone (user_id, phone_number, designation)
    VALUES (8, '2618996475', 'home');
INSERT INTO telephone (user_id, phone_number, designation)
    VALUES (9, '3605600615', 'mobile');
INSERT INTO telephone (user_id, phone_number, designation)
    VALUES (10, '6072920866', 'work');

INSERT INTO payment_method (user_id, method_id, account_number)
    VALUES (1, 1, '34-175-9681');
INSERT INTO payment_method (user_id, method_id, account_number)
    VALUES (2, 1, '22-867-5650');
INSERT INTO payment_method (user_id, method_id, account_number)
    VALUES (3, 1, '22-796-6933');
INSERT INTO payment_method (user_id, method_id, account_number)
    VALUES (4, 1, '38-616-9923');
INSERT INTO payment_method (user_id, method_id, account_number)
    VALUES (5, 1, '57-972-6811');
INSERT INTO payment_method (user_id, method_id, account_number)
    VALUES (6, 1, '21-487-4424');
INSERT INTO payment_method (user_id, method_id, account_number)
    VALUES (7, 1, '26-721-5240');
INSERT INTO payment_method (user_id, method_id, account_number)
    VALUES (8, 1, '16-976-3616');
INSERT INTO payment_method (user_id, method_id, account_number)
    VALUES (9, 1, '50-151-9909');
INSERT INTO payment_method (user_id, method_id, account_number)
    VALUES (10, 1, '55-342-6162');

INSERT INTO bill (bill_id, user_id, bill_amount)
    VALUES (1, 1, 50);
INSERT INTO bill (bill_id, user_id, bill_amount)
    VALUES (2, 2, 100);
INSERT INTO bill (bill_id, user_id, bill_amount)
    VALUES (3, 3, 10);
INSERT INTO bill (bill_id, user_id, bill_amount)
    VALUES (4, 4, 20);
INSERT INTO bill (bill_id, user_id, bill_amount)
    VALUES (5, 5, 100);
INSERT INTO bill (bill_id, user_id, bill_amount)
    VALUES (6, 6, 20);
INSERT INTO bill (bill_id, user_id, bill_amount)
    VALUES (8, 8, 10);
INSERT INTO bill (bill_id, user_id, bill_amount)
    VALUES (9, 9, 50);
INSERT INTO bill (bill_id, user_id, bill_amount)
    VALUES (10, 10, 50);

INSERT INTO payment (payment_id, user_id, bill_id, payment_amount)
    VALUES (1, 4, 4, 20);
INSERT INTO payment (payment_id, user_id, bill_id, payment_amount)
    VALUES (2, 5, 5, 60.8);
INSERT INTO payment (payment_id, user_id, bill_id, payment_amount)
    VALUES (3, 1, 1, 22.08);
INSERT INTO payment (payment_id, user_id, bill_id, payment_amount)
    VALUES (4, 8, 8, 5.41);
INSERT INTO payment (payment_id, user_id, bill_id, payment_amount)
    VALUES (5, 6, 6, 19.91);
INSERT INTO payment (payment_id, user_id, bill_id, payment_amount)
    VALUES (6, 2, 2, 100);
INSERT INTO payment (payment_id, user_id, bill_id, payment_amount)
    VALUES (7, 9, 9, 50);
INSERT INTO payment (payment_id, user_id, bill_id, payment_amount)
    VALUES (8, 10, 10, 49.99);
