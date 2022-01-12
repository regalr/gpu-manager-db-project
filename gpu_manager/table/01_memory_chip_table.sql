CREATE TABLE memory_chip(
  memory_chip_id                         NUMBER         NOT NULL
 ,manufacturer                          NUMBER         NOT NULL
 ,mem_type                          NUMBER         NOT NULL
 ,mem_name                          VARCHAR2(10)         NOT NULL
  ,mod_user                          varchar2(300)
 ,created_on                        timestamp(6)
 ,last_mod                          timestamp(6)
 ,dml_flag	                        varchar2(1)
 ,version	                          number
) 
TABLESPACE users;
