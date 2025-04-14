package fr.esgi.color_run.service;

import fr.esgi.color_run.model.User;
import fr.esgi.color_run.dao.UserDAO;

import java.util.List;

/**
 * Service pour gérer les utilisateurs
 */
public class UserService {

    private UserDAO userDAO;

    public UserService() {
        this.userDAO = new UserDAO();
    }

    /**
     * Authentifie un utilisateur avec son email et son mot de passe
     * 
     * @param email    l'email de l'utilisateur
     * @param password le mot de passe de l'utilisateur
     * @return l'utilisateur authentifié ou null si l'authentification échoue
     */
    public User authenticate(String email, String password) {
        // Pour le moment, on simule l'authentification
        // Dans une implémentation réelle, on vérifierait les identifiants dans la base
        // de données
        return userDAO.findByEmailAndPassword(email, password);
    }

    /**
     * Enregistre un nouvel utilisateur
     * 
     * @param user l'utilisateur à enregistrer
     * @return l'utilisateur enregistré
     */
    public User registerUser(User user) {
        // Vérifier si l'email est déjà utilisé
        if (userDAO.findByEmail(user.getEmail()) != null) {
            throw new IllegalArgumentException("Cet email est déjà utilisé.");
        }

        // Enregistrer l'utilisateur
        return userDAO.save(user);
    }

    /**
     * Récupère un utilisateur par son ID
     * 
     * @param id l'ID de l'utilisateur
     * @return l'utilisateur ou null s'il n'existe pas
     */
    public User getUserById(Long id) {
        return userDAO.findById(id);
    }

    /**
     * Récupère un utilisateur par son email
     * 
     * @param email l'email de l'utilisateur
     * @return l'utilisateur ou null s'il n'existe pas
     */
    public User getUserByEmail(String email) {
        return userDAO.findByEmail(email);
    }

    /**
     * Récupère tous les utilisateurs
     * 
     * @return la liste des utilisateurs
     */
    public List<User> getAllUsers() {
        return userDAO.findAll();
    }

    /**
     * Met à jour un utilisateur
     * 
     * @param user l'utilisateur à mettre à jour
     * @return l'utilisateur mis à jour
     */
    public User updateUser(User user) {
        return userDAO.update(user);
    }

    /**
     * Supprime un utilisateur
     * 
     * @param id l'ID de l'utilisateur à supprimer
     * @return true si l'utilisateur a été supprimé, false sinon
     */
    public boolean deleteUser(Long id) {
        return userDAO.delete(id);
    }
}