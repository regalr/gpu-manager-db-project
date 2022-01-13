create or replace package pkg_memory_chip is

  procedure add_memory_chip(p_manufacturer number,
                            p_mem_type     number,
                            p_mem_name     varchar2);

  procedure update_memory_chip(p_memory_chip_id number,
                               p_manufacturer   number default null,
                               p_mem_type       number default null,
                               p_mem_name       varchar2 default null);

  procedure delete_memory_chip(p_memory_chip_id number);

  function show_memory_chip(p_memory_chip_id number default null)
    return ty_memory_chip_l;

end pkg_memory_chip;
/
CREATE OR REPLACE PACKAGE BODY pkg_memory_chip IS

  --add
  procedure add_memory_chip(p_manufacturer number,
                            p_mem_type     number,
                            p_mem_name     varchar2) is
  begin
    insert into memory_chip
      (memory_chip_id, manufacturer, mem_type, mem_name)
    
    values
      (null, p_manufacturer, p_mem_type, p_mem_name);
  
  exception
    when NO_DATA_FOUND then
      RAISE pkg_error.ex_no_data;
      RAISE_APPLICATION_ERROR(pkg_error.ex_no_data_code, 'Nincs adat.');
    
    when others then
      RAISE pkg_error.ex_general;
      RAISE_APPLICATION_ERROR(pkg_error.ex_general_code, 'Hiba.');
  end;

  --update
  procedure update_memory_chip(p_memory_chip_id number,
                               p_manufacturer   number default null,
                               p_mem_type       number default null,
                               p_mem_name       varchar2 default null) is
    new_manufacturer number;
    new_mem_type     number;
    new_mem_name     varchar2(10);
  begin
  
    select nvl(p_mem_type, mem_type)
      into new_mem_type
      from memory_chip s
     where s.memory_chip_id = p_memory_chip_id;
  
    select nvl(p_manufacturer, manufacturer)
      into new_manufacturer
      from memory_chip s
     where s.memory_chip_id = p_memory_chip_id;
  
    select nvl(p_mem_name, mem_name)
      into new_mem_name
      from memory_chip s
     where s.memory_chip_id = p_memory_chip_id;
  
    update memory_chip
       set manufacturer = new_manufacturer,
           mem_type     = new_mem_type,
           mem_name     = new_mem_name
     where memory_chip_id = p_memory_chip_id;
  
  exception
    when NO_DATA_FOUND then
      RAISE pkg_error.ex_no_data;
      RAISE_APPLICATION_ERROR(pkg_error.ex_no_data_code, 'Nincs adat.');
    
    when others then
      RAISE pkg_error.ex_general;
      RAISE_APPLICATION_ERROR(pkg_error.ex_general_code, 'Hiba.');
  end;

  --delete
  procedure delete_memory_chip(p_memory_chip_id number) is
  begin
    delete from memory_chip t where t.memory_chip_id = p_memory_chip_id;
  
  exception
    when NO_DATA_FOUND then
      RAISE pkg_error.ex_no_data;
      RAISE_APPLICATION_ERROR(pkg_error.ex_no_data_code, 'Nincs adat.');
    
    when others then
      RAISE pkg_error.ex_general;
      RAISE_APPLICATION_ERROR(pkg_error.ex_general_code, 'Hiba.');
  end;

  --show
  function show_memory_chip(p_memory_chip_id number default null)
    return ty_memory_chip_l is
    v_list ty_memory_chip_l;
  begin
  
    if p_memory_chip_id is null then
    
      SELECT ty_memory_chip(t.memory_chip_id,
                            t.manufacturer,
                            t.mem_type,
                            t.mem_name)
        BULK COLLECT
        INTO v_list
        from memory_chip t;
    
    else
      SELECT ty_memory_chip(t.memory_chip_id,
                            t.manufacturer,
                            t.mem_type,
                            t.mem_name)
        BULK COLLECT
        INTO v_list
        from memory_chip t
       where t.memory_chip_id = p_memory_chip_id;
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
