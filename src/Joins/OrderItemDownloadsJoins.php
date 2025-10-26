<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\OrderItemDownloads\Joins;

/**
 * Metody generované z cizích klíčů.
 *
 * Vracená struktura: [string $sqlJoinFragment, array $params]
 * Politika JOINů:
 *   - -JoinPolicy left  => vždy LEFT JOIN (výchozí)
 *   - -JoinPolicy all   => INNER JOIN, pokud VŠECHNY lokální FK sloupce jsou NOT NULL
 *   - -JoinPolicy any   => INNER JOIN, pokud ALESPOŇ JEDEN lokální FK sloupec je NOT NULL
 */
final class OrderItemDownloadsJoins {

    /** @internal Stručná kontrola SQL aliasu (ochrana proti nesmyslným vstupům). */
    private function assertAlias(string $s): string {
        if (!preg_match('/^[A-Za-z_][A-Za-z0-9_]*$/', $s)) {
            throw new \InvalidArgumentException("Invalid SQL alias: {$s}");
        }
        return $s;
    }

    /** @internal Ověří oba aliasy a že se neshodují. */
    private function assertAliasPair(string $alias, string $as): array {
        $alias = $this->assertAlias($alias);
        $as    = $this->assertAlias($as);
        if ($alias === $as) {
            throw new \InvalidArgumentException("Join alias must differ from base alias: {$alias}");
        }
        return [$alias, $as];
    }


    /**
     * FK: order_item_downloads -> orders
     * LEFT JOIN vw_orders AS $as ON $as.id = $alias.order_id
     * @return array{0:string,1:array}
     */
    public function joinOrders(string $alias = 't', string $as = 'j0'): array {
        [$alias, $as] = $this->assertAliasPair($alias, $as);
        return [' LEFT JOIN vw_orders AS ' . $as . ' ON ' . $as . '.id = ' . $alias . '.order_id' . ' ', []];
    }
    /**
     * FK: order_item_downloads -> books
     * LEFT JOIN vw_books AS $as ON $as.id = $alias.book_id
     * @return array{0:string,1:array}
     */
    public function joinBooks(string $alias = 't', string $as = 'j1'): array {
        [$alias, $as] = $this->assertAliasPair($alias, $as);
        return [' LEFT JOIN vw_books AS ' . $as . ' ON ' . $as . '.id = ' . $alias . '.book_id' . ' ', []];
    }
    /**
     * FK: order_item_downloads -> book_assets
     * LEFT JOIN vw_book_assets AS $as ON $as.id = $alias.asset_id
     * @return array{0:string,1:array}
     */
    public function joinBookAssets(string $alias = 't', string $as = 'j2'): array {
        [$alias, $as] = $this->assertAliasPair($alias, $as);
        return [' LEFT JOIN vw_book_assets AS ' . $as . ' ON ' . $as . '.id = ' . $alias . '.asset_id' . ' ', []];
    }

}
