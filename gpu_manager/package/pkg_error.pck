create or replace package pkg_error is

  ex_mem_size EXCEPTION;
  ex_mem_size_code CONSTANT NUMBER := -20002;
  PRAGMA EXCEPTION_INIT(ex_mem_size, -20002);

  ex_int_width EXCEPTION;
  ex_int_width_code CONSTANT NUMBER := -20003;
  PRAGMA EXCEPTION_INIT(ex_int_width, -20003);
  
  ex_no_data EXCEPTION;
  ex_no_data_code CONSTANT NUMBER := -20004;
  PRAGMA EXCEPTION_INIT(ex_no_data, -20004);

  
  ex_incompatible_mem EXCEPTION;
  ex_incompatible_mem_code CONSTANT NUMBER := -20005;
  PRAGMA EXCEPTION_INIT(ex_incompatible_mem, -20005);
  
  ex_general EXCEPTION;
  ex_general_code CONSTANT NUMBER := -20001;
  PRAGMA EXCEPTION_INIT(ex_general, -20001);
  
end pkg_error;
/
create or replace package body pkg_error is
BEGIN
  NULL;
end pkg_error;
/
