create or replace package pkg_gpu_chip is

  procedure add_gpu_chip(p_gpu_name varchar2,
                         p_foundry  varchar2,
                         p_directx  number,
                         p_fp16     number,
                         p_fp64     number,
                         p_int32    number,
                         p_pt_cores number default null);

  procedure update_gpu_chip(p_gpu_chip_id number,
                            p_gpu_name    varchar2 default null,
                            p_foundry     varchar2 default null,
                            p_directx     number default null,
                            p_fp16        number default null,
                            p_fp64        number default null,
                            p_int32       number default null,
                            p_pt_cores    number default null);

  procedure delete_gpu_chip(p_gpu_chip_id number);

  function show_gpu_chip(p_gpu_chip_id number default null)
    return ty_gpu_chip_l;

end pkg_gpu_chip;
/
CREATE OR REPLACE PACKAGE BODY pkg_gpu_chip IS

  --add
  procedure add_gpu_chip(p_gpu_name varchar2,
                         p_foundry  varchar2,
                         p_directx  number,
                         p_fp16     number,
                         p_fp64     number,
                         p_int32    number,
                         p_pt_cores number default null) is
  begin
    insert into gpu_chip
      (gpu_chip_id,
       gpu_name,
       foundry,
       directx,
       fp16,
       fp64,
       int32,
       pt_cores)
    values
      (null,
       p_gpu_name,
       p_foundry,
       p_directx,
       p_fp16,
       p_fp64,
       p_int32,
       p_pt_cores);
  
  exception
    when NO_DATA_FOUND then
      RAISE pkg_error.ex_no_data;
      RAISE_APPLICATION_ERROR(pkg_error.ex_no_data_code, 'Nincs adat.');
    
    when others then
      RAISE pkg_error.ex_general;
      RAISE_APPLICATION_ERROR(pkg_error.ex_general_code, 'Hiba.');
  end;

  --update
  procedure update_gpu_chip(p_gpu_chip_id number,
                            p_gpu_name    varchar2 default null,
                            p_foundry     varchar2 default null,
                            p_directx     number default null,
                            p_fp16        number default null,
                            p_fp64        number default null,
                            p_int32       number default null,
                            p_pt_cores    number default null) is
    new_gpu_name varchar2(20);
    new_foundry  number;
    new_directx  number;
    new_fp16     number;
    new_fp64     number;
    new_int32    number;
    new_pt_cores number;
  begin
  


    select nvl(p_gpu_name, gpu_name)
      into new_gpu_name
      from gpu_chip s
     where s.gpu_chip_id = p_gpu_chip_id;

    select nvl(p_foundry, foundry)
      into new_foundry
      from gpu_chip s
     where s.gpu_chip_id = p_gpu_chip_id;

    select nvl(p_directx, directx)
      into new_directx
      from gpu_chip s
     where s.gpu_chip_id = p_gpu_chip_id;

    select nvl(p_fp16, fp16)
      into new_fp16
      from gpu_chip s
     where s.gpu_chip_id = p_gpu_chip_id;

    select nvl(p_fp64, fp64)
      into new_fp64
      from gpu_chip s
     where s.gpu_chip_id = p_gpu_chip_id;

    select nvl(p_int32, int32)
      into new_int32
      from gpu_chip s
     where s.gpu_chip_id = p_gpu_chip_id;

    select nvl(p_pt_cores, pt_cores)
      into new_pt_cores
      from gpu_chip s
     where s.gpu_chip_id = p_gpu_chip_id;
  
    if (new_fp16 != TRUNC(new_fp16)) or (new_fp64 != TRUNC(new_fp64)) or
       (new_int32 != TRUNC(new_int32)) or
       (new_pt_cores != TRUNC(new_pt_cores)) then
      RAISE pkg_error.ex_must_be_int;
    end if;
  
    update gpu_chip
       set gpu_name = new_gpu_name,
           foundry  = new_foundry,
           directx  = new_directx,
           fp16     = new_fp16,
           fp64     = new_fp64,
           int32    = new_int32,
           pt_cores = new_pt_cores
     where gpu_chip_id = p_gpu_chip_id;
  
  exception
    when pkg_error.ex_must_be_int then
      RAISE_APPLICATION_ERROR(pkg_error.ex_must_be_int_code,
                              'A sorok szama csak egesz szam lehet!');
    
    when NO_DATA_FOUND then
      RAISE pkg_error.ex_no_data;
      RAISE_APPLICATION_ERROR(pkg_error.ex_no_data_code, 'Nincs adat.');
    
    when others then
      RAISE pkg_error.ex_general;
      RAISE_APPLICATION_ERROR(pkg_error.ex_general_code, 'Hiba.');
  end;

  --delete
  procedure delete_gpu_chip(p_gpu_chip_id number) is
  begin
    delete from gpu_chip t where t.gpu_chip_id = p_gpu_chip_id;
  
  exception
    when NO_DATA_FOUND then
      RAISE pkg_error.ex_no_data;
      RAISE_APPLICATION_ERROR(pkg_error.ex_no_data_code, 'Nincs adat.');
    
    when others then
      RAISE pkg_error.ex_general;
      RAISE_APPLICATION_ERROR(pkg_error.ex_general_code, 'Hiba.');
  end;

  --show
  function show_gpu_chip(p_gpu_chip_id number default null)
    return ty_gpu_chip_l is
    v_list ty_gpu_chip_l;
  begin
  
    if p_gpu_chip_id is null then
    
      SELECT ty_gpu_chip(t.gpu_chip_id,
                         t.gpu_name,
                         t.foundry,
                         t.directx,
                         t.fp16,
                         t.fp64,
                         t.int32,
                         t.pt_cores)
        BULK COLLECT
        INTO v_list
        from gpu_chip t;
    
    else
      SELECT ty_gpu_chip(t.gpu_chip_id,
                         t.gpu_name,
                         t.foundry,
                         t.directx,
                         t.fp16,
                         t.fp64,
                         t.int32,
                         t.pt_cores)
        BULK COLLECT
        INTO v_list
        from gpu_chip t
       where t.gpu_chip_id = p_gpu_chip_id;
    end if;
  
    return v_list;
  
  exception
  
    when NO_DATA_FOUND then
      RAISE pkg_error.ex_no_data;
      RAISE_APPLICATION_ERROR(pkg_error.ex_no_data_code, 'Nincs adat.');
    
    when others then
      RAISE pkg_error.ex_general;
      RAISE_APPLICATION_ERROR(pkg_error.ex_general_code, 'Hiba.');
  end;

BEGIN
  null;
END;
/
