DROP TABLE IF EXISTS
    application_search,
    posting_search,
    job_seeker_search,
    employer_search,
    search,
    application,
    posting,
    job_seeker,
    employer_category,
    employer,
    payment,
    bill,
    payment_method,
    telephone,
    address,
    users,
    admin;

CREATE TABLE admin (
    admin_id BIGINT AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (admin_id)
);

CREATE TABLE users (
    user_id BIGINT AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    frozen_time DATETIME DEFAULT NULL,
    PRIMARY KEY (user_id)
);

CREATE TABLE address (
    user_id BIGINT,
    street_number INT,
    street_name VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    country VARCHAR(255),
    designation VARCHAR(255),
    PRIMARY KEY (user_id, street_number, street_name, city, state, country),
    FOREIGN KEY (user_id)
        REFERENCES users (user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE telephone (
    user_id BIGINT,
    phone_number VARCHAR(255),
    designation VARCHAR(255),
    PRIMARY KEY (user_id, phone_number),
    FOREIGN KEY (user_id)
        REFERENCES users (user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE payment_method (
    user_id BIGINT,
    method_id BIGINT,
    account_number VARCHAR(255) NOT NULL,
    is_automatic BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (user_id, method_id),
    FOREIGN KEY (user_id)
        REFERENCES users (user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE bill (
    bill_id BIGINT AUTO_INCREMENT,
    user_id BIGINT,
    bill_amount DECIMAL(5, 2) NOT NULL,
    bill_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (bill_id),
    FOREIGN KEY (user_id)
        REFERENCES users (user_id)
        ON UPDATE CASCADE
);

CREATE TABLE payment (
    payment_id BIGINT AUTO_INCREMENT,
    user_id BIGINT,
    method_id BIGINT,
    payment_amount DECIMAL(5, 2) NOT NULL,
    payment_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (payment_id),
    FOREIGN KEY (user_id, method_id)
        REFERENCES payment_method (user_id, method_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE employer (
    employer_id BIGINT,
    employer_name VARCHAR(255) NOT NULL,
    description VARCHAR(2047),
    employer_tier INT NOT NULL CHECK (employer_tier > -1 AND employer_tier < 2),
    PRIMARY KEY (employer_id),
    FOREIGN KEY (employer_id)
        REFERENCES users (user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE employer_category (
    employer_id BIGINT,
    category VARCHAR(255),
    PRIMARY KEY (employer_id, category),
    FOREIGN KEY (employer_ID)
        REFERENCES employer (employer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE job_seeker (
    job_seeker_id BIGINT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    description VARCHAR(2047),
    job_seeker_tier INT NOT NULL CHECK (job_seeker_tier > -1 AND job_seeker_tier < 3),
    PRIMARY KEY (job_seeker_id),
    FOREIGN KEY (job_seeker_id)
        REFERENCES users (user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE posting (
    employer_id BIGINT,
    posting_id BIGINT,
    posting_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    close_time DATETIME DEFAULT NULL,
    title VARCHAR(255) NOT NULL,
    description VARCHAR(2047) NOT NULL,
    number_of_openings INT,
    PRIMARY KEY (employer_id, posting_id),
    FOREIGN KEY (employer_id)
        REFERENCES employer (employer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE application (
    job_seeker_id BIGINT,
    application_id BIGINT,
    employer_id BIGINT,
    posting_id BIGINT,
    application_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    offer_time DATETIME DEFAULT NULL,
    PRIMARY KEY (job_seeker_id, application_id),
    FOREIGN KEY (job_seeker_id)
        REFERENCES job_seeker (job_seeker_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (employer_id, posting_id)
        REFERENCES posting (employer_id, posting_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE search (
    search_id BIGINT AUTO_INCREMENT,
    user_id BIGINT,
    input VARCHAR(255) NOT NULL,
    search_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (search_id),
    FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE employer_search (
    employer_id BIGINT,
    search_id BIGINT,
    PRIMARY KEY (employer_id, search_id),
    FOREIGN KEY (employer_id)
        REFERENCES employer (employer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (search_id)
        REFERENCES search (search_id)
);

CREATE TABLE job_seeker_search (
    job_seeker_id BIGINT,
    search_id BIGINT,
    PRIMARY KEY (job_seeker_id, search_id),
    FOREIGN KEY (job_seeker_id)
        REFERENCES job_seeker (job_seeker_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (search_id)
        REFERENCES search (search_id)
);

CREATE TABLE posting_search (
    employer_id BIGINT,
    posting_id BIGINT,
    search_id BIGINT,
    PRIMARY KEY (employer_id, posting_id, search_id),
    FOREIGN KEY (employer_id, posting_id)
        REFERENCES posting (employer_id, posting_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (search_id)
        REFERENCES search (search_id)
);

CREATE TABLE application_search (
    job_seeker_id BIGINT,
    application_id BIGINT,
    search_id BIGINT,
    PRIMARY KEY (job_seeker_id, application_id, search_id),
    FOREIGN KEY (job_seeker_id, application_id)
        REFERENCES application (job_seeker_id, application_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (search_id)
        REFERENCES search (search_id)
);
