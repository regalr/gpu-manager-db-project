create or replace type ty_graphics_card as object
(
    graphics_card_id number,
    graphics_card_name varchar2(30),
    gpu_chip number,
    first_release date,
    mem_size number,
    mem_id number,
    mem_int_width number,
    mem_clock number,
    base_clock number,
    boost_clock number,
    manufacturing_cost number,

  CONSTRUCTOR FUNCTION ty_graphics_card RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ty_graphics_card(graphics_card_name VARCHAR2)
    RETURN SELF AS RESULT
)
/
