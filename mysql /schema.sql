CREATE DATABASE Rreal_estate_rental;
USE Rreal_estate_rental;
CREATE TABLE user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    role ENUM('owner','tenant') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
create table  user_email (
    email_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    email VARCHAR(100) UNIQUE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(user_id)
        ON DELETE CASCADE
);
create table  user_phone (
    phone_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    phone VARCHAR(20) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(user_id)
        ON DELETE CASCADE
);
CREATE TABLE location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    city VARCHAR(50) NOT NULL,
    subcity VARCHAR(50) NOT NULL
);
create table  property (
    property_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    location_id INT,
    title VARCHAR(100),
    description TEXT,
    property_type VARCHAR(50),
    price DECIMAL(10,2),
    bedrooms INT,
    area_size DECIMAL(10,2),
    status ENUM('available','rented','not available') DEFAULT 'available',

    FOREIGN KEY (user_id) REFERENCES user(user_id)
        ON DELETE CASCADE,

    FOREIGN KEY (location_id) REFERENCES location(location_id)
        ON DELETE CASCADE
);
create table  property_photo (
    photo_id INT AUTO_INCREMENT PRIMARY KEY,
    property_id INT,
    photo_url VARCHAR(255),

    FOREIGN KEY (property_id) REFERENCES property(property_id)
        ON DELETE CASCADE
);

