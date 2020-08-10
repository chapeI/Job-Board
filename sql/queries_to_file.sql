SELECT *
FROM users;

SELECT *
FROM employer;

INSERT INTO users (email, password)
    VALUES ('not.evil@gmail.com', 'SoNotEvil93');

-- user_id = 11
INSERT INTO employer (employer_id, employer_name, employer_tier)
    VALUES (11, 'Google', 1);

SELECT *
FROM users;

SELECT *
FROM employer;

UPDATE users
SET user_id = user_id * -1
WHERE user_id = 1;

UPDATE employer
SET description = 'A very not evil compnay.'
WHERE employer_id = 11;

SELECT *
FROM users;

SELECT *
FROM employer;

SELECT *
FROM address;

SELECT *
FROM telephone;

INSERT INTO address (user_id, street_number, street_name, city, state, country, designation)
    VALUES (11, 5555, 'Paved with Good Intentions Rd.', 'Silicon Valley', 'CA', 'United States', 'not evil lair');

INSERT INTO telephone (user_id, phone_number, designation)
    VALUES (11, '1-800-NOT-EVIL', 'not evil lair');

SELECT *
FROM address;

SELECT *
FROM telephone;

SELECT *
FROM employer_category;

INSERT INTO employer_category (employer_id, category)
    VALUES (11, 'Evil Deeds');

INSERT INTO employer_category (employer_id, category)
    VALUES (11, 'Benevolant World Domination');

SELECT *
FROM employer_category;

DELETE FROM employer_category
WHERE employer_id = 11
    AND category = 'Evil Deeds';

SELECT *
FROM employer_category;

UPDATE employer_category
SET category = 'Making the World a Safer Search'
WHERE employer_id = 11
    AND category = 'Benevolant World Domination';

SELECT *
FROM employer_category;

SELECT *
FROM posting;

INSERT INTO posting (employer_id, posting_id, title, description, number_of_openings)
    VALUES (11, 1, 'Not an Evil Position', 'Seriously guys, we are not evil.', 1001);

SELECT *
FROM posting;

INSERT INTO application (job_seeker_id, application_id, employer_id, posting_id)
    VALUES (6, 2, 11, 1);

SELECT *
FROM application;

UPDATE application
SET offer_time = CURRENT_TIMESTAMP
WHERE job_seeker_id = 6
    AND application_id = 2;

SELECT *
FROM application;

SELECT title, description, posting_time
FROM posting
WHERE employer_id = 11
    AND posting_id = 1;

SELECT first_name, last_name, application_time, offer_time, close_time
FROM job_seeker, application, posting
WHERE posting.employer_id = 11
    AND posting.posting_id = 1
    AND job_seeker.job_seeker_id = application.job_seeker_id
    AND application.employer_id = posting.employer_id
    AND application.posting_id = posting.posting_id;

SELECT title, description, posting_time, number_of_openings, number_of_applicants, number_of_accepted_offers
FROM posting, application,
    (SELECT COUNT(job_seeker_id) AS number_of_applicants
        FROM (SELECT job_seeker_id, application_id
            FROM application
            WHERE application.employer_id = 11) AS a) AS b,
    (SELECT COUNT(job_seeker_id) AS number_of_accepted_offers
        FROM (SELECT job_seeker_id, application_id
            FROM application
            WHERE application_time = '1000-01-01 00:00:00') AS c) AS d
WHERE posting.employer_id = 11
    AND application.employer_id = 11
    AND posting.posting_id = application.posting_id
    AND posting_time BETWEEN '1000-01-01 00:00:00' AND '9999-12-31 23:59:59';

SELECT *
FROM users;

SELECT *
FROM job_seeker;

INSERT INTO users (email, password)
    VALUES ('jbunter@hotmail.com', 'WeakPassword');

-- user_id = 12
INSERT INTO job_seeker (job_seeker_id, first_name, last_name, job_seeker_tier)
    VALUES (12, 'Joe', 'Bunter', 2);

SELECT *
FROM users;

SELECT *
FROM job_seeker;

UPDATE users
SET user_id = user_id * -1
WHERE user_id = 7;

SELECT *
FROM users;

UPDATE job_seeker
SET description = 'Goon for hire: seeking a non-evil entity to do bidding for.'
WHERE job_seeker_id = 12;

SELECT *
FROM job_seeker;

INSERT INTO address (user_id, street_number, street_name, city, state, country, designation)
    VALUES (12, 42, 'Evergreen Terrace', 'Springfield', 'Unknown', 'United States...probably', 'home');

INSERT INTO telephone (user_id, phone_number, designation)
    VALUES (12, '555-555-5555', 'home');

SELECT first_name, last_name, description, email
FROM job_seeker JOIN users on job_seeker_id = user_id
WHERE job_seeker_id = 12;

SELECT street_number, street_name, city, state, country, designation
FROM address
WHERE user_id = 12;

SELECT phone_number, designation
FROM telephone
WHERE user_id = 12;

SELECT *
FROM search;

SELECT *
FROM posting_search;

INSERT INTO posting (employer_id, posting_id, title, description, number_of_openings)
    VALUES (11, 2, 'Hired Goon', 'Brutish thug needed for low-level enforcing and general executing of totally not evil plans.', 1);

SELECT posting_time, close_time, title, posting.description, number_of_openings
FROM posting, employer
WHERE employer_name LIKE '%evil%'
    AND posting.employer_id = employer.employer_id
    AND posting.employer_id > 0;

SELECT posting_time, close_time, title, description, number_of_openings
FROM posting, employer_category
WHERE category LIKE '%evil%'
    AND posting.employer_id = employer_category.employer_id
    AND posting.employer_id > 0;

SELECT posting_time, close_time, title, description, number_of_openings
FROM posting
WHERE title LIKE '%evil%' OR description LIKE '%evil%'
    AND employer_id > 0;

INSERT INTO search (user_id, input)
    VALUES (12, 'evil');

INSERT INTO posting_search (employer_id, posting_id, search_id)
    SELECT employer_id, posting_id, 1
        FROM (SELECT posting.employer_id, posting_id
            FROM posting, employer
            WHERE employer_name LIKE '%evil%'
                AND posting.employer_id = employer.employer_id
                AND posting.employer_id > 0) AS a;

INSERT INTO posting_search (employer_id, posting_id, search_id)
    SELECT employer_id, posting_id, 1
        FROM (SELECT posting.employer_id, posting_id
            FROM posting, employer_category
            WHERE category LIKE '%evil%'
                AND posting.employer_id = employer_category.employer_id
                AND posting.employer_id > 0) AS a;

INSERT INTO posting_search (employer_id, posting_id, search_id)
    SELECT employer_id, posting_id, 1
        FROM (SELECT posting.employer_id, posting_id
            FROM posting
            WHERE title LIKE '%evil%' OR description LIKE '%evil%'
                AND employer_id > 0) AS a;

SELECT *
FROM search;

SELECT *
FROM posting_search;

SELECT *
FROM application;

INSERT INTO application (job_seeker_id, application_id, employer_id, posting_id)
    VALUES (12, 1, 11, 2);

SELECT *
FROM application;

UPDATE application
SET offer_time = CURRENT_TIMESTAMP
WHERE job_seeker_id = 12
    AND application_id = 1;

SELECT *
FROM application;

UPDATE application
SET application_time = '1000-01-01 00:00:00'
WHERE job_seeker_id = 12
    AND application_id = 1;

UPDATE application
SET application_time = '9999-12-31 23:59:59'
WHERE job_seeker_id = 6
    AND application_id = 2;

UPDATE application
SET application_time = NULL
WHERE job_seeker_id = 6
    AND application_id = 1;

SELECT *
FROM application;

SELECT *
FROM job_seeker;

SELECT *
FROM address;

SELECT *
FROM telephone;

UPDATE job_seeker
SET description = NULL
WHERE job_seeker_id = -7;

DELETE FROM address
WHERE user_id = -7;

DELETE FROM telephone
WHERE user_id = -7;

SELECT *
FROM job_seeker;

SELECT *
FROM address;

SELECT *
FROM telephone;

UPDATE posting
SET close_time = CURRENT_TIMESTAMP
WHERE employer_id = 11
    AND posting_id = 2;

SELECT title, description, application_time, offer_time, close_time
FROM posting, application
WHERE job_seeker_id = 12
    AND posting.employer_id = application.employer_id
    AND posting.posting_id = application.posting_id
    AND application_time BETWEEN '1000-01-01 00:00:00' AND '9999-12-31 23:59:59';

SELECT *
FROM payment_method;

INSERT INTO payment_method (user_id, method_id, account_number)
    VALUES (11, 1, 'stash-of-krugerrands');

UPDATE payment_method
SET is_automatic = TRUE
where user_id = 11
    AND method_id = 1;

SELECT *
FROM payment_method;

DELETE FROM payment_method
WHERE user_id = -1
    AND method_id = 1;

SELECT *
FROM payment_method;

UPDATE payment_method
SET account_number = 'super-secret-swiss-bank-account', is_automatic = FALSE
WHERE user_id = 11
    AND method_id = 1;

SELECT *
FROM payment_method;

INSERT INTO bill (user_id, bill_amount)
    VALUES (11, 100);

SELECT *
FROM payment;

INSERT INTO payment (user_id, method_id, payment_amount)
    VALUES (11, 1, 99);

UPDATE users
SET frozen_time = CURRENT_TIMESTAMP
WHERE user_id = 11;

SELECT *
FROM payment;

SELECT employer_name, email, frozen_time AS status, balance
FROM employer, users, user_balance
WHERE employer_id = users.user_id
    AND users.user_id = user_balance.user_id;

SELECT *
FROM employer_category;

SELECT first_name, last_name, email, frozen_time AS status, balance
FROM job_seeker, users, user_balance
WHERE job_seeker_id = users.user_id
    AND users.user_id = user_balance.user_id;

SELECT employer_name, email, balance, frozen_time
FROM employer, users, user_balance
WHERE balance < 0
    AND employer_id = users.user_id
    AND users.user_id = user_balance.user_id;

SELECT first_name, last_name, email, balance, frozen_time
FROM job_seeker, users, user_balance
WHERE balance < 0
    AND job_seeker_id = users.user_id
    AND users.user_id = user_balance.user_id;
