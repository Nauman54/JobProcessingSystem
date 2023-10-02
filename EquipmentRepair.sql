create database EquipmentRepair

use EquipmentRepair

--create table Department
--(
--DepartmentID int primary key identity(1,1) not null,
--DepartmentName nvarchar(50)
--)

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

create table Job
(
ID INT IDENTITY(1, 1) NOT NULL,
JobNo NVARCHAR(50) NOT NULL PRIMARY KEY,
AssignedTo int foreign key references Department(DepartmentId),
ItemId int foreign key references Items(ItemId),
DepartmentId int foreign key references Department(DepartmentId),
Nature nvarchar(50),
Fault nvarchar(max),
JobDate datetime,
Remarks nvarchar(max)
)

create table JobIdChanger
(
JobChangerID INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
JobName NVARCHAR(50) NOT NULL UNIQUE,
DepartmentId int foreign key references Department(DepartmentId)
)

create table systemuser
(
userID INT IDENTITY(1, 1) NOT NULL,
userName VARCHAR(50),
[password] VARCHAR(50),
isActive int,
createDate datetime,
DepartmentId int foreign key references Department(DepartmentId)
)


insert into Items(ItemName) values('Computer');
insert into Items(ItemName) values('AC');
insert into Items(ItemName) values('Table');
insert into Items(ItemName) values('Chair');

insert into Department(DeptName) values('Bio-Medical');
insert into Department(DeptName) values('Electrical-Power');

insert into JobIdChanger(JobName,DepartmentId) values('KRLH-AAA-EME-',1);
insert into JobIdChanger(JobName,DepartmentId) values('KHI/EP/HR/',2);

insert into systemuser(userName,[password],isActive,createDate,DepartmentId) values('nauman','ahmed',1,GETDATE(),1);
insert into systemuser(userName,[password],isActive,createDate,DepartmentId) values('admin','admin',1,GETDATE(),2);

select * from JobIdChanger

select * from Job

select * from systemuser

--SELECT COUNT(JobNo)+1 FROM Job WHERE DepartmentId = 1;

--create proc Sp_GetEquipment
--as 
--begin
--select * from Equipment
--end

--create proc Sp_GetDepartment
--as 
--begin
--select * from Department
--end

--CREATE PROCEDURE Sp_SaveJob
--    @AssignedTo INT,
--    @EquipmentID INT,
--    @DepartmentID INT,
--    @Nature NVARCHAR(50),
--    @Fault NVARCHAR(MAX),
--    @Remarks NVARCHAR(MAX)
--AS
--BEGIN
--    INSERT INTO Job (AssignedTo, EquipmentID, DepartmentID, Nature, Fault, JobDate, Remarks)
--    VALUES (@AssignedTo, @EquipmentID, @DepartmentID, @Nature, @Fault, GETDATE(), @Remarks);
--END;

--create view vWGetJob
--as
--select JobNo, depart.DepartmentName as AssignedToDepartment, eqp.EquipmentName, dept.DepartmentName as RequestedDepartment, Nature, Fault, JobDate, Remarks
--from Job as job
--join Department as depart on job.AssignedTo = depart.DepartmentID 
--join Equipment as eqp on job.EquipmentID = eqp.EquipmentID
--join Department as dept on job.DepartmentID = dept.DepartmentID

--create proc Sp_GetJob
--as 
--begin
--select * from vWGetJob
--end
