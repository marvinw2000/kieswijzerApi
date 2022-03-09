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
     * @Route("/login", name="login")
     */
    public function login(Request $request)
    {
        //entity manager ophalen
        $em = $this->getDoctrine()->getManager();
        $data = json_decode($request->getContent(), true);
        $repository = $em->getRepository(Beheerder::class);
        $inputGebruikersNaam = $data['inputGebruikersNaam'];
        $inputWachtwoord = $data['inputWachtwoord']; 
        //$inputWachtwoord = password_hash($data['inputWachtwoord'], DEFAULT_PASSWORD);
        $gebruikerData = $repository->findOneBy(['gebruikersNaam'=> $inputGebruikersNaam]);

        if ($inputWachtwoord === $gebruikerData->getPassword()){
            $role = $gebruikerData->getRoles();
            $name = $gebruikerData->getGebruikersNaam();
        }
        $response = new JsonResponse(
            [
                'role' => $role[0],
                'name' => $name,
            ],
            JsonResponse::HTTP_CREATED
        );
        $response->headers->set('Content-Type', 'application/json');
        $response->headers->set('Access-Control-Allow-Origin', '*');
        return $response;
    }
    /**
     * @Route("/getAllQuestions", name="getAllQuestions" )
     */
    public function getAllQuestions()
    {
        //entity manager ophalen
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
        //de id wordt opgehaald met ->find($id)
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
     * @Route("/savePicture", name="savePicture")
     */
    public function savePicture(){
        $destination = $this->getParameter('kernel.project_dir').'/public/uploads';
        $tmp_name = $_FILES["uploadfile"]["tmp_name"];
        $name = basename($_FILES["uploadfile"]["name"]);
        move_uploaded_file($tmp_name, "$destination/$name");

        $response = new JsonResponse(
            [
                'picture saved' => 'ok',
            ],
            JsonResponse::HTTP_CREATED
        );
        $response->headers->set('Content-Type', 'application/json');
        $response->headers->set('Access-Control-Allow-Origin', '*');
        return $response;
    }
    /**
     * @Route("/createQuestion", name="createQuestion")
     */
    public function createQuestion(Request $request)
    {
        $data = json_decode($request->getContent(), true);
        $inputAnswer = strtolower($data['juisteAntwoord']);
        $inputAnswerTrimed = str_replace(' ', '', $inputAnswer);
        if ($inputAnswerTrimed === 'false')
        {
            $boolean = 0;
        }
        if ($inputAnswerTrimed === 'true')
        {
            $boolean = 1;
        }
        $vraag = new Vraag();
        $vraag->setVraag($data["vraag"]);
        $vraag->setJuisteAntwoord($boolean);
        $vraag->setPuntenIct($data["puntenIct"]);
        $vraag->setPuntenAenM($data["puntenAenM"]);
        $vraag->setPuntenBenI($data["puntenBenI"]);
        $vraag->setPuntenMei($data["puntenMei"]);
        $vraag->setPuntenTenI($data["puntenTenI"]);
        $vraag->setImage($data["naamImg"]);
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
     * @Route("/updateQuestion/{id}", name="updateQuestion", methods={"post"})
     */
    public function updateAction($id ,Request $request)
    {
        $data = json_decode($request->getContent(),true);
        $em = $this->getDoctrine()->getManager();
        $vraag = $em->getRepository(Vraag::class)->find($id);
        $vraag->setVraag($data['currentQuestion']);
        $vraag->setJuisteAntwoord($data["corectAnswer"]);
        $vraag->setPuntenIct(number_format($data['currentPointsIct']));
        $vraag->setPuntenAenM(number_format($data['currentPointsAenM']));
        $vraag->setPuntenBenI(number_format($data['currentPointsBenI']));
        $vraag->setPuntenMei(number_format($data['currentPointsMei']));
        $vraag->setPuntenTenI(number_format($data['currentPointsTenI']));
        $em->flush();

        $response = new JsonResponse(
            [
                'vraagUpdated' => 'ok',
                'data' => $data["corectAnswer"]

            ],
            JsonResponse::HTTP_CREATED
        );
        $response->headers->set('Content-Type', 'application/json');
        $response->headers->set('Access-Control-Allow-Origin', '*');
        return $response;

    }

         /**
         * @Route("/updateQuestion/{id}", name="update_question")
         */
    public function update($id, Request $request)
    {
        //entity manager wordt aangeroepen
        $em = $this->getDoctrine()->getManager();
        //de id wordt opgehaald met ->finf($id)
        $data = $em->getRepository(Vraag::class)->find($id);
        if (is_null($data)) {
            throw $this->createNotFoundException('Geen vraag gevonden met id: ' . $id);
        }
        $data->setVraag('vraag');
        $em->flush();
        $response = new Response(json_encode($data));
        $response->headers->set('Content-Type', 'application/json');
        return $response;
    }

}
