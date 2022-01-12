
CREATE OR REPLACE TRIGGER trg_vendor_h
  AFTER INSERT OR UPDATE OR DELETE ON vendor
  FOR EACH ROW
DECLARE
  v_mod_user vendor_h.mod_user%TYPE;
  v_mod_time vendor_h.last_mod%TYPE;
BEGIN
  v_mod_user := sys_context('USERENV', 'OS_USER');
  v_mod_time := SYSDATE;

  IF deleting
  THEN
    INSERT INTO vendor_h (vendor_id,
                          vendor_name,
                          country,
                          mod_user,
                          created_on,
                          last_mod,
                          dml_flag,
                          version)
    VALUES
      (:old.vendor_id,
          :old.vendor_name,
          :old.country
      ,v_mod_user
      ,:old.created_on
      ,v_mod_time
      ,'D'
      ,:old.version + 1);
  ELSE
    INSERT INTO vendor_h (vendor_id,
                          vendor_name,
                          country,
                          mod_user,
                          created_on,
                          last_mod,
                          dml_flag,
                          version)
    VALUES
      (:new.vendor_id,
          :new.vendor_name,
          :new.country
      ,:new.mod_user
      ,:new.created_on
      ,:new.last_mod
      ,:new.dml_flag
      ,:new.version);
  END IF;
END trg_vendor_h;
/
