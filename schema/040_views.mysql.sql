-- Auto-generated from schema-views-mysql.psd1 (map@38d5403)
-- engine: mysql
-- table:  order_item_downloads
-- Contract view for [order_item_downloads]
-- Hides download_token_hash; adds usage helpers and HEX for ip_hash.
CREATE OR REPLACE SQL SECURITY INVOKER VIEW vw_order_item_downloads AS
SELECT
  id,
  order_id,
  book_id,
  asset_id,
  token_key_version,
  key_version,
  max_uses,
  used,
  GREATEST(max_uses - used, 0) AS uses_left,
  (used < max_uses AND (expires_at IS NULL OR expires_at > NOW())) AS is_valid,
  expires_at,
  last_used_at,
  ip_hash,
  HEX(ip_hash) AS ip_hash_hex,
  ip_hash_key_version
FROM order_item_downloads;
