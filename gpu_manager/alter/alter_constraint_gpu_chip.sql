ALTER TABLE gpu_chip
  ADD CONSTRAINT gpu_chip_fp16_0 CHECK (fp16 >= 0);
  
ALTER TABLE gpu_chip
  ADD CONSTRAINT gpu_chip_fp16_1 CHECK ( fp16 = TRUNC(fp16));
  
ALTER TABLE gpu_chip
  ADD CONSTRAINT gpu_chip_fp64_0 CHECK (fp64 >= 0);
  
ALTER TABLE gpu_chip
  ADD CONSTRAINT gpu_chip_fp64_1 CHECK ( fp64 = TRUNC(fp64));
  
ALTER TABLE gpu_chip
  ADD CONSTRAINT gpu_chip_int32_0 CHECK (int32 >= 0);
 
ALTER TABLE gpu_chip
  ADD CONSTRAINT gpu_chip_int32_1 CHECK ( int32 = TRUNC(int32));
