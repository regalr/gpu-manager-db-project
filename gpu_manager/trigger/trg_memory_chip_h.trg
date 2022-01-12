CREATE OR REPLACE TRIGGER trg_memory_chip_h
  AFTER INSERT OR UPDATE OR DELETE ON memory_chip
  FOR EACH ROW
DECLARE
  v_mod_user memory_chip_h.mod_user%TYPE;
  v_mod_time memory_chip_h.last_mod%TYPE;
BEGIN
  v_mod_user := sys_context('USERENV', 'OS_USER');
  v_mod_time := SYSDATE;

  IF deleting
  THEN
    INSERT INTO memory_chip_h (memory_chip_id,
                               manufacturer,
                               mem_type,
                               mem_name,
                               mod_user,
                               created_on,
                               last_mod,
                               dml_flag,
                               version)
    VALUES
      (:old.memory_chip_id,
         :old.manufacturer,
         :old.mem_type,
         :old.mem_name
      ,v_mod_user
      ,:old.created_on
      ,v_mod_time
      ,'D'
      ,:old.version + 1);
  ELSE
    INSERT INTO memory_chip_h (memory_chip_id,
                               manufacturer,
                               mem_type,
                               mem_name,
                               mod_user,
                               created_on,
                               last_mod,
                               dml_flag,
                               version)
    VALUES
      (:new.memory_chip_id,
         :new.manufacturer,
         :new.mem_type,
         :new.mem_name
      ,:new.mod_user
      ,:new.created_on
      ,:new.last_mod
      ,:new.dml_flag
      ,:new.version);
  END IF;
END;
/
