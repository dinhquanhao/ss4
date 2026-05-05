-- ONLINE LEARNING SYSTEM

create database online_learning;
use online_learning;

create table student (
    student_id varchar(10) primary key,
    full_name varchar(100) not null,
    birth_date date,
    email varchar(100) unique
);

create table instructor (
    instructor_id varchar(10) primary key,
    full_name varchar(100) not null,
    email varchar(100)
);

create table course (
    course_id varchar(10) primary key,
    course_name varchar(100) not null,
    description varchar(255),
    total_sessions int,
    instructor_id varchar(10),
    foreign key (instructor_id) references instructor(instructor_id)
);

create table enrollment (
    student_id varchar(10),
    course_id varchar(10),
    enroll_date date,
    primary key (student_id, course_id),
    foreign key (student_id) references student(student_id),
    foreign key (course_id) references course(course_id)
);

create table result (
    student_id varchar(10),
    course_id varchar(10),
    midterm_score decimal(4,2) check (midterm_score between 0 and 10),
    final_score decimal(4,2) check (final_score between 0 and 10),
    primary key (student_id, course_id),
    foreign key (student_id, course_id) references enrollment(student_id, course_id)
);

-- INSERT DATA
insert into student values
('S01','Nguyen Van A','2003-01-01','a@gmail.com'),
('S02','Tran Thi B','2003-02-02','b@gmail.com'),
('S03','Le Van C','2003-03-03','c@gmail.com'),
('S04','Pham Thi D','2003-04-04','d@gmail.com'),
('S05','Hoang Van E','2003-05-05','e@gmail.com');

insert into instructor values
('T01','GV1','gv1@gmail.com'),
('T02','GV2','gv2@gmail.com'),
('T03','GV3','gv3@gmail.com'),
('T04','GV4','gv4@gmail.com'),
('T05','GV5','gv5@gmail.com');

insert into course values
('C01','SQL','Hoc SQL',20,'T01'),
('C02','Java','Hoc Java',25,'T02'),
('C03','Python','Hoc Python',30,'T03'),
('C04','Web','Hoc Web',22,'T04'),
('C05','AI','Hoc AI',28,'T05');

insert into enrollment values
('S01','C01','2024-01-01'),
('S02','C02','2024-01-02'),
('S03','C03','2024-01-03'),
('S04','C04','2024-01-04'),
('S05','C05','2024-01-05');

insert into result values
('S01','C01',8,9),
('S02','C02',7,8),
('S03','C03',6,7),
('S04','C04',9,9),
('S05','C05',5,6);

-- UPDATE
update student set email='newemail@gmail.com' where student_id='S01';
update course set description='Updated' where course_id='C01';
update result set final_score=10 where student_id='S01' and course_id='C01';

-- DELETE
delete from result where student_id='S05' and course_id='C05';
delete from enrollment where student_id='S05' and course_id='C05';

-- SELECT
select * from student;
select * from instructor;
select * from course;
select * from enrollment;
select * from result;
