-- Auto-generated from schema-map-postgres.psd1 (map@62c9c93)
-- engine: postgres
-- table:  order_item_downloads
CREATE UNIQUE INDEX IF NOT EXISTS ux_oid_tenant_triplet ON order_item_downloads (tenant_id, order_id, book_id, asset_id);

CREATE INDEX IF NOT EXISTS idx_oid_tenant_expires_active ON order_item_downloads (tenant_id, expires_at) WHERE used < max_uses;

CREATE INDEX IF NOT EXISTS idx_oid_download_token_hash ON order_item_downloads (download_token_hash);
