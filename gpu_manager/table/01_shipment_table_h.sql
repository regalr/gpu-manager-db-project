CREATE TABLE shipment_h(
  shipment_id                         NUMBER         NOT NULL
 ,vendor_id                          NUMBER         NOT NULL
 ,graphics_card_id                          NUMBER         NOT NULL
 ,quantity                          NUMBER         NOT NULL
 ,shipment_date                          DATE          DEFAULT SYSDATE NOT NULL
 ,price_per_unit                          NUMBER         NOT NULL
 ,manufacturing_cost                          NUMBER         NOT NULL        
  ,mod_user                          varchar2(300)
 ,created_on                        timestamp(6)
 ,last_mod                          timestamp(6)
 ,dml_flag	                        varchar2(1)
 ,version	                          number
) 
TABLESPACE users;
