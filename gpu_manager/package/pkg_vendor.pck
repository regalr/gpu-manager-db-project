create or replace package pkg_vendor is
  
  procedure add_vendor(p_vendor_name varchar2,
                         p_country varchar2);
                                             
  procedure update_vendor(p_vendor_id number, p_vendor_name varchar2 default null,
                         p_country varchar2 default null);
  
  procedure delete_vendor(p_vendor_id number);
  
  function show_vendor(p_vendor_id number default null) return ty_vendor_l;
  
end pkg_vendor;
/
CREATE OR REPLACE PACKAGE BODY pkg_vendor IS

  --add
    procedure add_vendor(p_vendor_name varchar2,
                         p_country varchar2) is
  begin
    insert into vendor (vendor_id,
                             vendor_name,
                             country)

            values (null,p_vendor_name,
                         p_country);
    
    exception     
      when NO_DATA_FOUND then
        RAISE pkg_error.ex_no_data;
        RAISE_APPLICATION_ERROR( pkg_error.ex_no_data_code, 'Nincs adat.');
       
      when others then
        RAISE pkg_error.ex_general;
        RAISE_APPLICATION_ERROR( pkg_error.ex_general_code, 'Hiba.');
  end;
  
 
  
  
  --update
  procedure update_vendor(p_vendor_id number, p_vendor_name varchar2 default null,
                         p_country varchar2 default null) is
    new_vendor_name varchar2(20);
    new_country varchar2(20);
  begin
    
    new_vendor_name := p_vendor_name;
    new_country := p_country;
    
    if new_vendor_name is null then
           select t.vendor_name into new_vendor_name 
           from vendor t
           where t.vendor_id = p_vendor_id;
    end if;
    if new_country is null then
           select t.country into new_country 
           from vendor t
           where t.vendor_id = p_vendor_id;
    end if;

    
    update vendor
           set vendor_name = new_vendor_name,
               country = new_country
    where vendor_id = p_vendor_id;
    
    
    
    exception     
      when NO_DATA_FOUND then
        RAISE pkg_error.ex_no_data;
        RAISE_APPLICATION_ERROR( pkg_error.ex_no_data_code, 'Nincs adat.');
       
      when others then
        RAISE pkg_error.ex_general;
        RAISE_APPLICATION_ERROR( pkg_error.ex_general_code, 'Hiba.');
  end;
  
  --delete
  procedure delete_vendor(p_vendor_id number) is
  begin
    delete from vendor t where t.vendor_id = p_vendor_id;
    
    exception     
      when NO_DATA_FOUND then
        RAISE pkg_error.ex_no_data;
        RAISE_APPLICATION_ERROR( pkg_error.ex_no_data_code, 'Nincs adat.');
       
      when others then
        RAISE pkg_error.ex_general;
        RAISE_APPLICATION_ERROR( pkg_error.ex_general_code, 'Hiba.');
  end;
  
  
  --show
  function show_vendor(p_vendor_id number default null) return ty_vendor_l is
    v_list ty_vendor_l;
  begin
    
    if p_vendor_id is null then
    
        SELECT ty_vendor(t.vendor_id,
                          t.vendor_name,
                          t.country)
        BULK COLLECT
        INTO v_list
        from vendor t;
    
    else
        SELECT ty_vendor(t.vendor_id,
                          t.vendor_name,
                          t.country)
        BULK COLLECT
        INTO v_list
        from vendor t
        where t.vendor_id = p_vendor_id;
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
