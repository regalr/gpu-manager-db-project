create or replace view vw_gpu (gpu, foundry, directx_version, fp16, fp64, int32, pt_cores) as
  select g.gpu_name, m.man_name, g.directx, g.fp16, g.fp64, g.int32, g.pt_cores from gpu_chip g
  left join manufacturer m on m.man_id = foundry;
