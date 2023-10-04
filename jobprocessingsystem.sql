create database jobprocessingsystem

create database HMIS

use HMIS

create table Department
(
DepartmentId int primary key identity(1,1) not null,
DeptName nvarchar(1000)
)

create table Items
(
ItemId int primary key identity(1,1) not null,
ItemName nvarchar(1000)
)

insert into Items(ItemName) values('Computer');
insert into Items(ItemName) values('AC');
insert into Items(ItemName) values('Table');
insert into Items(ItemName) values('Chair');

insert into Department(DeptName) values('Bio-Medical');
insert into Department(DeptName) values('Electrical-Power');


use jobprocessingsystem

CREATE TABLE Job
(
ID INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
JobNo NVARCHAR(50) NOT NULL,
AssignedTo INT,
ItemId INT,
DepartmentId INT,
Nature NVARCHAR(50),
Fault NVARCHAR(MAX),
JobDate DATETIME,
Remarks NVARCHAR(MAX)
)

create table JobIdChanger
(
JobChangerID INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
JobName NVARCHAR(50) NOT NULL UNIQUE,
DepartmentId INT
)

create table systemuser
(
userID INT IDENTITY(1, 1) NOT NULL,
userName VARCHAR(50),
[password] VARCHAR(50),
isActive INT,
createDate DATETIME,
DepartmentId INT
)

insert into JobIdChanger(JobName,DepartmentId) values('KRLH-AAA-EME-',1);
insert into JobIdChanger(JobName,DepartmentId) values('KHI/EP/HR/',2);

insert into systemuser(userName,[password],isActive,createDate,DepartmentId) values('nauman','ahmed',1,GETDATE(),1);
insert into systemuser(userName,[password],isActive,createDate,DepartmentId) values('admin','admin',1,GETDATE(),2);

select * from JobIdChanger

select * from Job

select * from systemuser
