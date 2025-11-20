<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->
# Definition – order_item_downloads

Per-order download entitlements for digital items. UNIQUE (order_id, book_id, asset_id).

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT | — | AS | Surrogate primary key. |  |
| tenant_id | BIGINT | NO | — |  |  |
| order_id | BIGINT | NO | — | Order (FK orders.id). |  |
| book_id | BIGINT | NO | — | Book (FK books.id). |  |
| asset_id | BIGINT | NO | — | Asset (FK book_assets.id). |  |
| download_token_hash | BYTEA | YES | — | Hashed download token (dedupe/lookup). | PII: hashed |
| token_key_version | VARCHAR(64) | YES | — | Key version used for download_token_hash. |  |
| key_version | VARCHAR(64) | YES | — | Content encryption key version. |  |
| max_uses | INTEGER | NO | — | Max allowed downloads. |  |
| used | INTEGER | NO | 0 | Number of uses so far. |  |
| is_active | BOOLEAN | — | — |  |  |
| expires_at | TIMESTAMPTZ(6) | NO | — | Expiry timestamp (UTC). |  |
| last_used_at | TIMESTAMPTZ(6) | YES | — | Last download timestamp (UTC). |  |
| ip_hash | BYTEA | YES | — | Hashed IP of last usage. | PII: hashed |
| ip_hash_key_version | VARCHAR(64) | YES | — | Key version for ip_hash. |  |