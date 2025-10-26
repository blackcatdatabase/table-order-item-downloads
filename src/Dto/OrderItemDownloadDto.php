<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\OrderItemDownloads\Dto;

/**
 * Jednoduché, neměnné DTO s veřejnými readonly vlastnostmi.
 * - Bez logiky; pouze nosič dat.
 * - Silné typy drží kontrakt napříč vrstvami.
 */
final class OrderItemDownloadDto {
    public function __construct(
        public readonly ?int $id,
        public readonly int $orderId,
        public readonly int $bookId,
        public readonly int $assetId,
        public readonly ?string $downloadTokenHash,
        public readonly ?string $tokenKeyVersion,
        public readonly ?string $keyVersion,
        public readonly int $maxUses,
        public readonly int $used,
        public readonly \DateTimeImmutable $expiresAt,
        public readonly ?\DateTimeImmutable $lastUsedAt,
        public readonly ?string $ipHash,
        public readonly ?string $ipHashKeyVersion
    ) {}

    /** Vhodné pro serializaci/logování (bez velkých blobů). */
    public function toArray(): array {
        return get_object_vars($this);
    }
}
