CREATE OR REPLACE TYPE ty_mem_type AS OBJECT
(
  mem_id   number,
  mem_name VARCHAR(10),

  CONSTRUCTOR FUNCTION ty_mem_type RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ty_mem_type(mem_name VARCHAR2)
    RETURN SELF AS RESULT

)
/
