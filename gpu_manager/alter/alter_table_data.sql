

--vendor

insert into vendor (vendor_id,vendor_name,country)
values (1, 'Asus', 'Taiwan');
insert into vendor (vendor_id,vendor_name,country)
values (2, 'EVGA', 'USA');
insert into vendor (vendor_id,vendor_name,country)
values (3, 'Gigabyte', 'Taiwan');
insert into vendor (vendor_id,vendor_name,country)
values (4, 'Sapphire', 'Hongkong');
insert into vendor (vendor_id,vendor_name,country)
values (5, 'Zotac', 'Hongkong');

--mem_type

insert into mem_type (mem_id, mem_name) 
values (1, 'GDDR4');
insert into mem_type (mem_id, mem_name) 
values (2, 'GDDR5');
insert into mem_type (mem_id, mem_name) 
values (3, 'GDDR5X');
insert into mem_type (mem_id, mem_name) 
values (4, 'GDDR6');
insert into mem_type (mem_id, mem_name) 
values (5, 'GDDR6X');

--memory_manufacturer

insert into manufacturer (man_id,man_name,country,founded)
values(1, 'Samsung', 'South-Korea', to_date('01-03-1938', 'dd-mm-yyyy'));
insert into manufacturer (man_id,man_name,country,founded)
values(2, 'TSMC', 'Taiwan', to_date('21-02-1987', 'dd-mm-yyyy'));

--gpu_chip

insert into gpu_chip (gpu_chip_id,gpu_name,foundry,directx,fp16,fp64,int32,pt_cores)
values (1, 'GU-11',1,10, 2048, 32, 1536, null );
insert into gpu_chip (gpu_chip_id,gpu_name,foundry,directx,fp16,fp64,int32,pt_cores)
values (2, 'GU-12', 1, 11, 3072, 48, 1792, null);
insert into gpu_chip (gpu_chip_id,gpu_name,foundry,directx,fp16,fp64,int32,pt_cores)
values (3, 'GU-20', 2, 11, 4096, 53, 2048, 512);
insert into gpu_chip (gpu_chip_id,gpu_name,foundry,directx,fp16,fp64,int32,pt_cores)
values (4, 'GU-21', 2, 12.2, 5120, 80, 3072, 712);
insert into gpu_chip (gpu_chip_id,gpu_name,foundry,directx,fp16,fp64,int32,pt_cores)
values (5, 'GU-22', 1, 12.2, 6144, 96, 3072, 1124);

--memory_chip

insert into memory_chip (memory_chip_id,manufacturer,mem_type,mem_name)
values (1,1,2,'S5L2018');
insert into memory_chip (memory_chip_id,manufacturer,mem_type,mem_name)
values (2,1,3,'S5X2019');
insert into memory_chip (memory_chip_id,manufacturer,mem_type,mem_name)
values (3,1,4,'S6L2020');
insert into memory_chip (memory_chip_id,manufacturer,mem_type,mem_name)
values (4,1,5,'S6X2020');
insert into memory_chip (memory_chip_id,manufacturer,mem_type,mem_name)
values (5,2,1,'TS4Y19');
insert into memory_chip (memory_chip_id,manufacturer,mem_type,mem_name)
values (6,2,2,'TS5Y20');
insert into memory_chip (memory_chip_id,manufacturer,mem_type,mem_name)
values (7,2,3,'TX5Y21');
insert into memory_chip (memory_chip_id,manufacturer,mem_type,mem_name)
values (8,2,5,'TX6Y22');


--graphics_card

insert into graphics_card (graphics_card_id,graphics_card_name,gpu_chip,first_release,
                           mem_size,mem_id,mem_int_width,mem_clock,base_clock,boost_clock,manufacturing_cost)
values (1, 'Chromatic 300', 1,  to_date('01-04-2020', 'dd-mm-yyyy'), 6, 5, 
                      192, 1010, 840, 880, 154);
                      
insert into graphics_card (graphics_card_id,graphics_card_name,gpu_chip,first_release,
                           mem_size,mem_id,mem_int_width,mem_clock,base_clock,boost_clock,manufacturing_cost)
values (2, 'Chromatic 310', 2,  to_date('09-05-2020', 'dd-mm-yyyy'), 6, 1, 
                      192, 1260, 870, 970, 145);
                      
insert into graphics_card (graphics_card_id,graphics_card_name,gpu_chip,first_release,
                           mem_size,mem_id,mem_int_width,mem_clock,base_clock,boost_clock,manufacturing_cost)
values (3, 'Chromatic 310X', 3,  to_date('05-07-2020', 'dd-mm-yyyy'), 8, 6, 
                      256, 1370, 910, 1050, 155);
                      
insert into graphics_card (graphics_card_id,graphics_card_name,gpu_chip,first_release,
                           mem_size,mem_id,mem_int_width,mem_clock,base_clock,boost_clock,manufacturing_cost)
values (4, 'Chromatic 400 PT', 3,  to_date('04-03-2021', 'dd-mm-yyyy'), 6, 1, 
                      192, 1180, 860, 990, 205);
                      
insert into graphics_card (graphics_card_id,graphics_card_name,gpu_chip,first_release,
                           mem_size,mem_id,mem_int_width,mem_clock,base_clock,boost_clock,manufacturing_cost)
values (5, 'Chromatic 410 PT', 4,  to_date('05-04-2021', 'dd-mm-yyyy'), 8, 7, 
                      256, 1380, 1150, 1350, 252);
                      
insert into graphics_card (graphics_card_id,graphics_card_name,gpu_chip,first_release,
                           mem_size,mem_id,mem_int_width,mem_clock,base_clock,boost_clock,manufacturing_cost)
values (6, 'Chromatic 410 PT 11G', 4,  to_date('01-05-2021', 'dd-mm-yyyy'), 11, 2, 
                      352, 1550, 1720, 1920, 275);
                      
insert into graphics_card (graphics_card_id,graphics_card_name,gpu_chip,first_release,
                           mem_size,mem_id,mem_int_width,mem_clock,base_clock,boost_clock,manufacturing_cost)
values (7, 'Chromatic 550 PT', 4,  to_date('01-01-2022', 'dd-mm-yyyy'), 16, 3, 
                      256, 1750, 1500, 1800, 302);
                      
insert into graphics_card (graphics_card_id,graphics_card_name,gpu_chip,first_release,
                           mem_size,mem_id,mem_int_width,mem_clock,base_clock,boost_clock,manufacturing_cost)
values (8, 'Chromatic 550X PT', 5,  to_date('02-01-2022', 'dd-mm-yyyy'), 20, 4, 
                      320, 2050, 1620, 2100, 563);
                      
insert into graphics_card (graphics_card_id,graphics_card_name,gpu_chip,first_release,
                           mem_size,mem_id,mem_int_width,mem_clock,base_clock,boost_clock,manufacturing_cost)
values (9, 'Chromatic 550X PT 24G', 5,  to_date('03-01-2022', 'dd-mm-yyyy'), 24, 8, 
                      384, 4750, 2320, 3290, 581);


--shipment


insert into shipment (shipment_id,vendor_id,graphics_card_id,quantity,shipment_date,price_per_unit,manufacturing_cost)
values(100, 1, 1, 25000, to_date('22-02-2018', 'dd-mm-yyyy'),130,105);
insert into shipment (shipment_id,vendor_id,graphics_card_id,quantity,shipment_date,price_per_unit,manufacturing_cost)
values(101, 2, 2, 30000, to_date('10-03-2019', 'dd-mm-yyyy'),156,110);
insert into shipment (shipment_id,vendor_id,graphics_card_id,quantity,shipment_date,price_per_unit,manufacturing_cost)
values(102, 5, 1,  6340, to_date('20-06-2019', 'dd-mm-yyyy'),131,104);
insert into shipment (shipment_id,vendor_id,graphics_card_id,quantity,shipment_date,price_per_unit,manufacturing_cost)
values(103, 3, 2, 25000, to_date('05-05-2020', 'dd-mm-yyyy'),256,145);
insert into shipment (shipment_id,vendor_id,graphics_card_id,quantity,shipment_date,price_per_unit,manufacturing_cost)
values(104, 2, 3,  2500, to_date('25-08-2020', 'dd-mm-yyyy'),110, 68);
insert into shipment (shipment_id,vendor_id,graphics_card_id,quantity,shipment_date,price_per_unit,manufacturing_cost)
values(105, 1, 4,  5362, to_date('01-03-2021', 'dd-mm-yyyy'),260,187);
insert into shipment (shipment_id,vendor_id,graphics_card_id,quantity,shipment_date,price_per_unit,manufacturing_cost)
values(106, 1, 3, 50000, to_date('20-05-2021', 'dd-mm-yyyy'),220,225);
insert into shipment (shipment_id,vendor_id,graphics_card_id,quantity,shipment_date,price_per_unit,manufacturing_cost)
values(107, 1, 4,  5800, to_date('18-07-2021', 'dd-mm-yyyy'),598,398);
insert into shipment (shipment_id,vendor_id,graphics_card_id,quantity,shipment_date,price_per_unit,manufacturing_cost)
values(108, 2, 5, 12500, to_date('27-09-2021', 'dd-mm-yyyy'),340,301);
insert into shipment (shipment_id,vendor_id,graphics_card_id,quantity,shipment_date,price_per_unit,manufacturing_cost)
values(109, 1, 6, 25000, to_date('02-01-2022', 'dd-mm-yyyy'),664,511);
insert into shipment (shipment_id,vendor_id,graphics_card_id,quantity,shipment_date,price_per_unit,manufacturing_cost)
values(110, 1, 7, 10000, to_date('03-01-2022', 'dd-mm-yyyy'),760,596);
insert into shipment (shipment_id,vendor_id,graphics_card_id,quantity,shipment_date,price_per_unit,manufacturing_cost)
values(111, 1, 8, 25000, to_date('03-01-2022', 'dd-mm-yyyy'),658,567);
insert into shipment (shipment_id,vendor_id,graphics_card_id,quantity,shipment_date,price_per_unit,manufacturing_cost)
values(112, 2, 9,  5500, to_date('03-01-2022', 'dd-mm-yyyy'),636,546);
insert into shipment (shipment_id,vendor_id,graphics_card_id,quantity,shipment_date,price_per_unit,manufacturing_cost)
values(113, 1, 9, 25000, to_date('04-01-2022', 'dd-mm-yyyy'),355,235);

commit;
