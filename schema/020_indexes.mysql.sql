-- Auto-generated from schema-map-mysql.psd1 (map@c5e4097)
-- engine: mysql
-- table:  order_item_downloads
CREATE UNIQUE INDEX ux_oid_triplet ON order_item_downloads (order_id, book_id, asset_id);
