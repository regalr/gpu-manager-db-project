create or replace package pkg_memory_manufacturer is
  
  procedure add_memory_manufacturer(p_man_name varchar2,
                                     p_country varchar2,
                                     p_founded date);
                                             
  procedure update_memory_manufacturer(p_mem_man_id number,  p_man_name varchar2 default null,
                                                             p_country varchar2 default null,
                                                             p_founded date default null);
  
  procedure delete_memory_manufacturer(p_mem_man_id number);
  
  function show_memory_manufacturer(p_mem_man_id number default null) return ty_memory_manufacturer_l;
  
end pkg_memory_manufacturer;
/
CREATE OR REPLACE PACKAGE BODY pkg_memory_manufacturer IS

  --add
    procedure add_memory_manufacturer(p_man_name varchar2,
                         p_country varchar2,
                         p_founded date) is
  begin
    insert into memory_manufacturer (mem_man_id,man_name,country,founded)

            values (null,p_man_name,
                         p_country,
                         p_founded);
    
    exception     
      when NO_DATA_FOUND then
        RAISE pkg_error.ex_no_data;
        RAISE_APPLICATION_ERROR( pkg_error.ex_no_data_code, 'Nincs adat.');
       
      when others then
        RAISE pkg_error.ex_general;
        RAISE_APPLICATION_ERROR( pkg_error.ex_general_code, 'Hiba.');
  end;
  
 
  
  
  --update
  procedure update_memory_manufacturer(p_mem_man_id number, p_man_name varchar2 default null,
                                                           p_country varchar2 default null,
                                                           p_founded date default null) is
    new_man_name varchar2(20);
    new_country varchar2(20);
    new_founded date;
  begin
    
    new_man_name := p_man_name;
    new_country := p_country;
    new_founded := p_founded;
    
    if p_man_name is null then
           select t.man_name into new_man_name 
           from memory_manufacturer t
           where t.mem_man_id = p_mem_man_id;
    end if;
    if p_country is null then
           select t.country into new_country 
           from memory_manufacturer t
           where t.mem_man_id = p_mem_man_id;
    end if;
    if p_founded is null then
           select t.founded into new_founded 
           from memory_manufacturer t
           where t.mem_man_id = p_mem_man_id;
    end if;

    
    update memory_manufacturer
           set man_name = new_man_name,
               country = new_country,
               founded = new_founded
    where mem_man_id = p_mem_man_id;
    
    
    
    exception     
      when NO_DATA_FOUND then
        RAISE pkg_error.ex_no_data;
        RAISE_APPLICATION_ERROR( pkg_error.ex_no_data_code, 'Nincs adat.');
       
      when others then
        RAISE pkg_error.ex_general;
        RAISE_APPLICATION_ERROR( pkg_error.ex_general_code, 'Hiba.');
  end;
  
  --delete
  procedure delete_memory_manufacturer(p_mem_man_id number) is
  begin
    delete from memory_manufacturer t where t.mem_man_id = p_mem_man_id;
    
    exception     
      when NO_DATA_FOUND then
        RAISE pkg_error.ex_no_data;
        RAISE_APPLICATION_ERROR( pkg_error.ex_no_data_code, 'Nincs adat.');
       
      when others then
        RAISE pkg_error.ex_general;
        RAISE_APPLICATION_ERROR( pkg_error.ex_general_code, 'Hiba.');
  end;
  
  
  --show
  function show_memory_manufacturer(p_mem_man_id number default null) return ty_memory_manufacturer_l is
    v_list ty_memory_manufacturer_l;
  begin
    
    if p_mem_man_id is null then
    
        SELECT ty_memory_manufacturer(t.mem_man_id,
                          t.man_name,
                          t.country,
                          t.founded)
        BULK COLLECT
        INTO v_list
        from memory_manufacturer t;
    
    else
         SELECT ty_memory_manufacturer(t.mem_man_id,
                          t.man_name,
                          t.country,
                          t.founded)
        BULK COLLECT
        INTO v_list
        from memory_manufacturer t
        where t.mem_man_id = p_mem_man_id;
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
