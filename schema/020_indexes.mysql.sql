-- Auto-generated from schema-map-mysql.psd1 (map@38d5403)
-- engine: mysql
-- table:  order_item_downloads
CREATE UNIQUE INDEX ux_oid_triplet ON order_item_downloads (order_id, book_id, asset_id);
