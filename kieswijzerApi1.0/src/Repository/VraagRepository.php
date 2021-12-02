<?php

namespace App\Repository;

use App\Entity\Vraag;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Vraag|null find($id, $lockMode = null, $lockVersion = null)
 * @method Vraag|null findOneBy(array $criteria, array $orderBy = null)
 * @method Vraag[]    findAll()
 * @method Vraag[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class VraagRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Vraag::class);
    }

    // /**
    //  * @return Vraag[] Returns an array of Vraag objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('v')
            ->andWhere('v.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('v.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Vraag
    {
        return $this->createQueryBuilder('v')
            ->andWhere('v.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
