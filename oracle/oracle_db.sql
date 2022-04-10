Use oracle_db;

Drop TABLE course;

CREATE TABLE course (
course_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
course_number VARCHAR(255) NOT NULL,
course_name VARCHAR (255) NOT NULL,
course_description VARCHAR(255) NOT NULL,
credit_hours VARCHAR(255) NOT NULL,
status VARCHAR(1));

CREATE SEQUENCE course_id_seq START WITH 1000 INCREMENT BY 1;

INSERT INTO course ( course_number, course_name, course_description, credit_hours, status)
VALUES
(1, 'CSCI-2370', 'Database Systems', 'Database Systems', '3', 'I'),
(2, 'CSCI-2489', 'Mobile Development', 'Mobile Development', '4', 'D'),
(3, 'ACT-1211', 'Financial Accounting', 'Financial Accounting', '3', 'E'),
(4, 'CSCI-2447', 'JavaScript Fundamentals', 'JavaScript Fundamentals', '4', 'B'),
(5, 'CSCI-2412', 'Web Database', 'Web Database', '3', 'A');

Drop TABLE faculty;

CREATE TABLE faculty (
faculty_id INT PRIMARY KEY NOT NULL,
first_name VARCHAR(255) NOT NULL,
last_name VARCHAR (255) NOT NULL,
mi VARCHAR(255) NOT NULL,
work_phone VARCHAR(255) NOT NULL,
cellphone VARCHAR(255) NOT NULL,
rank VARCHAR (255) NOT NULL,
experience VARCHAR (255) NOT NULL,
status VARCHAR(255));

CREATE SEQUENCE faculty_id_seq START WITH 1000 INCREMENT BY 1;

INSERT INTO faculty(faculty_id, first_name, last_name, mi, work_phone, cellphone, rank, experience, status)
VALUES
(1, 'sam', 'cook', 'p', '6142812811', '6142541254', 'newbie', '5 YEARS', 'A'),
(2, 'mike', 'jones', 'l', '6142812811', '6142541254', 'historian', '3 YEARS', 'T'),
(3, 'denise', 'smith', 'h', '6142812811', '6142541254', 'professor', '25 YEARS', 'A'),
(4, 'tim', 'miller', 'o', '6142812811', '6142541254', 'Adjunct', '5 YEARS', 'L'),
(5, 'ann', 'meek', 'p', '6142812811', '6142541254', 'Professor', '35 YEARS', 'R');



Drop TABLE location;
CREATE TABLE location (
location_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
building VARCHAR(255) NOT NULL,
room VARCHAR (255) NOT NULL,
capacity INT NOT NULL,
status VARCHAR(255) NOT NULL);
CREATE SEQUENCE location_id_seq START WITH 1000 INCREMENT BY 1;

INSERT INTO location(building, room, capacity, status)
VALUES
(1,'Eibling Hall', '  209', 00030, 'A'),
(2,'Delaware Hall', '  210', 00030, 'B'),
(3,'Nestor Hall', '  211', 00030, 'C'),
(4,'Delaware', '  212', 00030, 'D'),
(5,'Eibling Hall', '  213', 00030, 'E');


Drop TABLE section;
CREATE TABLE section (
section_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
course_id INT NOT NULL,
section_number VARCHAR (255) NOT NULL,
days VARCHAR(255) NOT NULL,
start_time VARCHAR(255) NOT NULL,
end_time VARCHAR(255) NOT NULL,
location_id INT NOT NULL,
sets_available INT NOT NULL,
status VARCHAR(255)  NOT NULL,
FOREIGN KEY (course_id) REFERENCES course(course_id),
FOREIGN KEY (location_id) REFERENCES location(location_id)
);
CREATE SEQUENCE section_id_seq START WITH 1000 INCREMENT BY 1;

INSERT INTO section (section_id, course_id, section_number, days, start_time, end_time, location_id, sets_available, status)
VALUES
(1, 1, 'B1-H', 'Tue', '22-MAY-13', '3-AUG-13', 3, 23, 'A'),
(2, 2, 'C1-H', 'Wed', '22-MAY-13', '3-AUG-13',2, 23, 'C'),
(3, 3, 'D1-W', 'Thur', '22-MAY-13', '3-AUG-13',4, 23, 'F'),
(4, 4, 'E1-2', 'Fri', '22-MAY-13', '3-AUG-13',1, 23, 'D'),
(5, 5, 'F1-B', 'Sat', '22-MAY-13', '3-AUG-13',5, 23, 'E');

Drop TABLE student;
CREATE TABLE student (
student_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
first_name VARCHAR(255)  NOT NULL,
last_name VARCHAR (255)  NOT NULL,
mi VARCHAR(255)  NOT NULL,
address VARCHAR(255)  NOT NULL,
city VARCHAR(255)  NOT NULL,
state VARCHAR (255)  NOT NULL,
zipcode VARCHAR (255)  NOT NULL,
home_phone VARCHAR (255)  NOT NULL,
cellphone VARCHAR (255)  NOT NULL,
email VARCHAR (255)  NOT NULL,
dob VARCHAR (255) NOT NULL,
pin VARCHAR (255)  NOT NULL,
status VARCHAR (255)  NOT NULL);

CREATE SEQUENCE student_id_seq START WITH 1000 INCREMENT BY 1;

INSERT INTO student (student_id,first_name, last_name, mi, address, city, state, zipcode, home_phone, cellphone, email, dob, pin, status) 
VALUES
(1, 'Booky', 'Phillips', 'L', 'PO BOX 339', 'Pickerington', 'OH', '43147-9998', '6142812811', '6142541254', 'bphillips@email.com', '12-JAN-1963', '15246', 'F'),
(2, 'Denise', 'Miller', 'S', '172 E Main St', 'Columbus', 'OH', '43215-9997', '6145412544', '6142541254', 'dsmith@email.com', '01-FEB-1964', '45246', 'S'),
(3, 'Rocky', 'Smith', 'R', '45 Broad St', 'Westerville', 'OH', '43081-8888', '6145542211', '6142541254', 'rsmith@email.com', '02-APR-1950', '99999', 'J'),
(4, 'Tammy', 'Stone', 'B', '88 E Broad St', 'Columbus', 'OH', '43215-7777', '6142812811', '6142541254', 'Tstone@email.com', '04-MAR-1958', '88855', 'R'),
(5, 'Anne', 'Thomas', 'P', '172 E State St', 'Columbus', 'OH', '43215-7777', '6144667245', '6142541254', 'athomas@email.com', '05-MAY-1971', '99911', 'F');


Drop TABLE registration;
CREATE TABLE registration (
registration_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
student_id INT NOT NULL,
section_id INT NOT NULL,
FOREIGN KEY (student_id) REFERENCES student(student_id),
FOREIGN KEY (section_id) REFERENCES section(section_id)
);
CREATE SEQUENCE registration_id_seq START WITH 1000 INCREMENT BY 1;

ALTER TABLE registration
ADD CONSTRAINT registration_info UNIQUE (student_id, section_id)

INSERT INTO registration (registration_id, student_id, section_id) 
VALUES
(1, 1,7);


Drop TABLE course_instructor;

CREATE TABLE course_instructor (
course_instructor_id INT PRIMARY KEY NOT NULL,
faculty_id INT NOT NULL,
section_id INT NOT NULL,
FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id),
FOREIGN KEY (section_id) REFERENCES section(section_id),
CONSTRAINT course_instructor_info UNIQUE (faculty_id, section_id)
);

CREATE SEQUENCE course_instructor_id_seq START WITH 1000 INCREMENT BY 1;

INSERT INTO course_instructor (course_instructor_id, faculty_id, section_id) 
VALUES
(1,1,9),
(2, 2,6),
(3, 3,10),
(4, 4,8),
(5, 5,7);</string>
			<key>view</key>
			<string>SP_VIEW_CUSTOMQUERY</string>
			<key>windowVerticalDividerPosition</key>
			<real>214</real>
		</dict>
	</dict>
	<key>encrypted</key>
	<false/>
	<key>format</key>
	<string>connection</string>
	<key>queryFavorites</key>
	<array/>
	<key>queryHistory</key>
	<array>
		<string>ADD CONSTRAINT registration_info UNIQUE (student_id, section_id)</string>
		<string>ALTER TABLE registration</string>
		<string>CREATE TABLE registration (
registration_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
student_id INT NOT NULL,
section_id INT NOT NULL,
FOREIGN KEY (student_id) REFERENCES student(student_id),
FOREIGN KEY (section_id) REFERENCES section(section_id)
)</string>
		<string>Drop TABLE registration</string>
		<string>INSERT INTO registration (student_id, section_id) 
VALUES
(1,7)</string>
		<string>INSERT INTO course_instructor (faculty_id, section_id) 
VALUES
(1,9),
(2,6),
(3,10),
(4,8),
(5,7)</string>
		<string>CREATE SEQUENCE course_instructor_id_seq START WITH 1000 INCREMENT BY 1</string>
		<string>CREATE TABLE course_instructor (
course_instructor_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
faculty_id INT NOT NULL,
section_id INT NOT NULL,
FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id),
FOREIGN KEY (section_id) REFERENCES section(section_id)
)</string>
		<string>CREATE TABLE course_instructor (
course_instructor_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
faculty_id INT NOT NULL,
section_id INT NOT NULL,
FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id)
FOREIGN KEY (section_id) REFERENCES section(section_id)
)</string>
		<string>Drop TABLE course_instructor</string>
		<string>INSERT INTO registration (student_id, section_id) 
VALUES
(1,7),
(2,9),
(3,6),
(4,8),
(5,10)</string>
		<string>INSERT INTO registration (student_id, section_id) 
VALUES
(1,5),
(2,4),
(3,3),
(4,2),
(5,1)</string>
		<string>CREATE SEQUENCE registration_id_seq START WITH 1000 INCREMENT BY 1</string>
		<string>CREATE TABLE registration (
registration_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
student_id INT NOT NULL,
section_id INT NOT NULL,
FOREIGN KEY (student_id) REFERENCES student(student_id)
FOREIGN KEY (section_id) REFERENCES section(section_id)
)</string>
		<string>INSERT INTO student (first_name, last_name, mi, address, city, state, zipcode, home_phone, cellphone, email, dob, pin, status) 
VALUES
('Booky', 'Phillips', 'L', 'PO BOX 339', 'Pickerington', 'OH', '43147-9998', '6142812811', '6142541254', 'bphillips@email.com', '12-JAN-1963', '15246', 'F'),
('Denise', 'Miller', 'S', '172 E Main St', 'Columbus', 'OH', '43215-9997', '6145412544', '6142541254', 'dsmith@email.com', '01-FEB-1964', '45246', 'S'),
('Rocky', 'Smith', 'R', '45 Broad St', 'Westerville', 'OH', '43081-8888', '6145542211', '6142541254', 'rsmith@email.com', '02-APR-1950', '99999', 'J'),
('Tammy', 'Stone', 'B', '88 E Broad St', 'Columbus', 'OH', '43215-7777', '6142812811', '6142541254', 'Tstone@email.com', '04-MAR-1958', '88855', 'R'),
('Anne', 'Thomas', 'P', '172 E State St', 'Columbus', 'OH', '43215-7777', '6144667245', '6142541254', 'athomas@email.com', '05-MAY-1971', '99911', 'F')</string>
		<string>INSERT INTO student (first_name, last_name, mi, address, city, state, zipcode, home_phone, cellphone, email, dob, pin) 
VALUES
('Booky', 'Phillips', 'L', 'PO BOX 339', 'Pickerington', 'OH', '43147-9998', '6142812811', '6142541254', 'bphillips@email.com', '12-JAN-1963', '15246', 'F'),
('Denise', 'Miller', 'S', '172 E Main St', 'Columbus', 'OH', '43215-9997', '6145412544', '6142541254', 'dsmith@email.com', '01-FEB-1964', '45246', 'S'),
('Rocky', 'Smith', 'R', '45 Broad St', 'Westerville', 'OH', '43081-8888', '6145542211', '6142541254', 'rsmith@email.com', '02-APR-1950', '99999', 'J'),
('Tammy', 'Stone', 'B', '88 E Broad St', 'Columbus', 'OH', '43215-7777', '6142812811', '6142541254', 'Tstone@email.com', '04-MAR-1958', '88855', 'R'),
('Anne', 'Thomas', 'P', '172 E State St', 'Columbus', 'OH', '43215-7777', '6144667245', '6142541254', 'athomas@email.com', '05-MAY-1971', '99911', 'F')</string>
		<string>CREATE SEQUENCE student_id_seq START WITH 1000 INCREMENT BY 1</string>
		<string>CREATE TABLE student (
student_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
first_name VARCHAR(255)  NOT NULL,
last_name VARCHAR (255)  NOT NULL,
mi VARCHAR(255)  NOT NULL,
address VARCHAR(255)  NOT NULL,
city VARCHAR(255)  NOT NULL,
state VARCHAR (255)  NOT NULL,
zipcode VARCHAR (255)  NOT NULL,
home_phone VARCHAR (255)  NOT NULL,
cellphone VARCHAR (255)  NOT NULL,
email VARCHAR (255)  NOT NULL,
dob VARCHAR (255) NOT NULL,
pin VARCHAR (255)  NOT NULL,
status VARCHAR (255)  NOT NULL)</string>
		<string>Drop TABLE student</string>
		<string>INSERT INTO section (course_id, section_number, days, start_time, end_time, location_id, sets_available, status)
VALUES
(1, 'B1-H', 'Tue', '22-MAY-13', '3-AUG-13', 3, 23, 'A'),
(2, 'C1-H', 'Wed', '22-MAY-13', '3-AUG-13',2, 23, 'C'),
(3, 'D1-W', 'Thur', '22-MAY-13', '3-AUG-13',4, 23, 'F'),
(4, 'E1-2', 'Fri', '22-MAY-13', '3-AUG-13',1, 23, 'D'),
(5, 'F1-B', 'Sat', '22-MAY-13', '3-AUG-13',5, 23, 'E')
