create or replace package pkg_shipment is
  
  procedure add_shipment(p_vendor_id number,
                         p_graphics_card_id number,
                         p_quantity number,
                         p_price_per_unit number);
                                             
  procedure update_shipment(p_shipment_id number, p_vendor_id number default null,
                                                  p_graphics_card_id number default null,
                                                  p_quantity number default null,
                                                  p_shipment_date date default null,
                                                  p_price_per_unit number default null,
                                                  p_manufacturing_cost number default null);
  
  procedure delete_shipment(p_shipment_id number);
  
  function show_shipment(p_shipment_id number default null) return ty_shipment_l;
  
end pkg_shipment;
/
CREATE OR REPLACE PACKAGE BODY pkg_shipment IS

  --add
    procedure add_shipment(p_vendor_id number,
                           p_graphics_card_id number,
                           p_quantity number,
                           p_price_per_unit number) is
    cost number;
  begin
    select distinct g.manufacturing_cost into cost from shipment s
        left join graphics_card g
        on g.graphics_card_id = s.graphics_card_id
        where s.graphics_card_id = p_graphics_card_id;
        
    insert into shipment (shipment_id,
                          vendor_id,
                          graphics_card_id,
                          quantity,
                          shipment_date,
                          price_per_unit,
                          manufacturing_cost)

            values (null,p_vendor_id,
                         p_graphics_card_id,
                         p_quantity,
                         to_date(sysdate, 'dd-mm-yyyy'),
                         p_price_per_unit,
                         cost);
    
    exception     
      when NO_DATA_FOUND then
        RAISE pkg_error.ex_no_data;
        RAISE_APPLICATION_ERROR( pkg_error.ex_no_data_code, 'Nincs adat.');
       
      when others then
        RAISE pkg_error.ex_general;
        RAISE_APPLICATION_ERROR( pkg_error.ex_general_code, 'Hiba.');
  end;
  
 
  
  
  --update
  procedure update_shipment(p_shipment_id number, p_vendor_id number default null,
                                                  p_graphics_card_id number default null,
                                                  p_quantity number default null,
                                                  p_shipment_date date default null,
                                                  p_price_per_unit number default null,
                                                  p_manufacturing_cost number default null) is
    new_vendor_id number;
    new_graphics_card_id number;
    new_quantity number;
    new_shipment_date date;
    new_price_per_unit number;
    new_manufacturing_cost number;

  begin
    new_vendor_id := p_vendor_id;
    new_graphics_card_id := p_graphics_card_id;
    new_quantity := p_quantity;
    new_shipment_date := p_shipment_date;
    new_price_per_unit := p_price_per_unit;
    new_manufacturing_cost := p_manufacturing_cost;
    
    if new_vendor_id is null then
           select t.vendor_id into new_vendor_id
           from shipment t
           where t.shipment_id = p_shipment_id;
    end if;
    if new_graphics_card_id is null then
           select t.graphics_card_id into new_graphics_card_id 
           from shipment t
           where t.shipment_id = p_shipment_id;
    end if;
    if new_quantity is null then
           select t.quantity into new_quantity
           from shipment t
           where t.shipment_id = p_shipment_id;
    end if;
    if new_shipment_date is null then
           select t.shipment_date into new_shipment_date
           from shipment t
           where t.shipment_id = p_shipment_id;
    end if;
    if new_price_per_unit is null then
           select t.price_per_unit into new_price_per_unit 
           from shipment t
           where t.shipment_id = p_shipment_id;
    end if;
    if new_manufacturing_cost is null then
           select t.manufacturing_cost into new_manufacturing_cost
           from shipment t
           where t.shipment_id = p_shipment_id;
    end if;

    
    update shipment
           set vendor_id = new_vendor_id,
               graphics_card_id = new_graphics_card_id,
               quantity = new_quantity,
               shipment_date = new_shipment_date,
               price_per_unit = new_price_per_unit,
               manufacturing_cost = new_manufacturing_cost
    where shipment_id = p_shipment_id;
    
    
    
    exception     
      when NO_DATA_FOUND then
        RAISE pkg_error.ex_no_data;
        RAISE_APPLICATION_ERROR( pkg_error.ex_no_data_code, 'Nincs adat.');
       
      when others then
        RAISE pkg_error.ex_general;
        RAISE_APPLICATION_ERROR( pkg_error.ex_general_code, 'Hiba.');
  end;
  
  --delete
  procedure delete_shipment(p_shipment_id number) is
  begin
    delete from shipment t where t.shipment_id = p_shipment_id;
    
    exception     
      when NO_DATA_FOUND then
        RAISE pkg_error.ex_no_data;
        RAISE_APPLICATION_ERROR( pkg_error.ex_no_data_code, 'Nincs adat.');
       
      when others then
        RAISE pkg_error.ex_general;
        RAISE_APPLICATION_ERROR( pkg_error.ex_general_code, 'Hiba.');
  end;
  
  
  --show
  function show_shipment(p_shipment_id number default null) return ty_shipment_l is
    v_list ty_shipment_l;
  begin
    
    if p_shipment_id is null then
    
        SELECT ty_shipment(t.shipment_id,
                           t.vendor_id,
                           t.graphics_card_id,
                           t.quantity,
                           t.shipment_date,
                           t.price_per_unit,
                           t.manufacturing_cost)
        BULK COLLECT
        INTO v_list
        from shipment t;
    else
        SELECT ty_shipment(t.shipment_id,
                           t.vendor_id,
                           t.graphics_card_id,
                           t.quantity,
                           t.shipment_date,
                           t.price_per_unit,
                           t.manufacturing_cost)
        BULK COLLECT
        INTO v_list
        from shipment t
        where t.shipment_id = p_shipment_id;
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
