create table homes(
                      id int primary key ,
                      color varchar,
                      rooms int not null ,
                      area varchar,
                      location varchar

);
insert into homes (id, color,rooms, area, location)
values (1,'green',5,'200m','Washington'),
       (2,'yellow',4,'150m','New York'),
       (3,'blue',6,'400m','Chicago');
---------------------------------------------------
create table families(
                         id int primary key ,
                         daddy varchar,
                         mommy varchar,
                         son varchar,
                         daughter varchar
);
insert into families(id, daddy, mommy, son, daughter)
values (1,'Ulukbek','Aichurok','Ahmad','Mariam'),
       (2,'Bakyt','Dayragul','Umar',null),
       (3,'Bektur','Begimay','Bekhan','Rayana');
-----------------------------------------------------
create table person(
                       id int primary key ,
                       first_name varchar,
                       last_name varchar,
                       car varchar,
                       inn int unique not null
);
insert into person(id, first_name, last_name, car, inn)
values (1,'Ulukbek','Shadybaev','Mercedes',219000),
       (2,'Aichurok','Turgunbaeva','Hyundai',129000),
       (3,'Bektur','Aziretkul uulu','Toyota',200);
-----------------------------------------------------
alter table homes
    add column family_id int references families(id);
select * from homes join families on homes.family_id = families.id;
update homes
set family_id = 1
where id = 1;

alter table families add column home_id int references homes(id);
update families
set home_id = 1
where id = 1;

alter table person rename to people;

alter table families
    add column person_id int references people(id);
select * from families join people on families.id = people.id;
update families
set person_id = 1
where id = 1;

alter table people add column family_id int references families(id);
update people
set family_id = 1
where id = 1;

alter table people drop column car;
-----------------------------------------------------
create table cars (
                      id int primary key ,
                      model varchar
);
insert into cars(id, model)
values (1,'Toyota'),
       (2,'Hyundai'),
       (3,'Tesla');
alter table people add car_id int references cars(id);
select * from people join cars on people.id = cars.id;
update people
set car_id = 2
where id = 2 ;
--------------------------------------------------------
create table courses(
    id int unique primary key
);
insert into courses(id)
values (1),
       (2);
alter table people add course_id int references courses(id);
select * from people join courses on people.id = courses.id;
update people
set course_id = 1
where id = 2;
--------------------------------------------------------
create table engine_type(
    id int primary key
);
insert into engine_type(id)
values (1),
       (2),
       (3);
alter table cars add engine_type_id int references engine_type(id);
select * from cars join engine_type on cars.id = cars.engine_type_id;
update cars
set engine_type_id = 3
where id = 1;
-------------------------------------------------------
create table students (
                          id int primary key ,
                          name varchar(12),
                          course_id int references courses(id)
);
insert into students(id, name, course_id)
values (1,'Aziza',2),
       (2,'Klara',1);
select * from courses join students s on courses.id = s.course_id;
update students
set course_id = 1
where id = 2;
------------------------------------------------------
create table teachers(
                         id int primary key ,
                         name varchar(20) not null ,
                         course_id int references courses(id)
);
insert into teachers(id, name, course_id)
values (1,'Akim',1),
       (2,'Aidai',2);
select * from courses join teachers t on courses.id = t.course_id;
update teachers
set course_id = 2
where id = 1;
--------------------------------------------------------
create table addresses(
                          id int primary key ,
                          town varchar,
                          home_id int references homes(id),
                          course_id int references courses(id),
                          university_id int references universities(id)
);
insert into addresses(id, town, home_id, course_id, university_id)
values (1,'Texas',2,3,1),
       (2,'Bishkek',1,2,2);
select * from homes join addresses a on homes.id = a.home_id;
select * from courses join addresses a on courses.id = a.course_id;
select * from universities join addresses a on a.id = universities.address_id;
update addresses
set home_id = 1 and course_id = 2 and university_id = 1
where id = 1 and id = 2 and id = 1;
--------------------------------------------------------
create table universities(
                             id int primary key ,
                             name varchar(30),
                             student_id int references students(id),
                             teacher_id int references teachers(name),
                             address_id int references addresses(id)
);
insert into universities(id, name, student_id, teacher_id, address_id)
values (1,'Texas',2,1,1),
       (2,'Manas',3,2,2),
       (3,'Alatoo',1,3,3);
select * from students join universities u on students.id = u.student_id;
update universities
set student_id = 1
where id = 2;
alter table universities drop column teacher_id;
