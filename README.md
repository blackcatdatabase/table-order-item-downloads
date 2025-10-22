# 📦 Order Item Downloads

![SQL](https://img.shields.io/badge/SQL-MySQL%208.0%2B-4479A1?logo=mysql&logoColor=white) ![License](https://img.shields.io/badge/license-BlackCat%20Proprietary-red) ![Status](https://img.shields.io/badge/status-stable-informational) ![Generated](https://img.shields.io/badge/generated-from%20schema--map-blue)

<!-- Auto-generated from schema-map.psd1 @ 6cefe8e (2025-10-22T20:27:41+02:00) -->

> Schema package for table **order_item_downloads** (repo: `order-item-downloads`).

## Files
```
schema/
  001_table.sql
  # (no deferred indexes declared in map)
  030_foreign_keys.sql
```

## Quick apply
```bash
# Apply schema (Linux/macOS):
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/001_table.sql
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/030_foreign_keys.sql
```

```powershell
# Apply schema (Windows PowerShell):
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/001_table.sql
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/030_foreign_keys.sql
```

## Docker quickstart
```bash
# Spin up a throwaway MySQL and apply just this package:
docker run --rm -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=app -p 3307:3306 -d mysql:8
sleep 15
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/001_table.sql
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/030_foreign_keys.sql
```

## Columns
| Column | Type | Null | Default | Extra |
|-------:|:-----|:----:|:--------|:------|
| id | BIGINT UNSIGNED | — | — | AUTO_INCREMENT, PK |
| order_id | BIGINT UNSIGNED | NO | — |  |
| book_id | BIGINT UNSIGNED | NO | — |  |
| asset_id | BIGINT UNSIGNED | NO | — |  |
| download_token_hash | BINARY(32) | YES | — |  |
| token_key_version | VARCHAR(64) | YES | — |  |
| key_version | VARCHAR(64) | YES | — |  |
| max_uses | INT | NO | — |  |
| used | INT | NO | 0 |  |
| expires_at | DATETIME(6) | NO | — |  |
| last_used_at | DATETIME(6) | YES | — |  |
| ip_hash | BINARY(32) | YES | — |  |
| ip_hash_key_version | VARCHAR(64) | YES | — |  |

## Relationships
- FK → **book_assets** via (asset_id) (ON DELETE CASCADE).
- FK → **books** via (book_id) (ON DELETE CASCADE).
- FK → **orders** via (order_id) (ON DELETE CASCADE).

```mermaid
erDiagram
  ORDER_ITEM_DOWNLOADS {
    INT id PK
    INT order_id
    INT book_id
    INT asset_id
    BLOB download_token_hash
    VARCHAR token_key_version
    VARCHAR key_version
    INT max_uses
    INT used
    DATETIME expires_at
    DATETIME last_used_at
    BLOB ip_hash
    VARCHAR ip_hash_key_version
  }
  ORDER_ITEM_DOWNLOADS }o--|| BOOK_ASSETS : "asset_id"
  ORDER_ITEM_DOWNLOADS }o--|| BOOKS : "book_id"
  ORDER_ITEM_DOWNLOADS }o--|| ORDERS : "order_id"
```

## Indexes
- No deferred indexes declared for this table.

## Notes
- Generated from the umbrella repository **blackcat-database** using `scripts/schema-map.psd1`.
- To change the schema, update the map and re-run the generators.

## License
Distributed under the **BlackCat Store Proprietary License v1.0**. See `LICENSE`.
