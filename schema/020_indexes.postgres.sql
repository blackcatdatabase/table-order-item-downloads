-- Auto-generated from schema-map-postgres.psd1 (map@9d3471b)
-- engine: postgres
-- table:  order_item_downloads
CREATE UNIQUE INDEX IF NOT EXISTS ux_oid_triplet ON order_item_downloads (order_id, book_id, asset_id);

CREATE INDEX IF NOT EXISTS idx_oid_download_token_hash ON order_item_downloads (download_token_hash);
