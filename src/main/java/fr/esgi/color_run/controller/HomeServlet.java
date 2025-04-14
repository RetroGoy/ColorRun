package fr.esgi.color_run.controller;

import fr.esgi.color_run.model.Race;
import fr.esgi.color_run.service.RaceService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

/**
 * Servlet qui gère l'affichage de la page d'accueil
 */
@WebServlet(name = "HomeServlet", urlPatterns = { "/home", "/" })
public class HomeServlet extends HttpServlet {

    private RaceService raceService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.raceService = new RaceService();
    }

    /**
     * Méthode GET pour afficher la page d'accueil
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Récupérer les prochaines courses pour les afficher sur la page d'accueil
        List<Race> upcomingRaces = raceService.getUpcomingRaces();
        request.setAttribute("upcomingRaces", upcomingRaces);

        // Afficher la page d'accueil
        request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);
    }
}