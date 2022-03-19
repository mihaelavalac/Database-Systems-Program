-- COURSE TABLE CONSTRAINS --
ALTER TABLE course --DONE
ADD CONSTRAINT credit_hours_cc
CHECK (credit_hours <= 6.0 );

ALTER TABLE course --DONE
ADD CONSTRAINT course_status_cc
CHECK (status ='A' OR status ='I');

-- FACULTY TABLE CONSTRAINS --
ALTER TABLE faculty --DONE
ADD CONSTRAINT faculty_status_cc
CHECK (status ='A' OR status ='F');

-- LOCATION TABLE CONSTRAINS --
ALTER TABLE location --DONE
ADD CONSTRAINT location_status_cc
CHECK (status ='A' OR status ='I');


-- SECTION TABLE CONSTRAINS --
ALTER TABLE section --DONE
ADD CONSTRAINT section_status_cc
CHECK (status ='A' OR status ='I');

ALTER TABLE section 
ADD CONSTRAINT section_days_cc
CHECK (days IN 'M', 'T', 'W', 'R', 'F', 'S', 'U');

CHECK (REGEXP_LIKE(days,'^([MTWUFSR]\1{1,7}+)$'));



ALTER TABLE section --DONE
ADD CONSTRAINT section_time_cc
CHECK (start_time < end_time);
 
ALTER TABLE section --DONE
ADD CONSTRAINT section_sets_available_cc
CHECK (sets_available < 100);

-- STUDENT TABLE CONSTRAINS --
ALTER TABLE student --DONE
ADD CONSTRAINT student_zipcode_cc
CHECK (REGEXP_LIKE(zipcode,'^([[:digit:]]{5}-[[:digit:]]{4})$'))

ALTER TABLE student --DONE
ADD CONSTRAINT student_pin_cc
CHECK (REGEXP_LIKE(pin,'^(.+)$'));

ALTER TABLE student --Done
ADD CONSTRAINT student_mi_cc
CHECK (REGEXP_LIKE(mi,'^([A-Z]{1})$'));

ALTER TABLE student --DONE
ADD CONSTRAINT student_status_cc
CHECK (status ='C' OR status ='T' OR status ='I');


--  ================================================================================================================
-- =============================================================================================================