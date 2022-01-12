ALTER TABLE graphics_card
  ADD CONSTRAINT graphics_card_mem_clock_0 CHECK ( mem_clock >= 0);
  
ALTER TABLE graphics_card
  ADD CONSTRAINT graphics_card_base_clock_0 CHECK ( base_clock >= 0);
  
ALTER TABLE graphics_card
  ADD CONSTRAINT graphics_card_boost_clock_0 CHECK ( boost_clock >= 0);
