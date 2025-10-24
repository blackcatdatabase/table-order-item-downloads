-- Auto-generated from schema-views-mysql.psd1 (map@mtime:2025-10-24T09:19:46Z)
-- engine: mysql
-- table:  order_item_downloads
-- Contract view for [order_item_downloads]
-- Hides download_token_hash.
CREATE OR REPLACE VIEW vw_order_item_downloads AS
SELECT
  id,
  order_id,
  book_id,
  asset_id,
  token_key_version,
  key_version,
  max_uses,
  used,
  expires_at,
  last_used_at,
  ip_hash,
  ip_hash_key_version
FROM order_item_downloads;
