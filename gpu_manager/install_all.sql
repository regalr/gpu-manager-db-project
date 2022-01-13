szePROMPT Installing DB...

-- Install sequences
@./sequence/seq_gpu_chip.sql
@./sequence/seq_graphics_card.sql
@./sequence/seq_mem_seq.sql
@./sequence/seq_memory_chip.sql
@./sequence/seq_memory_manufacturer.sql
@./sequence/seq_shipment.sql
@./sequence/seq_vendor.sql
                     

-- Install tables
@./table/01_vendor_table.sql
@./table/01_shipment_table.sql
@./table/01_memory_manufacturer_table.sql
@./table/01_memory_chip_table.sql
@./table/01_mem_type_table.sql
@./table/01_graphics_card_table.sql
@./table/01_gpu_chip_table.sql

@./table/01_vendor_table_h.sql
@./table/01_shipment_table_h.sql
@./table/01_memory_manufacturer_table_h.sql
@./table/01_memory_chip_table_h.sql
@./table/01_mem_type_table_h.sql
@./table/01_graphics_card_table_h.sql
@./table/01_gpu_chip_table_h.sql

@./alter/alter_pk.sql

@./alter/alter_constraint_graphics_card.sql
@./alter/alter_constraint_gpu_chip.sql
@./alter/alter_constraint_shipment.sql


-- Install types
@./type/ty_card_profit.tps
@./type/ty_card_profit_l.tps

@./type/ty_sales_per_country.tps
@./type/ty_sales_per_country_l.tps

@./type/ty_mem_type.tps
@./type/ty_mem_type_l.tps
@./type/ty_gpu_chip.tps
@./type/ty_gpu_chip_l.tps
@./type/ty_graphics_card.tps
@./type/ty_graphics_card_l.tps
@./type/ty_memory_chip.tps
@./type/ty_memory_chip_l.tps
@./type/ty_memory_manufacturer.tps
@./type/ty_memory_manufacturer_l.tps
@./type/ty_shipment.tps
@./type/ty_shipment_l.tps
@./type/ty_vendor.tps
@./type/ty_vendor_l.tps

-- Views
@./view/view_directx_support.sql
@./view/view_gpu.sql
@./view/view_graphics_card_gpu.sql
@./view/view_memories.sql
@./view/view_reference_cards.sql
@./view/view_shipments.sql

-- Packages
@./package/pkg_error.pck
@./package/pkg_functions.pck
@./package/pkg_gpu_chip.pck
@./package/pkg_graphics_card.pck
@./package/pkg_memory_chip.pck
@./package/pkg_memory_manufacturer.pck
@./package/pkg_mem_type.pck
@./package/pkg_shipment.pck
@./package/pkg_vendor.pck

-- Triggers
@./trigger/trg_mem_type.trg
@./trigger/trg_mem_type_h.trg
@./trigger/trg_gpu_chip.trg
@./trigger/trg_gpu_chip_h.trg
@./trigger/trg_graphics_card.trg
@./trigger/trg_graphics_card_h.trg
@./trigger/trg_memory_chip.trg
@./trigger/trg_memory_chip_h.trg
@./trigger/trg_memory_manufacturer.trg
@./trigger/trg_memory_manufacturer_h.trg
@./trigger/trg_shipment.trg
@./trigger/trg_shipment_h.trg
@./trigger/trg_vendor.trg
@./trigger/trg_vendor_h.trg

-- Recompile schema
BEGIN
  dbms_utility.compile_schema(schema => 'GPU_MANAGER');
END;
/

-- FK

@./alter/alter_fk.sql


-- Tabla data

@./alter/alter_table_data.sql



PROMPT Done.
