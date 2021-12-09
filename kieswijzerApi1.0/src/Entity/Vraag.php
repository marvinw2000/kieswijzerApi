<?php

namespace App\Entity;

use App\Repository\VraagRepository;
use Doctrine\ORM\Mapping as ORM;
use JetBrains\PhpStorm\Internal\TentativeType;
use Symfony\Component\Serializer\SerializerInterface;

/**
 * @ORM\Entity(repositoryClass=VraagRepository::class)
 */
class Vraag implements \JsonSerializable
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $vraag;

    /**
     * @ORM\Column(type="boolean")
     */
    private $juisteAntwoord;

    /**
     * @ORM\Column(type="integer")
     */
    private $puntenIct;

    /**
     * @ORM\Column(type="integer")
     */
    private $puntenAenM;

    /**
     * @ORM\Column(type="integer")
     */
    private $puntenBenI;

    /**
     * @ORM\Column(type="integer")
     */
    private $puntenMei;

    /**
     * @ORM\Column(type="integer")
     */
    private $puntenTenI;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getVraag(): ?string
    {
        return $this->vraag;
    }

    public function setVraag(string $vraag): self
    {
        $this->vraag = $vraag;

        return $this;
    }

    public function getJuisteAntwoord(): ?bool
    {
        return $this->juisteAntwoord;
    }

    public function setJuisteAntwoord(bool $juisteAntwoord): self
    {
        $this->juisteAntwoord = $juisteAntwoord;

        return $this;
    }

    public function getPuntenIct(): ?int
    {
        return $this->puntenIct;
    }

    public function setPuntenIct(int $puntenIct): self
    {
        $this->puntenIct = $puntenIct;

        return $this;
    }

    public function getPuntenAenM(): ?int
    {
        return $this->puntenAenM;
    }

    public function setPuntenAenM(int $puntenAenM): self
    {
        $this->puntenAenM = $puntenAenM;

        return $this;
    }

    public function getPuntenBenI(): ?int
    {
        return $this->puntenBenI;
    }

    public function setPuntenBenI(int $puntenBenI): self
    {
        $this->puntenBenI = $puntenBenI;

        return $this;
    }

    public function getPuntenMei(): ?int
    {
        return $this->puntenMei;
    }

    public function setPuntenMei(int $puntenMei): self
    {
        $this->puntenMei = $puntenMei;

        return $this;
    }

    public function getPuntenTenI(): ?int
    {
        return $this->puntenTenI;
    }

    public function setPuntenTenI(int $puntenTenI): self
    {
        $this->puntenTenI = $puntenTenI;

        return $this;
    }

    public function jsonSerialize()
    {
        return [
            'id'=> $this->id,
            'vraag' => $this->vraag,
            'juisteAntwoord' => $this->juisteAntwoord,
            'puntenIct' => $this->puntenIct,
            'puntenAenM' => $this->puntenAenM,
            'puntenBenI' => $this->puntenBenI,
            'puntenMei' => $this->puntenMei,
            'puntenTenI' => $this->puntenTenI,
        ];
    }
}
