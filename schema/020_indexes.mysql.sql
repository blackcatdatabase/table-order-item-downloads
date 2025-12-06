-- Auto-generated from schema-map-mysql.yaml (map@sha1:5E62933580349BE7C623D119AC9D1301A62F03EF)
-- engine: mysql
-- table:  order_item_downloads

CREATE UNIQUE INDEX ux_oid_tenant_triplet ON order_item_downloads (tenant_id, order_id, book_id, asset_id);

CREATE INDEX idx_oid_tenant_expires_active ON order_item_downloads (tenant_id, expires_at, is_active);

CREATE INDEX idx_oid_download_token_hash ON order_item_downloads (download_token_hash);

CREATE UNIQUE INDEX ux_oid_tenant_id ON order_item_downloads (tenant_id, id);
