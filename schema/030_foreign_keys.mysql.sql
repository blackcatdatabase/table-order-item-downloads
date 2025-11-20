-- Auto-generated from schema-map-mysql.psd1 (map@734a489)
-- engine: mysql
-- table:  order_item_downloads
ALTER TABLE order_item_downloads ADD CONSTRAINT fk_oid_tenant FOREIGN KEY (tenant_id) REFERENCES tenants(id) ON DELETE RESTRICT;

ALTER TABLE order_item_downloads ADD CONSTRAINT fk_oid_order FOREIGN KEY (tenant_id, order_id) REFERENCES orders(tenant_id, id) ON DELETE CASCADE;

ALTER TABLE order_item_downloads ADD CONSTRAINT fk_oid_book FOREIGN KEY (tenant_id, book_id) REFERENCES books(tenant_id, id) ON DELETE CASCADE;

ALTER TABLE order_item_downloads ADD CONSTRAINT fk_oid_asset FOREIGN KEY (tenant_id, asset_id) REFERENCES book_assets(tenant_id, id) ON DELETE CASCADE;

ALTER TABLE order_item_downloads ADD CONSTRAINT chk_oid_uses CHECK (max_uses > 0 AND used >= 0 AND used <= max_uses);
