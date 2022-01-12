
CREATE OR REPLACE TRIGGER trg_shipment_h
  AFTER INSERT OR UPDATE OR DELETE ON shipment
  FOR EACH ROW
DECLARE
  v_mod_user shipment_h.mod_user%TYPE;
  v_mod_time shipment_h.last_mod%TYPE;
BEGIN
  v_mod_user := sys_context('USERENV', 'OS_USER');
  v_mod_time := SYSDATE;

  IF deleting
  THEN
    INSERT INTO shipment_h (shipment_id,
                            vendor_id,
                            graphics_card_id,
                            quantity,
                            shipment_date,
                            price_per_unit,
                            manufacturing_cost,
                            mod_user,
                            created_on,
                            last_mod,
                            dml_flag,
                            version)
    VALUES
      (:old.shipment_id,
        :old.vendor_id,
        :old.graphics_card_id,
        :old.quantity,
        :old.shipment_date,
        :old.price_per_unit,
        :old.manufacturing_cost
      ,v_mod_user
      ,:old.created_on
      ,v_mod_time
      ,'D'
      ,:old.version + 1);
  ELSE
    INSERT INTO shipment_h (shipment_id,
                            vendor_id,
                            graphics_card_id,
                            quantity,
                            shipment_date,
                            price_per_unit,
                            manufacturing_cost,
                            mod_user,
                            created_on,
                            last_mod,
                            dml_flag,
                            version)
    VALUES
      (:new.shipment_id,
        :new.vendor_id,
        :new.graphics_card_id,
        :new.quantity,
        :new.shipment_date,
        :new.price_per_unit,
        :new.manufacturing_cost
      ,:new.mod_user
      ,:new.created_on
      ,:new.last_mod
      ,:new.dml_flag
      ,:new.version);
  END IF;
END trg_shipment_h;
/
