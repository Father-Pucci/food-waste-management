create  database food_waste_management;

use food_waste_management;

    create table users(

        id int primary key auto_increment Null,

        username varchar(255) not null unique,

        email varchar(255) not null unique,

        password varchar(255) not null,

        role enum('admin', 'manager', 'user') not null,

        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );



create table food_items(
    material_id  int auto_increment PRIMARY KEY,

    waste_type varchar(255) not null,

    source varchar(255) not null,

    quantity int not null

);

create table waste_reports(
    report_id int auto_increment PRIMARY KEY,

    material_id int not null,
    
    reported_by int not null,

    report_date date not null,

    status enum('pending', 'reviewed', 'resolved') default 'pending',   

    FOREIGN KEY (material_id) REFERENCES food_items(material_id),

    FOREIGN KEY (reported_by) REFERENCES users(id)

);

CREATE TABLE IF NOT EXISTS activity_logs (
        user_id INT NULL,  
        email VARCHAR(255),
        action VARCHAR(50) NOT NULL,
        status ENUM('success', 'failed') DEFAULT 'success',
        ip_address VARCHAR(45),
        user_agent VARCHAR(255),
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );


