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
    VALUES (1, 'lego@blocks.com', 'xpnTTJ8'),
        (2, 'eng@gmail.com', 'snzG67SUR'),
        (3, 'cu@concordia.ca', 'HEvXuBuQl3Z'),
        (4, 'babyblue@gmail.com', 'VYzYI8jyC'),
        (5, 'mpitt@yahoo.com', '7J0upL'),
        (6, 'jc@gmail.com', 'vIZzqNaWyW'),
        (7, 'jc@zdnet.com', 'iYhnr62Fn'),
        (8, 'jc@google.cn', 'a6tZQabIL'),
        (9, 'pinkmanabq@gmail.com', 'DDuqpotcX'),
        (10, 'eb@hotmail.com.com', 'nmsgpuUo43b');

INSERT INTO address (user_id, street_number, street_name, city, state, country, designation) 
    VALUES (1, '27527', 'Shoshone', 'Atlanta', 'Georgia', 'United States', 'work'),
        (2, '0', 'Waxwing', 'Rockford', 'Illinois', 'United States', 'home'),
        (3, '7838', 'Evergreen', 'Phoenix', 'Arizona', 'United States', 'home'),
        (4, '9', 'Killdeer', 'Ladysmith', 'British Columbia', 'Canada', 'home'),
        (5, '88', 'Towne', 'Seattle', 'Washington', 'United States', 'work'),
        (6, '79108', 'Vermont', 'Barrie', 'Ontario', 'Canada', 'home'),
        (7, '966', 'Steensland', 'Saint-Sauveur', 'Québec', 'Canada', NULL),
        (8, '01754', 'Hanson', 'Marystown', 'Newfoundland and Labrador', 'Canada', NULL),
        (9, '1695', 'Lakeland', 'Albuquerque', 'New Mexico', 'United States', 'work'),
        (10, '52440', 'Merry', 'Arlington', 'Texas', 'United States', 'home');

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

INSERT INTO payment (payment_id, user_id, method_id, payment_amount)
    VALUES (1, 4, 1, 20),
        (2, 5, 1, 60.8),
        (3, 1, 1, 22.08),
        (4, 8, 1, 5.41),
        (5, 6, 1, 19.91),
        (6, 2, 1, 100),
        (7, 9, 1, 50),
        (8, 10, 1, 49.99);

        
INSERT INTO employer (employer_id, employer_name, description, employer_tier)
	VALUES (1, 'Lego', 'Construction', '0'),
        (2, 'Eng Inc.', 'Industrial Engineering', 1),
        (3, 'Concordia University', 'Place of higher learning', 1),
        (4, 'WW Ltd', 'Not meth cooks', '0'),
        (5, 'Mr. Pitt', 'In need of an exhausted receptionist', '0');

INSERT INTO employer_category (employer_id, category)
    VALUES (1, 'Toys'),
        (2, 'Engineering') ,
        (3, 'Scholastic Pursuits') ,
        (4, 'Fat Stacks') ,
        (5, 'Unbearably Obtuse'); 
   
INSERT INTO job_seeker (job_seeker_id, first_name, last_name, description, job_seeker_tier)
	VALUES (6, 'Jake', 'Chris', 'Construction enthusiast', 0),
        (7, 'Jax', 'Christian', 'Industrial engineer', 0),
        (8, 'Jay', 'Cris', 'Physics teacher', 1),
        (9, 'Jesse', 'Pinkman', 'Lab assistant', 1),
        (10, 'Elaine', 'Benes', 'Fun at parties', 2);
  
INSERT INTO posting(employer_id, posting_id, title, description, number_of_openings)
	VALUES (1, 1, 'Construction Worker', 'Try not to lose any pieces.', 3),
        (3, 2, 'Physcis teacher', 'Teach physics, develop Grand Unified Theory', 1),
        (5, 3, 'Receptionist', 'Taking appointments, answering calls', 2);
    
    
INSERT INTO application(job_seeker_id, application_id, employer_id, posting_id)
	 VALUES (6, 1, 1, 1),
         (8, 1, 3, 2),
         (10, 1, 5, 3);
