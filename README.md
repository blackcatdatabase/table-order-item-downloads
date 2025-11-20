# 📦 Order Item Downloads

![SQL](https://img.shields.io/badge/SQL-MySQL%208.0%2B-4479A1?logo=mysql&logoColor=white) ![License](https://img.shields.io/badge/license-BlackCat%20Proprietary-red) ![Status](https://img.shields.io/badge/status-stable-informational) ![Generated](https://img.shields.io/badge/generated-from%20schema--map-blue)

<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->

> Schema package for table **order_item_downloads** (repo: `order-item-downloads`).

## Files
```
schema/
  001_table.sql
  020_indexes.sql
  030_foreign_keys.sql
```

## Quick apply
```bash
# Apply schema (Linux/macOS):
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/001_table.sql
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/020_indexes.sql
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/030_foreign_keys.sql
```

```powershell
# Apply schema (Windows PowerShell):
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/001_table.sql
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/020_indexes.sql
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/030_foreign_keys.sql
```

## Docker quickstart
```bash
# Spin up a throwaway MySQL and apply just this package:
docker run --rm -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=app -p 3307:3306 -d mysql:8
sleep 15
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/001_table.sql
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/020_indexes.sql
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/030_foreign_keys.sql
```

## Columns
| Column | Type | Null | Default | Extra |
|-------:|:-----|:----:|:--------|:------|
| id | BIGINT | — | AS | PK |
| tenant_id | BIGINT | NO | — |  |
| order_id | BIGINT | NO | — |  |
| book_id | BIGINT | NO | — |  |
| asset_id | BIGINT | NO | — |  |
| download_token_hash | BYTEA | YES | — |  |
| token_key_version | VARCHAR(64) | YES | — |  |
| key_version | VARCHAR(64) | YES | — |  |
| max_uses | INTEGER | NO | — |  |
| used | INTEGER | NO | 0 |  |
| is_active | BOOLEAN | — | — |  |
| expires_at | TIMESTAMPTZ(6) | NO | — |  |
| last_used_at | TIMESTAMPTZ(6) | YES | — |  |
| ip_hash | BYTEA | YES | — |  |
| ip_hash_key_version | VARCHAR(64) | YES | — |  |

## Relationships
- FK → **book_assets** via (tenant_id,asset_id) (ON DELETE CASCADE).
- FK → **books** via (tenant_id,book_id) (ON DELETE CASCADE).
- FK → **orders** via (tenant_id,order_id) (ON DELETE CASCADE).
- FK → **tenants** via (tenant_id) (ON DELETE RESTRICT).

```mermaid
erDiagram
  ORDER_ITEM_DOWNLOADS {
    INT id PK
    INT tenant_id
    INT order_id
    INT book_id
    INT asset_id
    BYTEA download_token_hash
    VARCHAR token_key_version
    VARCHAR key_version
    INTEGER max_uses
    INTEGER used
    BOOLEAN is_active
    TIMESTAMPTZ expires_at
    TIMESTAMPTZ last_used_at
    BYTEA ip_hash
    VARCHAR ip_hash_key_version
  }
  ORDER_ITEM_DOWNLOADS }o--|| BOOK_ASSETS : "tenant_id, asset_id"
  ORDER_ITEM_DOWNLOADS }o--|| BOOKS : "tenant_id, book_id"
  ORDER_ITEM_DOWNLOADS }o--|| ORDERS : "tenant_id, order_id"
  ORDER_ITEM_DOWNLOADS }o--|| TENANTS : "tenant_id"
```

## Indexes
- 3 deferred index statement(s) in schema/020_indexes.sql.

## Notes
- Generated from the umbrella repository **blackcat-database** using `scripts/schema-map.psd1`.
- To change the schema, update the map and re-run the generators.

## License
Distributed under the **BlackCat Store Proprietary License v1.0**. See `LICENSE`.
