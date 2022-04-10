-- CREATED THE insert_student_grade PROCEDURE
CREATE OR REPLACE PROCEDURE insert_student_grade
IS
    v_grade VARCHAR2(1);
    v_last_char VARCHAR2(1);
  
    CURSOR c1
    IS
        select registration.student_id studentId, registration.section_id sectionID, course.course_name CourseName
        from registration
        left join section on (registration.section_id = section.section_id)
        left join course on (section.course_id = course.course_id);
      
BEGIN
    FOR rec IN c1 LOOP
        v_last_char := substr(rec.CourseName, -1);

        -- Verify the range in which the last char of the course name is and attribute the respective grade value.
        -- I tried to use an if/else if/else block here, but I always received an error.

            IF (REGEXP_LIKE(v_last_char, '[A-Ea-e]'))  THEN v_grade := 'A'; END IF;
            IF (REGEXP_LIKE(v_last_char, '[G-Kg-k]')) THEN v_grade := 'B'; END IF;
            IF (REGEXP_LIKE(v_last_char, '[L-Pl-p]'))THEN v_grade := 'C'; END IF;
            IF (REGEXP_LIKE(v_last_char, '[Q-Tq-t]')) THEN v_grade := 'D'; END IF;
            IF (REGEXP_LIKE(v_last_char, '[U-Zu-z]')) THEN  v_grade := 'E'; END IF;
          
            --Update the record in the grades table
            UPDATE grades
            SET    grade = v_grade
            WHERE student_id = rec.studentId AND section_id = rec.sectionID;
            -- if no record found, insert new record.
            IF (SQL%ROWCOUNT = 0) THEN
            INSERT INTO grades (student_id, section_id, grade)
            VALUES ( rec.studentId, rec.sectionId, v_grade);
            END IF;
            
    END LOOP;  
END;

--  ============================================================== --

-- CREATED THE Student_report VIEW
CREATE OR REPLACE VIEW student_report
AS
SELECT
student.student_id AS "Student Id", CONCAT(CONCAT(student.first_name, ' '), student.last_name) AS "Student Full Name",
course.course_name as "Course Name", course.credit_hours as "Credi Hours",
section.section_id As "Section Id", section.days as "Days", section.start_time as "Start Date", section.end_time as "End Date",
location.building as "Building", location.room as "Room",
CONCAT(CONCAT(faculty.first_name, ' '), faculty.last_name) AS "Instructor Full Name",
grades.grade as "Grade"
FROM grades
left join student on grades.student_id = student.student_id
LEFT JOIN section on grades.section_id = section.section_id
LEFT JOIN location ON section.location_id = location.location_id
left join course on section.course_id = course.course_id
left join course_instructor on section.section_id = course_instructor.section_id
LEFT JOIN FACULTY ON course_instructor.faculty_id = FACULTY.FACULTY_ID;



