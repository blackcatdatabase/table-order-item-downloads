-- Auto-generated from schema-map.psd1 (map@1e83bb6)
-- table: order_item_downloads
CREATE TABLE IF NOT EXISTS order_item_downloads (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  order_id BIGINT UNSIGNED NOT NULL,
  book_id BIGINT UNSIGNED NOT NULL,
  asset_id BIGINT UNSIGNED NOT NULL,
  download_token_hash BINARY(32) NULL,
  token_key_version VARCHAR(64) NULL,
  key_version VARCHAR(64) NULL,
  max_uses INT NOT NULL,
  used INT NOT NULL DEFAULT 0,
  expires_at DATETIME(6) NOT NULL,
  last_used_at DATETIME(6) NULL,
  ip_hash BINARY(32) NULL,
  ip_hash_key_version VARCHAR(64) NULL,
  INDEX idx_oid_download_token_hash (download_token_hash)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
