-- Auto-generated from schema-map-mysql.psd1 (map@mtime:2025-11-27T15:13:14Z)
-- engine: mysql
-- table:  order_item_downloads

CREATE UNIQUE INDEX ux_oid_tenant_triplet ON order_item_downloads (tenant_id, order_id, book_id, asset_id);

CREATE INDEX idx_oid_tenant_expires_active ON order_item_downloads (tenant_id, expires_at, is_active);
