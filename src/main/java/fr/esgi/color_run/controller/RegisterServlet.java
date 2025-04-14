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
 * Servlet qui gère l'inscription des utilisateurs
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

    private UserService userService; // Le service pour gérer les utilisateurs

    @Override
    public void init() throws ServletException {
        super.init();
        // Initialisation du service
        this.userService = new UserService();
    }

    /**
     * Méthode GET pour afficher la page d'inscription
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Vérifier si l'utilisateur est déjà connecté
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            // Rediriger vers la page d'accueil s'il est déjà connecté
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }
        
        // Afficher la page d'inscription
        request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
    }

    /**
     * Méthode POST pour traiter la soumission du formulaire d'inscription
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String acceptTerms = request.getParameter("acceptTerms");
        
        // Validation des entrées
        if (firstName == null || firstName.trim().isEmpty() ||
            lastName == null || lastName.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            password == null || password.trim().isEmpty() ||
            confirmPassword == null || confirmPassword.trim().isEmpty()) {
            
            request.setAttribute("errorMessage", "Veuillez remplir tous les champs obligatoires.");
            request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
            return;
        }
        
        // Vérifier que les mots de passe correspondent
        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Les mots de passe ne correspondent pas.");
            request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
            return;
        }
        
        // Vérifier que les conditions d'utilisation ont été acceptées
        if (acceptTerms == null || !acceptTerms.equals("on")) {
            request.setAttribute("errorMessage", "Vous devez accepter les conditions d'utilisation.");
            request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
            return;
        }
        
        try {
            // Vérifier si l'email existe déjà
            if (userService.getUserByEmail(email) != null) {
                request.setAttribute("errorMessage", "Cet email est déjà utilisé.");
                request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
                return;
            }
            
            // Créer un nouvel utilisateur
            User user = new User(firstName, lastName, email, password);
            user = userService.registerUser(user);
            
            // Créer une session pour l'utilisateur
            HttpSession session = request.getSession(true);
            session.setAttribute("user", user);
            
            // Rediriger vers la page d'accueil
            response.sendRedirect(request.getContextPath() + "/");
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Une erreur est survenue lors de l'inscription. Veuillez réessayer plus tard.");
            request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
        }
    }
} 
 