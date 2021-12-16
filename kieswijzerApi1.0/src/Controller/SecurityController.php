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

}
