CREATE OR REPLACE TRIGGER trg_graphics_card_h
  AFTER INSERT OR UPDATE OR DELETE ON graphics_card
  FOR EACH ROW
DECLARE
  v_mod_user graphics_card_h.mod_user%TYPE;
  v_mod_time graphics_card_h.last_mod%TYPE;
BEGIN
  v_mod_user := sys_context('USERENV', 'OS_USER');
  v_mod_time := SYSDATE;

  IF deleting
  THEN
    INSERT INTO graphics_card_h (graphics_card_id,
                               graphics_card_name,
                               gpu_chip,
                               first_release,
                               mem_size,
                               mem_id,
                               mem_int_width,
                               mem_clock,
                               base_clock,
                               boost_clock,
                               manufacturing_cost,
                               mod_user,
                               created_on,
                               last_mod,
                               dml_flag,
                               version)
    VALUES
      (:old.graphics_card_id,
         :old.graphics_card_name,
         :old.gpu_chip,
         :old.first_release,
         :old.mem_size,
         :old.mem_id,
         :old.mem_int_width,
         :old.mem_clock,
         :old.base_clock,
         :old.boost_clock,
         :old.manufacturing_cost
      ,v_mod_user
      ,:old.created_on
      ,v_mod_time
      ,'D'
      ,:old.version + 1);
  ELSE
      INSERT INTO graphics_card_h (graphics_card_id,
                               graphics_card_name,
                               gpu_chip,
                               first_release,
                               mem_size,
                               mem_id,
                               mem_int_width,
                               mem_clock,
                               base_clock,
                               boost_clock,
                               manufacturing_cost,
                               mod_user,
                               created_on,
                               last_mod,
                               dml_flag,
                               version)
    VALUES
      (:new.graphics_card_id,
         :new.graphics_card_name,
         :new.gpu_chip,
         :new.first_release,
         :new.mem_size,
         :new.mem_id,
         :new.mem_int_width,
         :new.mem_clock,
         :new.base_clock,
         :new.boost_clock,
         :new.manufacturing_cost
      ,:new.mod_user
      ,:new.created_on
      ,:new.last_mod
      ,:new.dml_flag
      ,:new.version);
  END IF;
END trg_graphics_card_h;
/
