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
     * @Route("/getAllQuestions", name="getAllQuestions" )
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
     * @Route("/deleteQuestion/{id}", name="deleteQuestion" )
     */
    public function deleteQuestion($id)
    {
        //entity manager wordt aangeroepen
        $em = $this->getDoctrine()->getManager();
        //de id wordt opgehaald met ->finf($id)
        $data = $em->getRepository(Vraag::class)->find($id);
        //data wordt verwijderd
        $em->remove($data);
        //de actie wordt doorgevoerd in de DB
        $em->flush();
        //er wordt een nieuwe response aangemaakt.
        $response = new Response(json_encode($data));
        $response->headers->set('Content-Type', 'application/json');
        return $response;
    }

    /**
     * @Route("/createQuestion", name="createQuestion")
     */
    public function createQuestion(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $vraag = new Vraag();
        $vraag->setVraag($data["vraag"]);
        $vraag->setJuisteAntwoord($data["juisteAntwoord"]);
        $vraag->setPuntenIct($data["puntenIct"]);
        $vraag->setPuntenAenM($data["puntenAenM"]);
        $vraag->setPuntenBenI($data["puntenBenI"]);
        $vraag->setPuntenMei($data["puntenMei"]);
        $vraag->setPuntenTenI($data["puntenTenI"]);

        //entity manager wordt aangeroepen
        $em = $this->getDoctrine()->getManager();

        //data wordt
        $em->persist($vraag);

        //de actie wordt doorgevoerd in de DB
        $em->flush();

        //er wordt een nieuwe response aangemaakt.
        $response = new JsonResponse(
            [
                'addedQuestion' => 'ok',
            ],
            JsonResponse::HTTP_CREATED
        );


        $response->headers->set('Content-Type', 'application/json');
        $response->headers->set('Access-Control-Allow-Origin', '*');
        return $response;
    }
    /**
     * @Route("/updateQuestion/{id}", name="updateQuestion")
     */
    public function updateAction($id)
    {
        $em = $this->getDoctrine()->getManager();
        $vraag = $em->getRepository(Vraag::class)->find($id);
        $vraag->setVraag('Test');
        $em->flush();

        $response = new JsonResponse(
            [
                'vraagUpdated' => 'ok',
            ],
            JsonResponse::HTTP_CREATED
        );
        $response->headers->set('Content-Type', 'application/json');
        $response->headers->set('Access-Control-Allow-Origin', '*');
        return $response;

    }

}
