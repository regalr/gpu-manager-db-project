CREATE TABLE memory_manufacturer(
  mem_man_id                         NUMBER         NOT NULL
 ,man_name                          VARCHAR2(20)         NOT NULL
 ,country                          VARCHAR2(20)         NOT NULL
 ,founded                          DATE         NOT NULL
  ,mod_user                          varchar2(300)
 ,created_on                        timestamp(6)
 ,last_mod                          timestamp(6)
 ,dml_flag	                        varchar2(1)
 ,version	                          number
) 
TABLESPACE users;
