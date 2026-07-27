create database hotel_reservation;
use hotel_reservation;

-- customer table
create table customer (
    customer_id int primary key,
    customer_name varchar(100),
    gender varchar(10),
    phone varchar(15),
    city varchar(50)
);

-- room table
create table room (
    room_id int primary key,
    room_type varchar(30),
    price_per_day decimal(10,2),
    availability varchar(10)
);

-- booking table with foreign keys
create table booking (
    booking_id int primary key,
    customer_id int,
    room_id int,
    check_in date,
    check_out date,
    total_days int,
constraint fk_customer
foreign key (customer_id)
references customer(customer_id),
constraint fk_room
foreign key (room_id)
references room(room_id)
);

-- payment table with foreign key
create table payment (
    payment_id int primary key,
    booking_id int,
    amount decimal(10,2),
    payment_mode varchar(20),
    payment_status varchar(20),

    constraint fk_booking
    foreign key (booking_id)
    references booking(booking_id)
);

-- staff table
create table staff (
    staff_id int primary key,
    staff_name varchar(50),
    department varchar(30),
    salary decimal(10,2)
);

-- insert customer data
insert into customer values
(1, 'rahul', 'male', '9876543210', 'surat'),
(2, 'priya', 'female', '9876501234', 'mumbai'),
(3, 'amit', 'male', '9876512345', 'delhi'),
(4, 'neha', 'female', '9988776655', 'ahmedabad'),
(5, 'karan', 'male', '9090909090', 'pune'),
(6, 'riya', 'female', '8080808080', 'jaipur'),
(7, 'vijay', 'male', '7070707070', 'rajkot'),
(8, 'pooja', 'female', '6060606060', 'baroda');

-- insert room data
insert into room values
(101, 'single', 1500.00, 'yes'),
(102, 'double', 2500.00, 'yes'),
(103, 'suite', 5000.00, 'no'),
(104, 'single', 1800.00, 'yes'),
(105, 'double', 2700.00, 'no'),
(106, 'suite', 6000.00, 'yes');

-- insert booking data
insert into booking values
(1001, 1, 101, '2026-05-01', '2026-05-03', 2),
(1002, 2, 102, '2026-05-05', '2026-05-08', 3),
(1003, 3, 103, '2026-05-10', '2026-05-12', 2),
(1004, 4, 104, '2026-05-15', '2026-05-18', 3),
(1005, 5, 105, '2026-05-20', '2026-05-23', 3),
(1006, 6, 106, '2026-05-25', '2026-05-27', 2);

-- insert payment data
insert into payment values
(201, 1001, 3000.00, 'cash', 'paid'),
(202, 1002, 7500.00, 'upi', 'paid'),
(203, 1003, 10000.00, 'card', 'pending'),
(204, 1004, 5400.00, 'cash', 'paid'),
(205, 1005, 8100.00, 'upi', 'pending'),
(206, 1006, 12000.00, 'card', 'paid');

-- insert staff data
insert into staff values
(1, 'mahesh', 'manager', 50000),
(2, 'sneha', 'reception', 25000),
(3, 'rakesh', 'cleaning', 18000),
(4, 'anita', 'security', 22000),
(5, 'vishal', 'maintenance', 30000);

-- display all tables
select * from customer;
select * from room;
select * from booking;
select * from payment;
select * from staff;

-- available rooms
select * from room
where availability = 'yes';

-- total paid payment
select sum(amount) as total_payment
from payment
where payment_status = 'paid';

-- total rooms
select count(*) as total_rooms
from room;

-- customers from surat
select * from customer
where city = 'surat';