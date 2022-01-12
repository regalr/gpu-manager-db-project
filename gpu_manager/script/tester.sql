--tester

begin
   pkg_gpu_chip.add_gpu_chip(p_gpu_name => 'test',
                                 p_foundry  => 1,
                                 p_directx  => 9,
                                 p_fp16     => 32,
                                 p_fp64     => 64,
                                 p_int32    => 128,
                                 p_pt_cores => null);
end;


begin
   pkg_gpu_chip.update_gpu_chip(7, 'GU-30');
end;


begin
   pkg_gpu_chip.delete_gpu_chip(700);
end;


select pkg_gpu_chip.show_gpu_chip from dual;


---

begin
   pkg_graphics_card.add_graphics_card(p_graphics_card_name => 'Test',
                                       p_gpu_chip           => 1,
                                       p_first_release      => sysdate,
                                       p_mem_size           => 8,
                                       p_mem_id             => 2,
                                       p_mem_int_width      => 256,
                                       p_mem_clock          => 1000,
                                       p_base_clock         => 2000,
                                       p_boost_clock        => 3000,
                                       p_manufacturing_cost => 500);
end;

begin
   pkg_graphics_card.update_graphics_card(10, 'Chromatic 999');
end;

begin
   pkg_graphics_card.delete_graphics_card(10);
end;

select pkg_graphics_card.show_gpu_chip from dual;

---

begin
   pkg_mem_type.add_mem_type(p_mem_name => 'GDDR8');
end;

begin
   pkg_mem_type.update_mem_type(6, 'GDDR9');
end;

begin
   pkg_mem_type.delete_mem_type(6);
end;

select pkg_mem_type.show_mem_type(1) from dual;

---

begin
   pkg_memory_chip.add_memory_chip(p_manufacturer => 1,
                                   p_mem_type     => 1,
                                   p_mem_name     => 'MEM2022');
end;

begin
   pkg_memory_chip.update_memory_chip(9, null, null, 'MEM2023');
end;

begin
   pkg_memory_chip.delete_memory_chip(9);
end;

select pkg_memory_chip.show_memory_chip from dual;

---


begin
   pkg_memory_manufacturer.add_memory_manufacturer(p_man_name => 'MemoFacturer',
                                                   p_country  => 'USA',
                                                   p_founded  => sysdate);
end;

begin
   pkg_memory_manufacturer.update_memory_manufacturer(3, 'MemoryMaker');
end;

begin
   pkg_memory_manufacturer.delete_memory_manufacturer(3);
end;

select pkg_memory_manufacturer.show_memory_manufacturer from dual;

---


begin
   pkg_shipment.add_shipment(p_vendor_id        => 1,
                             p_graphics_card_id => 1,
                             p_quantity         => 10000,
                             p_price_per_unit   => 150);
end;

begin
   pkg_shipment.update_shipment(114, 2);
end;

begin
   pkg_shipment.delete_shipment(114);
end;

select pkg_shipment.show_shipment from dual;

---


begin
   pkg_vendor.add_vendor(p_vendor_name => 'Acer', p_country => 'Taiwan');
end;

begin
   pkg_vendor.update_vendor(6, 'Lenovo');
end;

begin
   pkg_vendor.delete_vendor(6);
end;

select pkg_vendor.show_vendor from dual;

---



select pkg_functions.memory_compatibility(8, 192) from dual;

select pkg_functions.memory_compatibility(8, 256) from dual;

select pkg_functions.most_profitable_card from dual;

select pkg_functions.most_profitable_card(5) from dual;
---
