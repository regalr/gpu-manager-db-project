create or replace type ty_gpu_chip as object
(
    gpu_chip_id number,
    gpu_name varchar2(20),
    foundry number,
    directx number,
    fp16 number,
    fp64 number,
    int32 number,
    pt_cores number,

  CONSTRUCTOR FUNCTION ty_gpu_chip RETURN SELF AS RESULT,
  CONSTRUCTOR FUNCTION ty_gpu_chip(gpu_name VARCHAR2)
    RETURN SELF AS RESULT
)
/
