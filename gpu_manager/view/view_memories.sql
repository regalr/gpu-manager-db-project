create or replace view vw_memories (memory_name, memory_type, manufacturer) as
  select mc.mem_name, mt.mem_name, mm.man_name from memory_chip mc
  left join memory_manufacturer mm on mc.manufacturer = mm.mem_man_id
  left join mem_type mt on mt.mem_id = mc.mem_type;
