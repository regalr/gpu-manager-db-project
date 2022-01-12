CREATE TABLE gpu_chip(
  gpu_chip_id                         NUMBER         NOT NULL
 ,gpu_name                          VARCHAR2(10)         NOT NULL
 ,foundry                          NUMBER         NOT NULL
 ,directx                          NUMBER         NOT NULL
 ,fp16                          NUMBER         NOT NULL
 ,fp64                          NUMBER         NOT NULL
 ,int32                          NUMBER         NOT NULL
 ,pt_cores                          NUMBER        
  ,mod_user                          varchar2(300)
 ,created_on                        timestamp(6)
 ,last_mod                          timestamp(6)
 ,dml_flag	                        varchar2(1)
 ,version	                          number
) 
TABLESPACE users;
