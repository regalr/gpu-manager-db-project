create or replace package pkg_functions is

       function memory_compatibility( p_mem_size number, p_mem_int_width number) return number;
       
       function most_profitable_card( p_number_of_rows number default 1) return ty_card_profit_l;

end pkg_functions;
/
create or replace package body pkg_functions is

--- mem compatibility
  function memory_compatibility( p_mem_size number, p_mem_int_width number) return number is 
     response number;
     fraction number;
     width     number;


    begin
      
      if (p_mem_size <= 0) then
        RAISE pkg_error.ex_mem_size;
      end if;

      
      width := p_mem_int_width/32;
     
      if (width != round(width) or p_mem_int_width <= 0) then
        RAISE pkg_error.ex_int_width;
      end if;
      
      
      fraction := (p_mem_int_width/16)/p_mem_size;

      if (round(fraction) = fraction) then
        response := 1;
      else
        response := 0;
      end if;

      
      return response;
      
      
      exception
        when pkg_error.ex_int_width then
          RAISE_APPLICATION_ERROR( pkg_error.ex_int_width_code, 'Helytelen memoria interfesz szelesseg!');
        when pkg_error.ex_mem_size then
          RAISE_APPLICATION_ERROR( pkg_error.ex_mem_size_code, 'Helytelen memoriameret!');
          
        when NO_DATA_FOUND then
          RAISE pkg_error.ex_no_data;
          RAISE_APPLICATION_ERROR( pkg_error.ex_no_data_code, 'Nincs adat.');
       
        when others then
          RAISE pkg_error.ex_general;
          RAISE_APPLICATION_ERROR( pkg_error.ex_general_code, 'Hiba.');
    end;
    
--- most profit
      function most_profitable_card( p_number_of_rows number default 1) return ty_card_profit_l 
      is
         v_list ty_card_profit_l;
      begin
        


        SELECT ty_card_profit(t.graphics_card,
                            t.total)
          BULK COLLECT
          INTO v_list
          from (
              select distinct s.graphics_card, 
                            SUM(s.profit) over (partition by s.graphics_card) as total 
              from vw_shipments s
              order by total DESC) t
          where rownum <= p_number_of_rows;
          
          
                


        FOR i IN 1 .. v_list.count
        LOOP
          dbms_output.put_line(v_list(i).card_name ||
                               ', $' || v_list(i).profit);
        END LOOP;

        return v_list;


      end;


begin
  null;
end pkg_functions;
/
