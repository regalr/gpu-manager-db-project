CREATE TABLE graphics_card(
  graphics_card_id                  NUMBER         NOT NULL
 ,graphics_card_name                VARCHAR2(30)   NOT NULL
 ,gpu_chip                          NUMBER         NOT NULL
 ,first_release                     DATE           DEFAULT SYSDATE NOT NULL
 ,mem_size                          NUMBER           NOT NULL
 ,mem_id                            NUMBER
 ,mem_int_width                     NUMBER           NOT NULL
 ,mem_clock                         NUMBER           NOT NULL
 ,base_clock                        NUMBER           NOT NULL
 ,boost_clock                       NUMBER           NOT NULL
 ,manufacturing_cost                NUMBER           NOT NULL
  ,mod_user                          varchar2(300)
 ,created_on                        timestamp(6)
 ,last_mod                          timestamp(6)
 ,dml_flag	                        varchar2(1)
 ,version	                          number
) 
TABLESPACE users;
