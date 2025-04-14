package fr.esgi.color_run.controller;

import fr.esgi.color_run.model.Race;
import fr.esgi.color_run.service.RaceService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

/**
 * Servlet qui gère l'affichage et le filtrage des courses
 */
@WebServlet(name = "RacesServlet", urlPatterns = { "/races" })
public class RacesServlet extends HttpServlet {

    private RaceService raceService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.raceService = new RaceService();
    }

    /**
     * Méthode GET pour afficher la liste des courses
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Récupérer les paramètres de filtre
        String dateFilter = request.getParameter("date");
        String cityFilter = request.getParameter("city");
        String distanceFilter = request.getParameter("distance");
        String sortBy = request.getParameter("sortBy");

        // Récupérer toutes les courses
        List<Race> races = raceService.getAllRaces();

        // Appliquer les filtres si nécessaire
        if (dateFilter != null && !dateFilter.isEmpty()) {
            LocalDate date = LocalDate.parse(dateFilter, DateTimeFormatter.ISO_DATE);
            races = raceService.filterRacesByDate(races, date);
        }

        if (cityFilter != null && !cityFilter.isEmpty()) {
            races = raceService.filterRacesByCity(races, cityFilter);
        }

        if (distanceFilter != null && !distanceFilter.isEmpty()) {
            double distance = Double.parseDouble(distanceFilter);
            races = raceService.filterRacesByDistance(races, distance);
        }

        // Trier les courses si nécessaire
        if (sortBy != null && !sortBy.isEmpty()) {
            races = raceService.sortRaces(races, sortBy);
        }

        // Stocker les résultats dans la requête
        request.setAttribute("races", races);

        // Récupérer les villes et distances distinctes pour les filtres
        List<String> cities = raceService.getDistinctCities();
        List<Double> distances = raceService.getDistinctDistances();

        request.setAttribute("cities", cities);
        request.setAttribute("distances", distances);

        // Afficher la page
        request.getRequestDispatcher("/WEB-INF/views/races.jsp").forward(request, response);
    }
}