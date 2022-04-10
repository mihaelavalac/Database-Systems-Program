--lab 3 starting
DECLARE

    v_grade VARCHAR2(1);
   
    CURSOR c1
    IS
        select registration.student_id studentId, registration.section_id sectionID, course.course_name CourseName
        from registration
        left join section on (registration.section_id = section.section_id)
        left join course on (section.course_id = course.course_id);        
BEGIN

    FOR rec IN c1 LOOP
   

        DBMS_OUTPUT.put_line('Student with the id ' || rec.studentId || ' is registered in the section with id '
        || rec.sectionId || ' and the course name of this section is ' || rec.CourseName || 'and GRADE =' || v_grade );    
    END LOOP;
      /* IF ((substr(rec.CourseName, -1) = ('a' OR 'b' OR 'c' OR 'd' OR 'e' ))) THEN v_grade := 'A';
            --A
          ELSE IF ((substr(rec.CourseName, -1) = ('g' OR 'h' OR 'i' OR 'j' OR 'k' ))) THEN v_grade := 'B';
            --B
            ELSE IF ((substr(rec.CourseName, -1) = ('l' OR 'm' OR 'n' OR 'o' OR 'p' ))) THEN v_grade := 'C';
            --C
            ELSE IF ((substr(rec.CourseName, -1) = ('q' OR 'r' OR 's' OR 't'))) THEN v_grade := 'D';
            --D
            ELSE IF ((substr(rec.CourseName, -1) = ('u' OR 'v' OR 'w' OR 'x' OR 'y' OR 'z' ))) THEN v_grade := 'E';
            --E
            ELSE v_grade := 'B';
            END IF; */
END;
/
