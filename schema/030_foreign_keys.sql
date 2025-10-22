-- Auto-generated from schema-map.psd1 (map@1e83bb6)
-- table: order_item_downloads
ALTER TABLE order_item_downloads ADD CONSTRAINT fk_oid_order FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE;

ALTER TABLE order_item_downloads ADD CONSTRAINT fk_oid_book FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE;

ALTER TABLE order_item_downloads ADD CONSTRAINT fk_oid_asset FOREIGN KEY (asset_id) REFERENCES book_assets(id) ON DELETE CASCADE;
