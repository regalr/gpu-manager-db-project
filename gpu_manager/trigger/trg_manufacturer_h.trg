CREATE OR REPLACE TRIGGER trg_manufacturer_h
  AFTER INSERT OR UPDATE OR DELETE ON manufacturer
  FOR EACH ROW
DECLARE
  v_mod_user manufacturer_h.mod_user%TYPE;
  v_mod_time manufacturer_h.last_mod%TYPE;
BEGIN
  v_mod_user := sys_context('USERENV', 'OS_USER');
  v_mod_time := SYSDATE;

  IF deleting
  THEN
    INSERT INTO manufacturer_h (man_id,
                                     man_name,
                                     country,
                                     founded,
                                     mod_user,
                                     created_on,
                                     last_mod,
                                     dml_flag,
                                     version)
    VALUES
      (:old.man_id,
         :old.man_name,
         :old.country,
         :old.founded
      ,v_mod_user
      ,:old.created_on
      ,v_mod_time
      ,'D'
      ,:old.version + 1);
  ELSE
    INSERT INTO manufacturer_h (man_id,
                                     man_name,
                                     country,
                                     founded,
                                     mod_user,
                                     created_on,
                                     last_mod,
                                     dml_flag,
                                     version)
    VALUES
      (:new.man_id,
         :new.man_name,
         :new.country,
         :new.founded
      ,:new.mod_user
      ,:new.created_on
      ,:new.last_mod
      ,:new.dml_flag
      ,:new.version);
  END IF;
END trg_manufacturer_h;
/
