create or replace view vw_shipments (vendor, graphics_card, quantity, shipment_date, income, profit) as
  select v.vendor_name, g.graphics_card_name, 
         s.quantity, s.shipment_date,
         s.price_per_unit*s.quantity as income,
         (s.price_per_unit-s.manufacturing_cost)*s.quantity as profit from shipment s
  left join vendor v on v.vendor_id = s.vendor_id
  left join graphics_card g on g.graphics_card_id = s.graphics_card_id;
