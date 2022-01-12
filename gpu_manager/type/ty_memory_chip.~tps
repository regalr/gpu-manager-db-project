CREATE OR REPLACE TYPE ty_memory_chip AS OBJECT
(
  memory_chip_id NUMBER,
  manufacturer   NUMBER,
  mem_type       NUMBER,
  mem_name       VARCHAR2(10),

  CONSTRUCTOR FUNCTION ty_memory_chip RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ty_memory_chip(mem_name VARCHAR2)
    RETURN SELF AS RESULT
)
/
