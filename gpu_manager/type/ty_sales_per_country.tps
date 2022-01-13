create or replace type ty_sales_per_country as object
(
  country   VARCHAR2(20),
  sales number,

  CONSTRUCTOR FUNCTION ty_sales_per_country RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ty_sales_per_country(country VARCHAR2) RETURN SELF AS RESULT
)
/
