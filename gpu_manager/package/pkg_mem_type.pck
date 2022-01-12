create or replace package pkg_mem_type is
  
  procedure add_mem_type(p_mem_name VARCHAR2);
  
  procedure update_mem_type(p_mem_id number, p_mem_name varchar2 default null);
  
  procedure delete_mem_type(p_mem_id number);
  
  function show_mem_type(p_mem_id number default null) return ty_mem_type_l;
  
end pkg_mem_type;
/
CREATE OR REPLACE PACKAGE BODY pkg_mem_type IS


  --add
  procedure add_mem_type(p_mem_name VARCHAR2) is
  begin
    insert into mem_type(mem_name) values (p_mem_name);
    
    
    
    exception     
      when NO_DATA_FOUND then
        RAISE pkg_error.ex_no_data;
        RAISE_APPLICATION_ERROR( pkg_error.ex_no_data_code, 'Nincs adat.');
       
      when others then
        RAISE pkg_error.ex_general;
        RAISE_APPLICATION_ERROR( pkg_error.ex_general_code, 'Hiba.');
  end;
  
  --update
  procedure update_mem_type(p_mem_id number, p_mem_name varchar2 default null) is
    new_mem_name varchar2(10);
  begin
    
    new_mem_name := p_mem_name;
    
    
    if p_mem_name is null then
           select t.mem_name into new_mem_name 
           from mem_type t
           where t.mem_id = p_mem_id;
    end if;
    
    
    update mem_type
           set mem_name = new_mem_name
    where mem_id = p_mem_id;
    
    
    exception     
      when NO_DATA_FOUND then
        RAISE pkg_error.ex_no_data;
        RAISE_APPLICATION_ERROR( pkg_error.ex_no_data_code, 'Nincs adat.');
       
      when others then
        RAISE pkg_error.ex_general;
        RAISE_APPLICATION_ERROR( pkg_error.ex_general_code, 'Hiba.');
  end;
  
  --delete
  procedure delete_mem_type(p_mem_id number) is
  begin
    delete from mem_type t where t.mem_id = p_mem_id;
    
    exception     
      when NO_DATA_FOUND then
        RAISE pkg_error.ex_no_data;
        RAISE_APPLICATION_ERROR( pkg_error.ex_no_data_code, 'Nincs adat.');
       
      when others then
        RAISE pkg_error.ex_general;
        RAISE_APPLICATION_ERROR( pkg_error.ex_general_code, 'Hiba.');
  end;
  
  
  --show
  function show_mem_type(p_mem_id number default null) return ty_mem_type_l is
    v_list ty_mem_type_l;
  begin
    
    if p_mem_id is null then
    
        SELECT ty_mem_type(t.mem_id,
                          t.mem_name)
        BULK COLLECT
        INTO v_list
        from mem_type t;
    
    else
        SELECT ty_mem_type(t.mem_id,
                          t.mem_name)
        BULK COLLECT
        INTO v_list
        from mem_type t
        where t.mem_id = p_mem_id;
    end if;
    
   
    return v_list;
    
    
    exception     
      when NO_DATA_FOUND then
        RAISE pkg_error.ex_no_data;
        RAISE_APPLICATION_ERROR( pkg_error.ex_no_data_code, 'Nincs adat.');
       
      when others then
        RAISE pkg_error.ex_general;
        RAISE_APPLICATION_ERROR( pkg_error.ex_general_code, 'Hiba.');
  end;
  



BEGIN
  null;
END;
/
