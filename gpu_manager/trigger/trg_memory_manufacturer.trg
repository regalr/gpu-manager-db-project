CREATE OR REPLACE TRIGGER trg_memory_manufacturer
  BEFORE INSERT OR UPDATE ON memory_manufacturer
  FOR EACH ROW

BEGIN
  IF inserting
  THEN
    IF :new.mem_man_id IS NULL
    THEN
      :new.mem_man_id := seq_memory_manufacturer.nextval;

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
