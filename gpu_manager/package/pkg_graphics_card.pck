create or replace package pkg_graphics_card is
  
  procedure add_graphics_card(p_graphics_card_name varchar2,
                         p_gpu_chip number,
                         p_first_release date,
                         p_mem_size number,
                         p_mem_id number,
                         p_mem_int_width number,
                         p_mem_clock number,
                         p_base_clock number,
                         p_boost_clock number,
                         p_manufacturing_cost number);
                                             
  procedure update_graphics_card(p_graphics_card_id number,
                         p_graphics_card_name varchar2 default null,
                         p_gpu_chip number default null,
                         p_first_release date default null,
                         p_mem_size number default null,
                         p_mem_id number default null,
                         p_mem_int_width number default null,
                         p_mem_clock number default null,
                         p_base_clock number default null,
                         p_boost_clock number default null,
                         p_manufacturing_cost number default null);
  
  procedure delete_graphics_card(p_graphics_card_id number);
  
  function show_graphics_card(p_graphics_card_id number default null) return ty_graphics_card_l;
  
end pkg_graphics_card;
/
CREATE OR REPLACE PACKAGE BODY pkg_graphics_card IS

  --add
    procedure add_graphics_card(p_graphics_card_name varchar2,
                         p_gpu_chip number,
                         p_first_release date,
                         p_mem_size number,
                         p_mem_id number,
                         p_mem_int_width number,
                         p_mem_clock number,
                         p_base_clock number,
                         p_boost_clock number,
                         p_manufacturing_cost number) is
    is_compatible number;
  begin
    
    is_compatible := pkg_functions.memory_compatibility(p_mem_size,p_mem_int_width);
    
    if (is_compatible = 0) then
      RAISE pkg_error.ex_incompatible_mem;
    end if;
    
    insert into graphics_card(graphics_card_id,
                              graphics_card_name,
                              gpu_chip,
                              first_release,
                              mem_size,
                              mem_id,
                              mem_int_width,
                              mem_clock,
                              base_clock,
                              boost_clock,
                              manufacturing_cost)

            values (null,     p_graphics_card_name,
                              p_gpu_chip,
                              p_first_release,
                              p_mem_size,
                              p_mem_id,
                              p_mem_int_width,
                              p_mem_clock,
                              p_base_clock,
                              p_boost_clock,
                              p_manufacturing_cost);
    
    exception     
      when pkg_error.ex_incompatible_mem then
          RAISE_APPLICATION_ERROR( pkg_error.ex_incompatible_mem_code, 'Helytelen memoria konfiguracio!');
          
      when NO_DATA_FOUND then
        RAISE pkg_error.ex_no_data;
        RAISE_APPLICATION_ERROR( pkg_error.ex_no_data_code, 'Nincs adat.');
       
      when others then
        RAISE pkg_error.ex_general;
        RAISE_APPLICATION_ERROR( pkg_error.ex_general_code, 'Hiba.');
  end;
  
 
  
  
  --update
  procedure update_graphics_card(p_graphics_card_id number,
                         p_graphics_card_name varchar2 default null,
                         p_gpu_chip number default null,
                         p_first_release date default null,
                         p_mem_size number default null,
                         p_mem_id number default null,
                         p_mem_int_width number default null,
                         p_mem_clock number default null,
                         p_base_clock number default null,
                         p_boost_clock number default null,
                         p_manufacturing_cost number default null) is
    new_graphics_card_name varchar2(30);
    new_gpu_chip number;
    new_first_release date;
    new_mem_size number;
    new_mem_id number;
    new_mem_int_width number;
    new_mem_clock number;
    new_base_clock number;
    new_boost_clock number;
    new_manufacturing_cost number;
    
    is_compatible number;
  begin
        
    new_graphics_card_name := p_graphics_card_name ;
    new_gpu_chip := p_gpu_chip;
    new_first_release := p_first_release;
    new_mem_size := p_mem_size;
    new_mem_id := p_mem_id;
    new_mem_int_width := p_mem_int_width;
    new_mem_clock := p_mem_clock;
    new_base_clock := p_base_clock;
    new_boost_clock := p_boost_clock;
    new_manufacturing_cost := p_manufacturing_cost;
    
    if new_graphics_card_name is null then
           select t.graphics_card_name into new_graphics_card_name 
           from graphics_card t
           where t.graphics_card_id = p_graphics_card_id;
    end if;
    if new_gpu_chip is null then
           select t.gpu_chip into new_gpu_chip 
           from graphics_card t
           where t.graphics_card_id = p_graphics_card_id;
    end if;
    if new_first_release is null then
           select t.first_release into new_first_release 
           from graphics_card t
           where t.graphics_card_id = p_graphics_card_id;
    end if;
    if new_mem_size is null then
           select t.mem_size into new_mem_size 
           from graphics_card t
           where t.graphics_card_id = p_graphics_card_id;
    end if;
    if new_mem_id is null then
           select t.mem_id into new_mem_id 
           from graphics_card t
           where t.graphics_card_id = p_graphics_card_id;
    end if;
    if new_mem_int_width is null then
           select t.mem_int_width into new_mem_int_width 
           from graphics_card t
           where t.graphics_card_id = p_graphics_card_id;
    end if;
    if new_mem_clock is null then
           select t.mem_clock into new_mem_clock 
           from graphics_card t
           where t.graphics_card_id = p_graphics_card_id;
    end if;
    if new_base_clock is null then
           select t.base_clock into new_base_clock 
           from graphics_card t
           where t.graphics_card_id = p_graphics_card_id;
    end if;
    if new_boost_clock is null then
           select t.boost_clock into new_boost_clock 
           from graphics_card t
           where t.graphics_card_id = p_graphics_card_id;
    end if;
    if new_manufacturing_cost is null then
           select t.manufacturing_cost into new_manufacturing_cost 
           from graphics_card t
           where t.graphics_card_id = p_graphics_card_id;
    end if;
   
    is_compatible := pkg_functions.memory_compatibility(new_mem_size,new_mem_int_width);
    
    if (is_compatible = 0) then
      RAISE pkg_error.ex_incompatible_mem;
    end if;

    update graphics_card
           set 
              graphics_card_name = new_graphics_card_name
              ,GPU_CHIP = new_GPU_CHIP
              ,FIRST_RELEASE = new_FIRST_RELEASE
              ,MEM_SIZE = new_MEM_SIZE
              ,MEM_ID = new_MEM_ID
              ,MEM_INT_WIDTH = new_MEM_INT_WIDTH
              ,MEM_CLOCK = new_MEM_CLOCK
              ,BASE_CLOCK = new_BASE_CLOCK
              ,BOOST_CLOCK = new_BOOST_CLOCK
              ,MANUFACTURING_COST = new_MANUFACTURING_COST
    where graphics_card_id = p_graphics_card_id;
    
    
    
    exception     
      when pkg_error.ex_incompatible_mem then
        RAISE_APPLICATION_ERROR( pkg_error.ex_incompatible_mem_code, 'Helytelen memoria konfiguracio!');
          
      when NO_DATA_FOUND then
        RAISE pkg_error.ex_no_data;
        RAISE_APPLICATION_ERROR( pkg_error.ex_no_data_code, 'Nincs adat.');
       
      when others then
        RAISE pkg_error.ex_general;
        RAISE_APPLICATION_ERROR( pkg_error.ex_general_code, 'Hiba.');
  end;
  
  --delete
  procedure delete_graphics_card(p_graphics_card_id number) is
  begin
    delete from graphics_card t where t.graphics_card_id = p_graphics_card_id;
    
    exception     
      when NO_DATA_FOUND then
        RAISE pkg_error.ex_no_data;
        RAISE_APPLICATION_ERROR( pkg_error.ex_no_data_code, 'Nincs adat.');
       
      when others then
        RAISE pkg_error.ex_general;
        RAISE_APPLICATION_ERROR( pkg_error.ex_general_code, 'Hiba.');
  end;
  
  
  --show
  function show_graphics_card(p_graphics_card_id number default null) return ty_graphics_card_l is
    v_list ty_graphics_card_l;
  begin
    
    if p_graphics_card_id is null then
    
        SELECT ty_graphics_card(t.graphics_card_id,
                          t.graphics_card_name,
                          t.gpu_chip,
                          t.first_release,
                          t.mem_size,
                          t.mem_id,
                          t.mem_int_width,
                          t.mem_clock,
                          t.base_clock,
                          t.boost_clock,
                          t.manufacturing_cost)
        BULK COLLECT
        INTO v_list
        from graphics_card t;
    
    else
        SELECT ty_graphics_card(t.graphics_card_id,
                          t.graphics_card_name,
                          t.gpu_chip,
                          t.first_release,
                          t.mem_size,
                          t.mem_id,
                          t.mem_int_width,
                          t.mem_clock,
                          t.base_clock,
                          t.boost_clock,
                          t.manufacturing_cost)
        BULK COLLECT
        INTO v_list
        from graphics_card t
        where t.graphics_card_id = p_graphics_card_id;
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
