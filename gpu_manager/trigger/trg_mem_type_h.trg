CREATE OR REPLACE TRIGGER trg_mem_type_h
  AFTER INSERT OR UPDATE OR DELETE ON mem_type
  FOR EACH ROW
DECLARE
  v_mod_user mem_type_h.mod_user%TYPE;
  v_mod_time mem_type_h.last_mod%TYPE;
BEGIN
  v_mod_user := sys_context('USERENV', 'OS_USER');
  v_mod_time := SYSDATE;

  IF deleting
  THEN
    INSERT INTO mem_type_h (mem_id,
                            mem_name,
                            mod_user,
                            created_on,
                            last_mod,
                            dml_flag,
                            version)
    VALUES
      (:old.mem_id
      ,:old.mem_name
      ,v_mod_user
      ,:old.created_on
      ,v_mod_time
      ,'D'
      ,:old.version + 1);
  ELSE
    INSERT INTO mem_type_h (mem_id,
                            mem_name,
                            mod_user,
                            created_on,
                            last_mod,
                            dml_flag,
                            version)
    VALUES
      (:new.mem_id
      ,:new.mem_name
      ,:new.mod_user
      ,:new.created_on
      ,:new.last_mod
      ,:new.dml_flag
      ,:new.version);
  END IF;
END trg_mem_type_h;
/
