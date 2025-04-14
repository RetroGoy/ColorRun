package fr.esgi.color_run.controller;

import fr.esgi.color_run.model.User;
import fr.esgi.color_run.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet qui gère la connexion des utilisateurs
 */
@WebServlet(name = "LoginServlet", urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {

    private UserService userService; // Le service pour gérer les utilisateurs

    @Override
    public void init() throws ServletException {
        super.init();
        // Initialisation du service
        this.userService = new UserService();
    }

    /**
     * Méthode GET pour afficher la page de connexion
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Vérifier si l'utilisateur est déjà connecté
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            // Rediriger vers la page d'accueil s'il est déjà connecté
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }

        // Afficher la page de connexion
        request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
    }

    /**
     * Méthode POST pour traiter la soumission du formulaire de connexion
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        boolean rememberMe = "on".equals(request.getParameter("rememberMe"));

        // Validation des entrées
        if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Veuillez remplir tous les champs.");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
            return;
        }

        try {
            // Tentative d'authentification
            User user = userService.authenticate(email, password);

            if (user != null) {
                // Création d'une session
                HttpSession session = request.getSession(true);
                session.setAttribute("user", user);

                // Définir la durée de la session si "Se souvenir de moi" est coché
                if (rememberMe) {
                    session.setMaxInactiveInterval(7 * 24 * 60 * 60); // 7 jours en secondes
                }

                // Redirection en fonction du rôle
                switch (user.getRole()) {
                    case ADMIN:
                        response.sendRedirect(request.getContextPath() + "/admin/dashboard");
                        break;
                    case ORGANIZER:
                        response.sendRedirect(request.getContextPath() + "/organizer/dashboard");
                        break;
                    case PARTICIPANT:
                    default:
                        response.sendRedirect(request.getContextPath() + "/participant/dashboard");
                        break;
                }
            } else {
                // Échec de l'authentification
                request.setAttribute("errorMessage", "Email ou mot de passe incorrect.");
                request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            // Gérer les erreurs potentielles
            request.setAttribute("errorMessage",
                    "Une erreur est survenue lors de la connexion. Veuillez réessayer plus tard.");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        }
    }
}