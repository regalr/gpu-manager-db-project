create or replace view vw_graphics_card_gpu (gpu, graphics_card) as
  select gc.graphics_card_name, gp.gpu_name from gpu_chip gp
  left join graphics_card gc on gc.gpu_chip = gp.gpu_chip_id;
