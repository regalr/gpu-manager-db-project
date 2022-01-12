CREATE OR REPLACE TRIGGER trg_gpu_chip_h
  AFTER INSERT OR UPDATE OR DELETE ON gpu_chip
  FOR EACH ROW
DECLARE
  v_mod_user gpu_chip_h.mod_user%TYPE;
  v_mod_time gpu_chip_h.last_mod%TYPE;
BEGIN
  v_mod_user := sys_context('USERENV', 'OS_USER');
  v_mod_time := SYSDATE;

  IF deleting
  THEN
    INSERT INTO gpu_chip_h (gpu_chip_id,
                          gpu_name,
                          foundry,
                          directx,
                          fp16,
                          fp64,
                          int32,
                          pt_cores,
                          mod_user,
                          created_on,
                          last_mod,
                          dml_flag,
                          version)
    VALUES
      (:old.gpu_chip_id,
        :old.gpu_name,
        :old.foundry,
        :old.directx,
        :old.fp16,
        :old.fp64,
        :old.int32,
        :old.pt_cores
      ,v_mod_user
      ,:old.created_on
      ,v_mod_time
      ,'D'
      ,:old.version + 1);
  ELSE
    INSERT INTO gpu_chip_h (gpu_chip_id,
                          gpu_name,
                          foundry,
                          directx,
                          fp16,
                          fp64,
                          int32,
                          pt_cores,
                          mod_user,
                          created_on,
                          last_mod,
                          dml_flag,
                          version)
    VALUES
      (:new.gpu_chip_id,
        :new.gpu_name,
        :new.foundry,
        :new.directx,
        :new.fp16,
        :new.fp64,
        :new.int32,
        :new.pt_cores
      
      ,:new.mod_user
      ,:new.created_on
      ,:new.last_mod
      ,:new.dml_flag
      ,:new.version);
  END IF;
END;
/
