-- Auto-generated from schema-map-postgres.psd1 (map@mtime:2025-10-24T09:46:38Z)
-- engine: postgres
-- table:  order_item_downloads
CREATE INDEX idx_oid_download_token_hash ON order_item_downloads (download_token_hash);
