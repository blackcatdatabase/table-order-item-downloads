# Definition – order_item_downloads

Per-order download entitlements for digital items.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT UNSIGNED | — | — | Surrogate primary key. |  |
| order_id | BIGINT UNSIGNED | NO | — | Order (FK orders.id). |  |
| book_id | BIGINT UNSIGNED | NO | — | Book (FK books.id). |  |
| asset_id | BIGINT UNSIGNED | NO | — | Asset (FK book_assets.id). |  |
| download_token_hash | BINARY(32) | YES | — | Hashed download token. | PII: hashed |
| token_key_version | VARCHAR(64) | YES | — | Key version used for download_token_hash. |  |
| key_version | VARCHAR(64) | YES | — | Content encryption key version. |  |
| max_uses | INT | NO | — | Max allowed downloads. |  |
| used | INT | NO | 0 | Number of uses so far. |  |
| expires_at | DATETIME(6) | NO | — | Expiry timestamp (UTC). |  |
| last_used_at | DATETIME(6) | YES | — | Last download timestamp (UTC). |  |
| ip_hash | BINARY(32) | YES | — | Hashed IP of last usage. | PII: hashed |
| ip_hash_key_version | VARCHAR(64) | YES | — | Key version for ip_hash. |  |
