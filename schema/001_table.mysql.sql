-- Auto-generated from schema-map-mysql.psd1 (map@734a489)
-- engine: mysql
-- table:  order_item_downloads
CREATE TABLE IF NOT EXISTS order_item_downloads (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  tenant_id BIGINT UNSIGNED NOT NULL,
  order_id BIGINT UNSIGNED NOT NULL,
  book_id BIGINT UNSIGNED NOT NULL,
  asset_id BIGINT UNSIGNED NOT NULL,
  download_token_hash BINARY(32) NULL,
  token_key_version VARCHAR(64) NULL,
  key_version VARCHAR(64) NULL,
  max_uses INT NOT NULL,
  used INT NOT NULL DEFAULT 0,
  is_active TINYINT(1) GENERATED ALWAYS AS (used < max_uses) STORED,
  expires_at DATETIME(6) NOT NULL,
  last_used_at DATETIME(6) NULL,
  ip_hash BINARY(32) NULL,
  ip_hash_key_version VARCHAR(64) NULL,
  INDEX idx_oid_download_token_hash (download_token_hash),
  INDEX idx_oid_expires_at (expires_at),
  INDEX idx_oid_tenant_order (tenant_id, order_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
