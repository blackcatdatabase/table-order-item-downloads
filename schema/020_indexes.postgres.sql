-- Auto-generated from schema-map-postgres.yaml (map@sha1:8C4F2BC1C4D22EE71E27B5A7968C71E32D8D884D)
-- engine: postgres
-- table:  order_item_downloads

CREATE UNIQUE INDEX IF NOT EXISTS ux_oid_tenant_triplet ON order_item_downloads (tenant_id, order_id, book_id, asset_id);

CREATE INDEX IF NOT EXISTS idx_oid_tenant_expires_active ON order_item_downloads (tenant_id, expires_at, is_active) WHERE used < max_uses;

CREATE INDEX IF NOT EXISTS idx_oid_download_token_hash ON order_item_downloads (download_token_hash);

CREATE UNIQUE INDEX IF NOT EXISTS ux_oid_tenant_id ON order_item_downloads (tenant_id, id);

CREATE INDEX IF NOT EXISTS idx_oid_expires_at ON order_item_downloads (expires_at);

CREATE INDEX IF NOT EXISTS idx_oid_tenant_order ON order_item_downloads (tenant_id, order_id);
