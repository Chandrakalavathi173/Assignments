-- EXERCISE - 1

1.
create database online_consultation_therapy;

create table doctor (
Did int primary key not null,
Dname varchar(20) not null,
specialization varchar(20) not null);

select * from doctor;

insert into doctor values
(10001,"Harshitha","Neurologist"),
(10002,"Hanisha","Pathologist"),
(10003,"Pranitha","Immunologist"),
(10004,"Teena","Cardiologist"),
(10005,"Srihitha","Neurologist"),
(10006,"Manjunath","Nutritionist"),
(10007,"Parthu","Dermatologist"),
(10008,"Lokesh","Pediatrisian"),
(10009,"Ritesh","Neurologist"),
(10010,"Pramod","Hematologist");


2.
create table appointments(
Pid int primary key not null,
Patient_name varchar(20) not null,
Doctor_name varchar(20) not null,
_Date date not null); 

select * from appointments;

insert into appointments values
(1,"Priyanka","Teena","2023-05-12"),
(2,"Veena","Hanisha","2023-05-15"),
(3,"manjula","Srihitha","2023-05-13"),
(4,"Gowthami","Teena","2023-06-01"),
(5,"Vasantha","Pranitha","2023-06-02"),
(6,"Pallavi","Lokesh","2023-05-22");


3.
create table patient (
Pid int primary key not null,
patient_name varchar(20) not null,
Reason varchar(20) not null,
_date date not null);

insert into patient values
(1,"Priyanka","Fever","2023-05-12"),
(2,"Veena","Personal issues","2023-05-15"),
(3,"manjula","Frequent Illness","2023-05-13"),
(4,"Gowthami","Allergic issues","2023-06-01"),
(5,"Vasantha","Leg fracture","2023-06-02"),
(6,"Pallavi","Skin issues","2023-05-22");

select * from patient;


4.
create table reviews(
pid int primary key not null,
patient_name varchar(20) not null,
feedback varchar(20) );

alter table reviews modify column feedback varchar(100);

insert into reviews values
(1,"Priyanka","Good staff and healthy environment"),
(2,"Veena","Clean and hygienic environment and the doctor was friendly");

insert into reviews (pid,patient_name) values 
(3,"Manjula"),
(4,"Gowthami"),
(5,"Vasantha"),
(6,"Pallavi");

select * from reviews;



-- EXERCISE - 2

create database company;

create table contact(
Id int primary key not null,
Email varchar(30) not null,
fname varchar(40) not null,
Iname varchar(50) not null,
company varchar(10) not null,
Active_flag int not null,
opt_out int not null);

insert into contact values 
(123,"a@a.com","Kian","Seth","ABC",1,1),
(133,"b@a.com","Neha","Seth","ABC",1,0),
(234,"c@c.com","Puru","Malik","CDF",0,0),
(342,"d@d.com","Sid","Maan","TEG",1,0);

select * from contact;

1.
select * from contact where Active_flag=1;

2.
update contact set Active_flag=0 where opt_out=1;
select * from contact;

3.
delete from contact where company="ABC";
select * from contact;

4.
alter table contact modify Iname varchar(20);
insert into contact (Id,fname,Email,company,Active_flag,opt_out) values(658,"mili","mili@gmail.com","DGH",1,1);
select * from contact;

5.
select distinct(company) as company from contact;

6.
update contact set fname="niti" where fname="mili";
select * from contact;



-- EXERCISE - 3

create table customer(
customer_id int primary key not null,
cust_name varchar(30) not null,
city varchar(30) not null,
grade int,
salesman_id int);

insert into customer values
(3002,"Nick Rimando","New York",100,5001),
(3007,"Brad Davis","New York",200,5001),
(3005,"Graham Zusi","California",200,5002),
(3008,"Julian Green","London",300,5002),
(3004,"Fabian Johnson","Paris",300,5006),
(3009,"Geoff Cameron","Berlin",100,5003),
(3003,"Jozy Altidor","Moscow",200,5007);

insert into customer (customer_id,cust_name,city,salesman_id) values(3001,"Brad Guzan","London",5005);

select * from customer;

create table salesman (
salesman_id int not null,
name varchar(30),
city varchar(20),
commission float);

insert into salesman values
(5001,"James Hoog","New York",0.15),
(5002,"Nail Knite","Paris",0.13),
(5005,"Pit Alex","London",0.11),
(5006,"Mc Lyon","Paris",0.14),
(5007,"Paul Adam","Rome",0.13),
(5003,"Lauson Hen","San Jose",0.12);

select * from salesman;

select customer.cust_name,customer.city,customer.grade,customer.salesman_id,salesman.city as salesman_city from customer inner join salesman on customer.salesman_id=salesman.salesman_id where grade<100 order by customer_id;