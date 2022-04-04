-- In class assignment 6
--CREATE THE GRADE TABLE WITH STUDENT_ID, SECTION_ID, GRADE
CREATE TABLE grades (
student_id INTEGER,
section_id INTEGER,
grade VARCHAR2(1) NULL,
FOREIGN KEY (student_id) REFERENCES Student(student_id)
);

-- CREATE TRIGGER THAT WILL ADD A RECORD TO THE GRADE TABLE WHEN A STUDENT WILL REGISTER FOR A SECTION
CREATE OR REPLACE TRIGGER student_registration
AFTER INSERT ON registration
REFERENCING NEW AS n
FOR EACH ROW
BEGIN
    INSERT into grades (student_id, section_id, grade)
    Values (:n.student_id,:n.section_id, null);
END;

--INSERTED A NEW USER FOR TESTING PURPOSES
INSERT INTO student (student_id,first_name, last_name, mi, address, city, state, zipcode, home_phone, cellphone, email, dob, pin, status)
VALUES
(6, 'Anne', 'Thomas', 'P', '172 E State St', 'Columbus', 'OH', '43215-7777', '6144667245', '6142541254', 'athomas@email.com', '05-MAY-1971',
'99911', 'T'
);

-- TESTING IF THE STUDENT_REGISTRATION TRIGGER WORKS
Insert INTO registration (registration_id, student_id, section_id)
VALUES (7, 6, 5);

-- CREATED THE INACTIVE_STUDENT_GRADE TRIGGER SO THAT WHEN A STUDENT STATUS IS UPDATED AS 'I'
-- THE GRADE OF THE STUDENT  FOR A SPECIFIC COURSE WILL BE SET TO 'D'
CREATE OR REPLACE TRIGGER inactive_student_grade
AFTER UPDATE ON student
REFERENCING NEW AS n
FOR EACH ROW
BEGIN
    IF (:n.status) = 'I' THEN
    UPDATE grades
    SET grade = 'D'
    WHERE student_id = :n.student_id;
    END IF;
END;

--ADDED AN UPDATE QUERY TO TEST IF THE INACTIVE_STUDENT_GRADE TRIGGER WORKS
UPDATE student
    SET status = 'I'
    WHERE student_id = 6;