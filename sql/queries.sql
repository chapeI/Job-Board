-- i ------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------

-- create employer, given name and tier
INSERT INTO employer (employer_name, employer_tier)
    Values (<name>, <tier>);

-----------------------------------------------------------------------------------------------------------------------

-- delete employer, given id
UPDATE users
SET password = password * -1 -- cascades to employer; postings, categories, and applications cannot be resolved
WHERE user_id = <id>;

-----------------------------------------------------------------------------------------------------------------------

-- edit employer, given id, key, and value
UPDATE employer
SET <key> = <value>
WHERE employer_id = <id>;

-----------------------------------------------------------------------------------------------------------------------

-- report employer information, given id
SELECT employer_name, description, email
FROM employer, users
WHERE employer_id = user_id
    AND employer_id = <id>;

--report employer address(es) and phone number(s) (see utilities)

-----------------------------------------------------------------------------------------------------------------------

-- ii -----------------------------------------------------------------------------------------------------------------

-- create category, given category and employer id
INSERT INTO employer_category (employer_id, category)
    VALUES (<id>, <category>);

-----------------------------------------------------------------------------------------------------------------------

-- delete category, given id and category
DELETE FROM employer_category
WHERE employer_id = <id>
    AND category = <category>

-----------------------------------------------------------------------------------------------------------------------

-- edit category, given id and old/new category
UPDATE employer_category
SET category = <new_category>
WHERE employer_id = <id>
    AND category = <old category>;

-----------------------------------------------------------------------------------------------------------------------

-- report category, given id
SELECT category
FROM employer_category
WHERE employer_id = <id>;

-----------------------------------------------------------------------------------------------------------------------

-- iii ----------------------------------------------------------------------------------------------------------------

-- post a new job, given employer id, posting id, title description, and number of openings
INSERT INTO posting (employer_id, posting_id, title, description, number_of_openings)
    VALUES (<employer id>, <posting id>, <title>, <description>, <num openings>);

-----------------------------------------------------------------------------------------------------------------------

-- iv -----------------------------------------------------------------------------------------------------------------

-- provide a job offer given job seeker id, and application id
UPDATE application
SET offer_time = CURRENT_TIMESTAMP
WHERE job_seeker_id = <job seeker id>
    AND application_id = <application id>;

-----------------------------------------------------------------------------------------------------------------------

-- v ------------------------------------------------------------------------------------------------------------------

-- report posting information, given employer id and posting id
SELECT title, description, posting_time
FROM posting
WHERE employer_id = <employer id>
    AND posting_id = <posting id>;

-- report applicant informationm given employer id and posting id
SELECT first_name, last_name, application_time, offer_time, close_time
FROM job_seeker, application, posting
WHERE employer_id = <employer_id>
    AND posting_id = <posting_id>
    AND application.employer_id = posting.employer_id
    AND application.posting_id = posting.posting_id;

------------------------------------------------------------------------------------------------------------------------

-- vi ------------------------------------------------------------------------------------------------------------------

-- report posted jobs, given employer id, origin time, and bound time
SELECT title, description, posting_time, number_of_openings,
    COUNT( SELECT job_seeker_id, application_id
        FROM application) AS number_of_applicants,
    COUNT(SELECT job_seeker_id, application_id
        FROM application
        WHERE application_time IS '1000-01-01 00:00:00' -- sentinel for accepted offer
            AND offer_time IS NOT NULL) AS number_of_accepted_offers
FROM posting, application
WHERE posting.employer_id = <employer id>
    AND application.employer_id = <employer id>
    AND posting.posting_id = application.posting_id
    AND posting_time BETWEEN <origin time> AND <bound time>
GROUP BY title, description, posting_time, number_of_applicants;

-----------------------------------------------------------------------------------------------------------------------

-- vii ----------------------------------------------------------------------------------------------------------------

-- create job-seeker, given first name, last name, and tier
INSERT INTO job_seeker (first_name, last_name, job_seeker_tier)
    VALUES (<fname>, <lname>, <tier>);

-----------------------------------------------------------------------------------------------------------------------

-- delete job-seeker, given id
UPDATE users
SET password = password * -1 -- cascades to job-seeker; applications cannot be resolved
WHERE user_id = <id>

-----------------------------------------------------------------------------------------------------------------------

-- edit job-seeker, given id, key and value
UPDATE job_seeker
SET <key> = <value>
WHERE job_seeker_id = <id>;

-----------------------------------------------------------------------------------------------------------------------

-- report job-seeker information, given id
SELECT first_name, last_name, description, email
FROM job_seeker, users
WHERE job_seeker_id = users_id
    AND job_seeker_id = <id>;

-- report job-seeker address(es) and phone number(s) (see utilities)

-----------------------------------------------------------------------------------------------------------------------

-- viii ---------------------------------------------------------------------------------------------------------------

-- search for jobs assuming input is employer name
SELECT posting_time, close_time, title, description, number_of_openings
FROM posting, employer
WHERE employer_name = <input>
    AND posting.employer_id = employer.employer_id;

-- search for jobs assuming input is employer category
SELECT posting_time, close_time, title, description, number_of_openings
FROM posting, employer_category
WHERE category = <input>
    AND posting.employer_id = employer_category.employer_id;

-- search for jobs assuming input is a substring of posting title or description
SELECT posting_time, close_time, title, description, number_of_openings
FROM posting
WHERE title LIKE '%{input}%' OR description LIKE '%{input}%'
    AND employer_id IN ( -- to prevent the inclusion of postings from deleted employers
        SELECT employer_id
        FROM employer);

-- add record to search table, given id and input
INSERT INTO search (user_id, input)
    VALUES (<id>, <input>);

-- add previous search results (denoted here A, B, C) to posting-search table, given search id
INSERT INTO posting_search (employer_id, posting_id, search_id)
    SELECT employer_id, posting_id, <search_id>
    FROM <A> UNION <B> UNION <C>;

-----------------------------------------------------------------------------------------------------------------------

-- ix -----------------------------------------------------------------------------------------------------------------

-- apply for a job, given job-seeker id, application id, employer id, and posting id
INSERT INTO application (job_seeker_id, application_id, employer_id, posting_id)
    VALUES (<job-seeker id>, <application id>, <employer id>, <posting id>);

-----------------------------------------------------------------------------------------------------------------------

-- x ------------------------------------------------------------------------------------------------------------------

-- assuming offer time is non-null on given application

-- accept a job offer, given job-seeker id and application id
UPDATE application
SET application_time = '1000-01-01 00:00:00' -- 'When can you start?' 'YESTERDAY!'
WHERE job_seeker_id = <job-seeker id>
    AND application_id = <application id>;

-- reject a job offer, given job-seeker if and application id
UPDATE application
SET application_time = '9999-12-31 23:59:59' -- 'When can you start?' 'When hell freezes over.'
WHERE job_seeker_id = <job-seeker id>
    AND application_id = <application id>;

-----------------------------------------------------------------------------------------------------------------------

-- xi -----------------------------------------------------------------------------------------------------------------

-- assuming offer time is null on given application

-- withdraw application, given job-seeker id and application id
UPDATE application
SET application_time = NULL
WHERE job_seeker_id = <job-seeker id>
    AND application_id = <application id>;

-----------------------------------------------------------------------------------------------------------------------

-- xii ----------------------------------------------------------------------------------------------------------------

-- obliterate nullable job-seeker information, given job-seeker id
UPDATE job_seeker
SET description = NULL
WHERE job_seeker_id = <job-seeker id>;

-- delete job-seeker address(es), given job-seeker id
DELETE FROM address
WHERE user_id = <job-seeker id>;

-- delete job-seeker phone number(s) given job-seeker id
DELETE FROM telephone
WHERE user_id = <job-seeker id>;

-----------------------------------------------------------------------------------------------------------------------

-- xiii

-- report of applications, given job-seeker id, origin time, and bound time
SELECT title, description, application_time, offer_time, close_time
FROM posting, application
WHERE job_seeker_id = <job-seeker id>
    AND posting.employer_id = application.employer_id
    AND posting.posting_id = posting.posting_id
    AND application_time BETWEEN <origin time> AND <bound time>;

-----------------------------------------------------------------------------------------------------------------------

-- xiv & xv -----------------------------------------------------------------------------------------------------------

-- add a payment method, given user id, method id
INSERT INTO payment_method (user_id, method_id)
    VALUES (<id>, <method id>);

-- if automatic payments are selected
UPDATE payment_method
SET is_automatic = TRUE
WHERE user_id = <id>
    AND method_id = <method id>;

-----------------------------------------------------------------------------------------------------------------------

-- delete a payment method, given user id and method id
DELETE FROM payment_method
WHERE user_id = <id>
    AND method_id = <method id>;

-----------------------------------------------------------------------------------------------------------------------

-- edit payment method account information, given user id, method id, and new account number
UPDATE payment_method
SET account_number = <new account>
WHERE user_id = <id>
    AND method_id = <method id>;

-- edit payment method is-automatic, given user id, method id, and new value
UPDATE payment_method
SET is_automatic = <new value>
WHERE user_id = <id>
    AND method_id = <method id>;

-----------------------------------------------------------------------------------------------------------------------

-- xvi ----------------------------------------------------------------------------------------------------------------

-- make a manual payment, given user id, method id, and amount
INSERT INTO payment (user_id, method_id, payment_amount)
    VALUES (<id>, <method id>, <amount>);

-- if balance for user id is > -1
UPDATE users
SET frozen_time = NULL
WHERE user_id = <id>;

-----------------------------------------------------------------------------------------------------------------------

-- xvii ---------------------------------------------------------------------------------------------------------------

-- report employer administrative information
SELECT employer_name, email, frozen_time AS status, balance
FROM employer, users, balance
WHERE employer_id = users.user_id
    AND users.user_id = balance.user_id;

-- report employer categories
SELECT *
FROM employer_category;

-- report job-seeker administrative information
SELECT first_name, last_name, email, frozen_time AS status, 
FROM job_seeker, users, balance
WHERE job_seeker_id = users.user_id
    AND users.user_id = balance.user_id;

-----------------------------------------------------------------------------------------------------------------------

-- xviii --------------------------------------------------------------------------------------------------------------

-- report employers with negative balances
SELECT employer_name, email, balance, frozen_time
FROM employer, users, balance
WHERE balance < 0
    AND employer_id = users.user_id
    AND users.user_id = balance.user_id;

-- report employees with negative balances
SELECT first_name, last_name, email, balance, frozen_time
FROM job_seeker, users, balance
WHERE balance < 0
    AND job_seeker_id = users.user_id
    AND users.user_id = balance.user_id;

-----------------------------------------------------------------------------------------------------------------------

-- utilities ----------------------------------------------------------------------------------------------------------

-- report address(es), given id
SELECT street_number, street_name, city, state, country, postal_code, designation
FROM address
WHERE user_id = <id>;

-- report phone number(s), given id
SELECT phone_number, designation
FROM phone
WHERE user_id = <id>;

-- virtual balances table
CREATE VIEW user_balance
    SELECT payment.user_id, SUM(payment_amount) - SUM(bill_amount) AS balance
    FROM payment, bill
    WHERE payment.user_id = bill.user_id;
