<?php

/*
 * This file is part of the API Platform project.
 *
 * (c) Kévin Dunglas <dunglas@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

declare(strict_types=1);

namespace ApiPlatform\Tests\Fixtures\TestBundle\Entity;

use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\Get;
use ApiPlatform\Metadata\Put;
use ApiPlatform\OpenApi\Model\Operation;
use ApiPlatform\OpenApi\Model\Response;
use Doctrine\ORM\Mapping as ORM;

/**
 * Book.
 *
 * @author Antoine Bluchet <soyuka@gmail.com>
 */
#[ApiResource(operations: [
    new Get(),
    new Get(uriTemplate: '/books/by_isbn/{isbn}{._format}', requirements: ['isbn' => '.+'], uriVariables: 'isbn'),
    new Put(status: 200,
        openapi: new Operation(
            responses: [
                '200' => new Response(
                    description: 'Custom response message'
                ),
                '400' => new Response(
                    description: 'quatrecent'
                )
            ],
            summary: 'Test summary',
        ),
    )
])]
#[ORM\Entity]
class Book
{
    #[ORM\Column(type: 'integer')]
    #[ORM\Id]
    #[ORM\GeneratedValue(strategy: 'AUTO')]
    private $id;
    #[ORM\Column]
    public $name;
    #[ORM\Column(unique: true)]
    public $isbn;

    public function getId()
    {
        return $this->id;
    }
}
