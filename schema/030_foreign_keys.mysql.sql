-- Auto-generated from schema-map-mysql.psd1 (map@db2f8b8)
-- engine: mysql
-- table:  order_item_downloads
ALTER TABLE order_item_downloads ADD CONSTRAINT fk_oid_order FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE;

ALTER TABLE order_item_downloads ADD CONSTRAINT fk_oid_book FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE;

ALTER TABLE order_item_downloads ADD CONSTRAINT fk_oid_asset FOREIGN KEY (asset_id) REFERENCES book_assets(id) ON DELETE CASCADE;

ALTER TABLE order_item_downloads ADD CONSTRAINT chk_oid_uses CHECK (max_uses > 0 AND used >= 0 AND used <= max_uses);
