CREATE OR REPLACE TRIGGER trg_vendor
  BEFORE INSERT OR UPDATE ON vendor
  FOR EACH ROW

BEGIN
  IF inserting
  THEN
    IF :new.vendor_id IS NULL
    THEN
      :new.vendor_id := seq_vendor.nextval;

    END IF;
  
    :new.created_on := SYSDATE;
    :new.dml_flag   := 'I';
    :new.version    := 1;
  ELSE
    IF nvl(:new.dml_flag, 'U') <> 'D'
    THEN
      :new.dml_flag := 'U';
    END IF;
  
    :new.version := :old.version + 1;
  END IF;

  :new.last_mod := SYSDATE;
  :new.mod_user := sys_context('USERENV', 'OS_USER');
END;
/
