ALTER TABLE graphics_card
  ADD CONSTRAINT graphics_card_pk PRIMARY KEY (graphics_card_id);

ALTER TABLE memory_chip
  ADD CONSTRAINT memory_chip_pk PRIMARY KEY (memory_chip_id);

ALTER TABLE manufacturer
  ADD CONSTRAINT manufacturer_pk PRIMARY KEY (man_id);

ALTER TABLE mem_type
  ADD CONSTRAINT mem_type_pk PRIMARY KEY (mem_id);

ALTER TABLE gpu_chip
  ADD CONSTRAINT gpu_chip_pk PRIMARY KEY (gpu_chip_id);

ALTER TABLE vendor
  ADD CONSTRAINT vendor_pk PRIMARY KEY (vendor_id);

ALTER TABLE shipment
  ADD CONSTRAINT shipment_pk PRIMARY KEY (shipment_id);
