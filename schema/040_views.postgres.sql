-- Auto-generated from schema-views-postgres.psd1 (map@c5e4097)
-- engine: postgres
-- table:  order_item_downloads
-- Contract view for [order_item_downloads]
-- Hides download_token_hash; adds usage helpers & hex for ip_hash.
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
  GREATEST(0, COALESCE(max_uses,0) - COALESCE(used,0)) AS uses_left,
  CASE WHEN (GREATEST(0, COALESCE(max_uses,0) - COALESCE(used,0)) > 0
        AND (expires_at IS NULL OR expires_at > now())) THEN 1 ELSE 0 END AS is_valid,
  expires_at,
  last_used_at,
  ip_hash,
  encode(ip_hash, 'hex') AS ip_hash_hex,
  ip_hash_key_version,
  encode(download_token_hash, 'hex') AS download_token_hash_hex
FROM order_item_downloads;
