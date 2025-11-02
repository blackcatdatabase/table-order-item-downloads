-- Auto-generated from schema-views-mysql.psd1 (map@db2f8b8)
-- engine: mysql
-- table:  order_item_downloads
-- Contract view for [order_item_downloads]
-- Hides download_token_hash; adds usage helpers and HEX for ip_hash.
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_order_item_downloads AS
SELECT
  id,
  order_id,
  book_id,
  asset_id,
  token_key_version,
  key_version,
  max_uses,
  used,
  GREATEST(0, COALESCE(max_uses,0) - COALESCE(used,0)) AS uses_left,
  ((GREATEST(0, COALESCE(max_uses,0) - COALESCE(used,0)) > 0) AND (expires_at IS NULL OR expires_at > NOW())) AS is_valid,
  expires_at,
  last_used_at,
  ip_hash,
  CAST(LPAD(HEX(ip_hash), 64, '0')  AS CHAR(64)) AS ip_hash_hex,
  ip_hash_key_version,
  CAST(LPAD(HEX(download_token_hash), 64, '0')  AS CHAR(64)) AS download_token_hash_hex
FROM order_item_downloads;
