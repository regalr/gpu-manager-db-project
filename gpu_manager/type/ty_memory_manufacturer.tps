create or replace type ty_memory_manufacturer as object
(
    mem_man_id number,
    man_name varchar2(20),
    country varchar2(20),
    founded date,

  CONSTRUCTOR FUNCTION ty_memory_manufacturer RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ty_memory_manufacturer(man_name VARCHAR2)
    RETURN SELF AS RESULT
)
/
