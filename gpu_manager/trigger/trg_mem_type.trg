CREATE OR REPLACE TRIGGER trg_mem_type
  BEFORE INSERT OR UPDATE ON mem_type
  FOR EACH ROW

BEGIN
  IF inserting
  THEN
    IF :new.mem_id IS NULL
    THEN
      :new.mem_id := seq_mem_type.nextval;

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
