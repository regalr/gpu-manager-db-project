
ALTER TABLE shipment
  ADD CONSTRAINT shipment_quantity_0 CHECK ( quantity >= 0);
  
ALTER TABLE shipment
  ADD CONSTRAINT shipment_quantity_1 CHECK ( quantity = TRUNC(quantity) );
