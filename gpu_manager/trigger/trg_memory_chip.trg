CREATE OR REPLACE TRIGGER trg_memory_chip
  BEFORE INSERT OR UPDATE ON memory_chip
  FOR EACH ROW

BEGIN
  IF inserting
  THEN
    IF :new.memory_chip_id IS NULL
    THEN
      :new.memory_chip_id := seq_memory_chip.nextval;

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
