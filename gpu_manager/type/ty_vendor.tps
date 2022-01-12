CREATE OR REPLACE TYPE ty_vendor AS OBJECT
(
  vendor_id   NUMBER,
  vendor_name VARCHAR2(20),
  country     VARCHAR2(20),

  CONSTRUCTOR FUNCTION ty_vendor RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ty_vendor(vendor_name VARCHAR2) RETURN SELF AS RESULT
)
/
