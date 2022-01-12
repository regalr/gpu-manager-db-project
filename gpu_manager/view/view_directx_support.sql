create or replace view vw_directx_support (graphics_card, directx_version) as
  select gc.graphics_card_name, gp.directx from graphics_card gc
  left join gpu_chip gp on gc.gpu_chip = gp.gpu_chip_id; 
