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
     * @Route("/getAllQuestions", name="getAllQuestions" methods={"get"})
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
     * @Route("/createQuestion", name="createQuestion" methods={"get"})
     */
    public function createQuestion(Request $request)
    {

        //Entity manager wordt aangeroepen.
        $em = $this->getDoctrine()->getManager();

        //content wordt van JSON naar PHP object geconverteerd.
        $data = json_decode($request->getContent(), true);

        //Hier wordt de nieuwe vraag aangemaakt
        $nieuweVraag = new Vraag();
        $nieuweVraag->setVraag($data['Vraag']);
        $nieuweVraag->setJuisteAntwoord($data['JuisteAntwoord']);
        $nieuweVraag->setPuntenIct($data['puntenIct']);
        $nieuweVraag->setPuntenAenM()($data['puntenAenM']);
        $nieuweVraag->setPuntenBenI($data['puntenBenI']);
        $nieuweVraag->setPuntenMei($data['puntenMei']);
        $nieuweVraag->setPuntenTenI($data['puntenTenI']);

        //de nieuwe vraag is aangegeven als object.
        $em->persist($nieuweVraag);

        //de wijzigingen worden uitgevoerd in DB
        $em->flush();


        $response = new JsonResponse(
            [
                'addedQuestion' => 'ok',
            ],
            JsonResponse::HTTP_CREATED
        );

        return $response;

    }

    /**
     * @Route("/updateQuestion", name="updateQuestion" methods={"get"})
     */
    public function updateQuestion()
    {

    }


    /**
     * @Route("/deleteQuestion", name="deleteQuestion" methods={"get"})
     */
    public function deleteQuestion()
    {

    }



}
