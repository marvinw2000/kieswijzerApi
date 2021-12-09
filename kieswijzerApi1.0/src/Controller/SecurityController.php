<?php

namespace App\Controller;

use App\Entity\Beheerder;
use App\Entity\Vraag;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Doctrine\ORM\EntityManagerInterface;

class SecurityController extends AbstractController
{

    /**
     * @Route("/getAllQuestions", name="getAllQuestions")
     */
    public function getAllQuestions()
    {
        $em = $this->getDoctrine()->getManager();
        $data = $em->getRepository(Vraag::class)->findAll();
        $response = new Response(json_encode($data));
        $response->headers->set('Content-Type', 'application/json');
        return $response;
    }
    /**
     * @Route("/createQuestion", name="createQuestion")
     */
    public function createQuestion(Request $request)
    {

        $dataNieuweVraag = json_decode($request->getContent(),
            true);
        $nVraag = new Vraag();
        $nVraag->setVraag($dataNieuweVraag['vraag']);
        $nVraag->setJuisteAntwoord($dataNieuweVraag['juisteAntwoord']);
        $nVraag->setPuntenIct($dataNieuweVraag['puntenIct']);
        $nVraag->setPuntenAenM($dataNieuweVraag['puntenAenM']);
        $nVraag->setPuntenBenI($dataNieuweVraag['puntenBenI']);
        $nVraag->setPuntenMei($dataNieuweVraag['puntenMei']);
        $nVraag->setPuntenTenI($dataNieuweVraag['puntenTenI']);
        //entity Maneger word aangemaaakt
        $em =$this->getDoctrine()->getManager();
        $em->persist($nVraag);
        $em->flush();

        $response = new JsonResponse(
            [
                'addedQuestion' => 'ok',
            ],
            JsonResponse::HTTP_CREATED
        );
        $response->headers->set('Access-Control-Allow-Origin', '*');
        return $response;
    }
}
