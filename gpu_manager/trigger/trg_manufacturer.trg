CREATE OR REPLACE TRIGGER trg_manufacturer
  BEFORE INSERT OR UPDATE ON manufacturer
  FOR EACH ROW

BEGIN
  IF inserting THEN
    IF :new.man_id IS NULL THEN
      :new.man_id := seq_manufacturer.nextval;
    
    END IF;
  
    :new.created_on := SYSDATE;
    :new.dml_flag   := 'I';
    :new.version    := 1;
  ELSE
    IF nvl(:new.dml_flag, 'U') <> 'D' THEN
      :new.dml_flag := 'U';
    END IF;
  
    :new.version := :old.version + 1;
  END IF;

  :new.last_mod := SYSDATE;
  :new.mod_user := sys_context('USERENV', 'OS_USER');
END;
/
