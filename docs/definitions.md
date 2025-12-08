# order_item_downloads

Per-order download entitlements for digital items. UNIQUE (order_id, book_id, asset_id).

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| asset_id | BIGINT | NO |  | Asset (FK book_assets.id). |
| book_id | BIGINT | NO |  | Book (FK books.id). |
| download_token_hash | BINARY(32) | YES |  | Hashed download token (dedupe/lookup). |
| expires_at | DATETIME(6) | NO |  | Expiry timestamp (UTC). |
| id | BIGINT | NO |  | Surrogate primary key. |
| ip_hash | BINARY(32) | YES |  | Hashed IP of last usage. |
| ip_hash_key_version | VARCHAR(64) | YES |  | Key version for ip_hash. |
| key_version | VARCHAR(64) | YES |  | Content encryption key version. |
| last_used_at | DATETIME(6) | YES |  | Last download timestamp (UTC). |
| max_uses | INT | NO |  | Max allowed downloads. |
| order_id | BIGINT | NO |  | Order (FK orders.id). |
| token_key_version | VARCHAR(64) | YES |  | Key version used for download_token_hash. |
| used | INT | NO | 0 | Number of uses so far. |

## Engine Details

### mysql

Unique keys:
| Name | Columns |
| --- | --- |
| ux_oid_tenant_id | tenant_id, id |
| ux_oid_tenant_triplet | tenant_id, order_id, book_id, asset_id |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_oid_download_token_hash | download_token_hash | CREATE INDEX idx_oid_download_token_hash ON order_item_downloads (download_token_hash) |
| idx_oid_expires_at | expires_at | INDEX idx_oid_expires_at (expires_at) |
| idx_oid_tenant_expires_active | tenant_id,expires_at,is_active | CREATE INDEX idx_oid_tenant_expires_active ON order_item_downloads (tenant_id, expires_at, is_active) |
| idx_oid_tenant_order | tenant_id,order_id | INDEX idx_oid_tenant_order (tenant_id, order_id) |
| ux_oid_tenant_id | tenant_id,id | CREATE UNIQUE INDEX ux_oid_tenant_id ON order_item_downloads (tenant_id, id) |
| ux_oid_tenant_triplet | tenant_id,order_id,book_id,asset_id | CREATE UNIQUE INDEX ux_oid_tenant_triplet ON order_item_downloads (tenant_id, order_id, book_id, asset_id) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_oid_asset | tenant_id,asset_id | book_assets(tenant_id,id) | ON DELETE CASCADE |
| fk_oid_book | tenant_id,book_id | books(tenant_id,id) | ON DELETE CASCADE |
| fk_oid_order | tenant_id,order_id | orders(tenant_id,id) | ON DELETE CASCADE |
| fk_oid_tenant | tenant_id | tenants(id) | ON DELETE RESTRICT |

### postgres

Unique keys:
| Name | Columns |
| --- | --- |
| ux_oid_tenant_id | tenant_id, id |
| ux_oid_tenant_triplet | tenant_id, order_id, book_id, asset_id |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_oid_download_token_hash | download_token_hash | CREATE INDEX IF NOT EXISTS idx_oid_download_token_hash ON order_item_downloads (download_token_hash) |
| idx_oid_expires_at | expires_at | CREATE INDEX IF NOT EXISTS idx_oid_expires_at ON order_item_downloads (expires_at) |
| idx_oid_tenant_expires_active | tenant_id,expires_at,is_active | CREATE INDEX IF NOT EXISTS idx_oid_tenant_expires_active ON order_item_downloads (tenant_id, expires_at, is_active) WHERE used < max_uses |
| idx_oid_tenant_order | tenant_id,order_id | CREATE INDEX IF NOT EXISTS idx_oid_tenant_order ON order_item_downloads (tenant_id, order_id) |
| ux_oid_tenant_id | tenant_id,id | CREATE UNIQUE INDEX IF NOT EXISTS ux_oid_tenant_id ON order_item_downloads (tenant_id, id) |
| ux_oid_tenant_triplet | tenant_id,order_id,book_id,asset_id | CREATE UNIQUE INDEX IF NOT EXISTS ux_oid_tenant_triplet ON order_item_downloads (tenant_id, order_id, book_id, asset_id) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_oid_asset | tenant_id,asset_id | book_assets(tenant_id,id) | ON DELETE CASCADE |
| fk_oid_book | tenant_id,book_id | books(tenant_id,id) | ON DELETE CASCADE |
| fk_oid_order | tenant_id,order_id | orders(tenant_id,id) | ON DELETE CASCADE |
| fk_oid_tenant | tenant_id | tenants(id) | ON DELETE RESTRICT |

## Engine differences

## Views
| View | Engine | Flags | File |
| --- | --- | --- | --- |
| vw_order_item_downloads | mysql | algorithm=MERGE, security=INVOKER | [schema\040_views.mysql.sql](schema\040_views.mysql.sql) |
| vw_order_item_downloads | postgres |  | [schema\040_views.postgres.sql](schema\040_views.postgres.sql) |
