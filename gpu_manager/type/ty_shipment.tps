create or replace type ty_shipment as object
(
    shipment_id number,
    vendor_id number,
    graphics_card_id number,
    quantity number,
    shipment_date date,
    price_per_unit number,
    manufacturing_cost number,

  CONSTRUCTOR FUNCTION ty_shipment RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ty_shipment(shipment_id number)
    RETURN SELF AS RESULT
)
/
