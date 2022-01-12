ALTER TABLE graphics_card
  ADD CONSTRAINT gpu_chip_graphics_card_fk FOREIGN KEY (gpu_chip) REFERENCES gpu_chip(gpu_chip_id);
  
ALTER TABLE graphics_card
  ADD CONSTRAINT mem_id_graphics_card_fk FOREIGN KEY (mem_id) REFERENCES memory_chip(memory_chip_id);
  
ALTER TABLE memory_chip
  ADD CONSTRAINT manufacturer_memory_chip_fk FOREIGN KEY (manufacturer) REFERENCES memory_manufacturer(mem_man_id);
  
ALTER TABLE memory_chip
  ADD CONSTRAINT mem_type_memory_chip_fk FOREIGN KEY (mem_type) REFERENCES mem_type(mem_id);
  
ALTER TABLE gpu_chip
  ADD CONSTRAINT manufacturer_gpu_chip_fk FOREIGN KEY (foundry) REFERENCES memory_manufacturer(mem_man_id);
  
ALTER TABLE shipment
  ADD CONSTRAINT vendor_id_shipment_fk FOREIGN KEY (vendor_id) REFERENCES vendor(vendor_id);
  
ALTER TABLE shipment
  ADD CONSTRAINT gpu_id_shipment_fk FOREIGN KEY (graphics_card_id) REFERENCES graphics_card(graphics_card_id);
