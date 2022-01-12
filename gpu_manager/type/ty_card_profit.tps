CREATE OR REPLACE TYPE ty_card_profit AS OBJECT
(
  card_name  VARCHAR2(30),
  profit     NUMBER,

  CONSTRUCTOR FUNCTION ty_card_profit RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ty_card_profit(p_card_name VARCHAR2)
    RETURN SELF AS RESULT
    
)
/
