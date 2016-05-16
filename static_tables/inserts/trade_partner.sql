-- INSERT BRAZIL

INSERT INTO stat_ybtrade_partner (year, bra_id, wld_id, trade_balance, export_val, weight_value_export, import_val, weight_value_import, top_municipality_export, municipality_export, top_municipality_import, municipality_import, top_export_product, top_export_product_value, top_import_product, top_import_product_value, product_higher_trade_balance, product_higher_value, product_lower_trade_balance, product_lower_value)
SELECT year, 0, wld_id, export_val - import_val as trade_balance, export_val, export_val / export_kg, import_val, import_val / import_kg,
(SELECT bra_id from dataviva.secex_ymbw where year = '2014' and month = '0' and bra_id_len = 9 and wld_id = dataviva.secex_ymw.wld_id order by export_val desc limit 1) as Top_municipality_export_to,
(SELECT export_val from dataviva.secex_ymbw where year = '2014' and month = '0' and bra_id_len = 9 and wld_id = dataviva.secex_ymw.wld_id order by export_val desc limit 1) as Top_municipality_export_value,
(SELECT bra_id from dataviva.secex_ymbw where year = '2014' and month = '0' and bra_id_len = 9 and wld_id = dataviva.secex_ymw.wld_id order by import_val desc limit 1) as Top_municipality_import_to,
(SELECT import_val from dataviva.secex_ymbw where year = '2014' and month = '0' and bra_id_len = 9 and wld_id = dataviva.secex_ymw.wld_id order by import_val desc limit 1) as Top_municipality_import_value,
(SELECT hs_id from dataviva.secex_ympw where year = '2014' and month = '0' and hs_id_len = 6 and wld_id = dataviva.secex_ymw.wld_id order by export_val desc limit 1) as Top_product_export,
(SELECT export_val from dataviva.secex_ympw where year = '2014' and month = '0' and hs_id_len = 6 and wld_id = dataviva.secex_ymw.wld_id order by export_val desc limit 1) as Top_product_export_value,
(SELECT hs_id from dataviva.secex_ympw where year = '2014' and month = '0' and hs_id_len = 6 and wld_id = dataviva.secex_ymw.wld_id order by import_val desc limit 1) as Top_product_import,
(SELECT import_val from dataviva.secex_ympw where year = '2014' and month = '0' and hs_id_len = 6 and wld_id = dataviva.secex_ymw.wld_id order by import_val desc limit 1) as Top_product_import_value,
(SELECT hs_id from dataviva.secex_ympw where year = '2014' and month = '0' and hs_id_len = 6 and wld_id = dataviva.secex_ymw.wld_id order by CASE WHEN export_val is null THEN 0 ELSE export_val END - CASE WHEN import_val is null THEN 0 ELSE import_val END desc limit 1) as Top_product_balance,
(SELECT CASE WHEN export_val is null THEN 0 ELSE export_val END - CASE WHEN import_val is null THEN 0 ELSE import_val END as trade_balance from dataviva.secex_ympw a INNER JOIN dataviva.attrs_hs b ON a.hs_id = b.id where year = '2014' and month = '0' and hs_id_len = 6 and wld_id = dataviva.secex_ymw.wld_id order by trade_balance desc limit 1) as Top_product_balance_value,
(SELECT hs_id from dataviva.secex_ympw where year = '2014' and month = '0' and hs_id_len = 6 and wld_id = dataviva.secex_ymw.wld_id order by CASE WHEN export_val is null THEN 0 ELSE export_val END - CASE WHEN import_val is null THEN 0 ELSE import_val END asc limit 1) as Min_product_balance,
(SELECT CASE WHEN export_val is null THEN 0 ELSE export_val END - CASE WHEN import_val is null THEN 0 ELSE import_val END as trade_balance from dataviva.secex_ympw a INNER JOIN dataviva.attrs_hs b ON a.hs_id = b.id where year = '2014' and month = '0' and hs_id_len = 6 and wld_id = dataviva.secex_ymw.wld_id order by trade_balance asc limit 1) as Min_product_balance_value
from dataviva.secex_ymw where year = '2014' and month = '0';

-- INSERT LOCATIONS

INSERT INTO stat_ybtrade_partner (year, bra_id, wld_id, trade_balance, export_val, weight_value_export, import_val, weight_value_import, top_municipality_export, municipality_export, top_municipality_import, municipality_import, top_export_product, top_export_product_value, top_import_product, top_import_product_value, product_higher_trade_balance, product_higher_value, product_lower_trade_balance, product_lower_value)
SELECT year, bra_id as Location, wld_id as World, export_val - import_val as trade_balance, export_val, export_val / export_kg, import_val, import_val / import_kg,
CASE WHEN dataviva.secex_ymbw.bra_id_len = 9 THEN null ELSE (SELECT bra_id from dataviva.secex_ymbw where year = '2014' and month = '0' and bra_id_len = 9 and wld_id = World and bra_id like concat(Location, '%') order by export_val desc limit 1) END as Top_municipality_export_to,
CASE WHEN dataviva.secex_ymbw.bra_id_len = 9 THEN null ELSE (SELECT export_val from dataviva.secex_ymbw where year = '2014' and month = '0' and bra_id_len = 9 and wld_id = World and bra_id like concat(Location, '%') order by export_val desc limit 1) END as Top_municipality_export_value,
CASE WHEN dataviva.secex_ymbw.bra_id_len = 9 THEN null ELSE (SELECT bra_id from dataviva.secex_ymbw where year = '2014' and month = '0' and bra_id_len = 9 and wld_id = World and bra_id like concat(Location, '%') order by import_val desc limit 1) END as Top_municipality_import_to,
CASE WHEN dataviva.secex_ymbw.bra_id_len = 9 THEN null ELSE (SELECT import_val from dataviva.secex_ymbw where year = '2014' and month = '0' and bra_id_len = 9 and wld_id = World and bra_id like concat(Location, '%') order by import_val desc limit 1) END as Top_municipality_import_value,
(SELECT hs_id from dataviva.secex_ymbpw where year = '2014' and month = '0' and hs_id_len = 6 and wld_id = World and bra_id like concat(Location, '%') order by export_val desc limit 1) as Top_product_export,
(SELECT export_val from dataviva.secex_ymbpw where year = '2014' and month = '0' and hs_id_len = 6 and wld_id = World and bra_id like concat(Location, '%') order by export_val desc limit 1) as Top_product_export_value,
(SELECT hs_id from dataviva.secex_ymbpw where year = '2014' and month = '0' and hs_id_len = 6 and wld_id = World and bra_id like concat(Location, '%') order by import_val desc limit 1) as Top_product_import,
(SELECT import_val from dataviva.secex_ymbpw where year = '2014' and month = '0' and hs_id_len = 6 and wld_id = World and bra_id like concat(Location, '%') order by import_val desc limit 1) as Top_product_import_value,
(SELECT hs_id from dataviva.secex_ymbpw where year = '2014' and month = '0' and hs_id_len = 6 and wld_id = World and bra_id like concat(Location, '%') order by CASE WHEN export_val is null THEN 0 ELSE export_val END - CASE WHEN import_val is null THEN 0 ELSE import_val END desc limit 1) as Top_product_balance,
(SELECT CASE WHEN export_val is null THEN 0 ELSE export_val END - CASE WHEN import_val is null THEN 0 ELSE import_val END as trade_balance from dataviva.secex_ymbpw where year = '2014' and month = '0' and hs_id_len = 6 and wld_id = World and bra_id like concat(Location, '%') order by trade_balance desc limit 1) as Top_product_balance_value,
(SELECT hs_id from dataviva.secex_ympw where year = '2014' and month = '0' and hs_id_len = 6 and wld_id = World and bra_id like concat(Location, '%') order by CASE WHEN export_val is null THEN 0 ELSE export_val END - CASE WHEN import_val is null THEN 0 ELSE import_val END asc limit 1) as Min_product_balance,
(SELECT CASE WHEN export_val is null THEN 0 ELSE export_val END - CASE WHEN import_val is null THEN 0 ELSE import_val END as trade_balance from dataviva.secex_ymbpw where year = '2014' and month = '0' and hs_id_len = 6 and wld_id = World and bra_id like concat(Location, '%') order by trade_balance asc limit 1) as Min_product_balance_value
from dataviva.secex_ymbw where year = '2014' and month = '0' and bra_id not like '0%';