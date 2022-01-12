declare
  cursor cur is
    select 'alter system kill session ''' || sid || ',' || serial# || '''' as command
      from v$session
     where username = 'GPU_MANAGER';
begin
  for c in cur loop
    EXECUTE IMMEDIATE c.command;
  end loop;
end;
/

DECLARE
  v_count NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_count FROM dba_users t WHERE t.username='GPU_MANAGER';
  IF v_count = 1 THEN 
    EXECUTE IMMEDIATE 'DROP USER gpu_manager CASCADE';
  END IF;
END;
/
CREATE USER gpu_manager 
  IDENTIFIED BY "12345678" 
  DEFAULT TABLESPACE users
  QUOTA UNLIMITED ON users
;

grant CREATE TRIGGER to gpu_manager;
GRANT CREATE SESSION TO gpu_manager;
GRANT CREATE TABLE TO gpu_manager;
GRANT CREATE VIEW TO gpu_manager;
GRANT CREATE SEQUENCE TO gpu_manager;
GRANT CREATE PROCEDURE TO gpu_manager;
grant create type to gpu_manager;

ALTER SESSION SET CURRENT_SCHEMA=gpu_manager;
