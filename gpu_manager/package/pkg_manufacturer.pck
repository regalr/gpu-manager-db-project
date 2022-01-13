create or replace package pkg_manufacturer is

  procedure add_manufacturer(p_man_name varchar2,
                             p_country  varchar2,
                             p_founded  date);

  procedure update_manufacturer(p_man_id   number,
                                p_man_name varchar2 default null,
                                p_country  varchar2 default null,
                                p_founded  date default null);

  procedure delete_manufacturer(p_man_id number);

  function show_manufacturer(p_man_id number default null)
    return ty_manufacturer_l;

end pkg_manufacturer;
/
CREATE OR REPLACE PACKAGE BODY pkg_manufacturer IS

  --add
  procedure add_manufacturer(p_man_name varchar2,
                             p_country  varchar2,
                             p_founded  date) is
  begin
    insert into manufacturer
      (man_id, man_name, country, founded)
    
    values
      (null, p_man_name, p_country, p_founded);
  
  exception
    when NO_DATA_FOUND then
      RAISE pkg_error.ex_no_data;
      RAISE_APPLICATION_ERROR(pkg_error.ex_no_data_code, 'Nincs adat.');
    
    when others then
      RAISE pkg_error.ex_general;
      RAISE_APPLICATION_ERROR(pkg_error.ex_general_code, 'Hiba.');
  end;

  --update
  procedure update_manufacturer(p_man_id   number,
                                p_man_name varchar2 default null,
                                p_country  varchar2 default null,
                                p_founded  date default null) is
    new_man_name varchar2(20);
    new_country  varchar2(20);
    new_founded  date;
  begin
  
    select nvl(p_man_name, man_name)
      into new_man_name
      from manufacturer s
     where s.man_id = p_man_id;
  
    select nvl(p_country, country)
      into new_country
      from manufacturer s
     where s.man_id = p_man_id;
  
    select nvl(p_founded, founded)
      into new_founded
      from manufacturer s
     where s.man_id = p_man_id;
  
    update manufacturer
       set man_name = new_man_name,
           country  = new_country,
           founded  = new_founded
     where man_id = p_man_id;
  
  exception
    when NO_DATA_FOUND then
      RAISE pkg_error.ex_no_data;
      RAISE_APPLICATION_ERROR(pkg_error.ex_no_data_code, 'Nincs adat.');
    
    when others then
      RAISE pkg_error.ex_general;
      RAISE_APPLICATION_ERROR(pkg_error.ex_general_code, 'Hiba.');
  end;

  --delete
  procedure delete_manufacturer(p_man_id number) is
  begin
    delete from manufacturer t where t.man_id = p_man_id;
  
  exception
    when NO_DATA_FOUND then
      RAISE pkg_error.ex_no_data;
      RAISE_APPLICATION_ERROR(pkg_error.ex_no_data_code, 'Nincs adat.');
    
    when others then
      RAISE pkg_error.ex_general;
      RAISE_APPLICATION_ERROR(pkg_error.ex_general_code, 'Hiba.');
  end;

  --show
  function show_manufacturer(p_man_id number default null)
    return ty_manufacturer_l is
    v_list ty_manufacturer_l;
  begin
  
    if p_man_id is null then
    
      SELECT ty_manufacturer(t.man_id, t.man_name, t.country, t.founded)
        BULK COLLECT
        INTO v_list
        from manufacturer t;
    
    else
      SELECT ty_manufacturer(t.man_id, t.man_name, t.country, t.founded)
        BULK COLLECT
        INTO v_list
        from manufacturer t
       where t.man_id = p_man_id;
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
