package fr.esgi.color_run.dao;

import fr.esgi.color_run.model.User;
import fr.esgi.color_run.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * DAO pour gérer la persistance des utilisateurs
 * Pour le moment, cette classe utilise une base de données en mémoire
 * (simulation)
 */
public class UserDAO {

    // Simulation d'une base de données en mémoire
    private static List<User> users = new ArrayList<>();
    private static Long nextId = 1L;

    static {
        // Ajout de quelques utilisateurs de test
        User admin = new User("Admin", "Système", "admin@colorrun.fr", "admin123");
        admin.setRole(User.Role.ADMIN);
        admin.setId(nextId++);
        users.add(admin);

        User organizer = new User("Organisateur", "Test", "organisateur@colorrun.fr", "orga123");
        organizer.setRole(User.Role.ORGANIZER);
        organizer.setId(nextId++);
        users.add(organizer);

        User participant = new User("Participant", "Test", "participant@colorrun.fr", "part123");
        participant.setId(nextId++);
        users.add(participant);
    }

    /**
     * Trouve un utilisateur par son ID
     * 
     * @param id l'ID de l'utilisateur
     * @return l'utilisateur ou null s'il n'existe pas
     */
    public User findById(Long id) {
        return users.stream()
                .filter(user -> user.getId().equals(id))
                .findFirst()
                .orElse(null);
    }

    /**
     * Trouve un utilisateur par son email
     * 
     * @param email l'email de l'utilisateur
     * @return l'utilisateur ou null s'il n'existe pas
     */
    public User findByEmail(String email) {
        return users.stream()
                .filter(user -> user.getEmail().equals(email))
                .findFirst()
                .orElse(null);
    }

    /**
     * Trouve un utilisateur par son email et son mot de passe
     * 
     * @param email    l'email de l'utilisateur
     * @param password le mot de passe de l'utilisateur
     * @return l'utilisateur ou null si les identifiants sont incorrects
     */
    public User findByEmailAndPassword(String email, String password) {
        return users.stream()
                .filter(user -> user.getEmail().equals(email) && user.getPassword().equals(password))
                .findFirst()
                .orElse(null);
    }

    /**
     * Récupère tous les utilisateurs
     * 
     * @return la liste des utilisateurs
     */
    public List<User> findAll() {
        return new ArrayList<>(users);
    }

    /**
     * Enregistre un nouvel utilisateur
     * 
     * @param user l'utilisateur à enregistrer
     * @return l'utilisateur enregistré
     */
    public User save(User user) {
        user.setId(nextId++);
        users.add(user);
        return user;
    }

    /**
     * Met à jour un utilisateur
     * 
     * @param user l'utilisateur à mettre à jour
     * @return l'utilisateur mis à jour
     */
    public User update(User user) {
        User existingUser = findById(user.getId());
        if (existingUser != null) {
            users.remove(existingUser);
            users.add(user);
            return user;
        }
        return null;
    }

    /**
     * Supprime un utilisateur
     * 
     * @param id l'ID de l'utilisateur à supprimer
     * @return true si l'utilisateur a été supprimé, false sinon
     */
    public boolean delete(Long id) {
        User user = findById(id);
        if (user != null) {
            return users.remove(user);
        }
        return false;
    }

    /*
     * Dans une version future, ces méthodes utiliseront une vraie base de données
     * H2
     * Voici un exemple de comment cela pourrait être implémenté :
     */

    /*
     * private Connection getConnection() throws SQLException {
     * return DBConnection.getConnection();
     * }
     * 
     * public User findById(Long id) {
     * try (Connection conn = getConnection();
     * PreparedStatement stmt =
     * conn.prepareStatement("SELECT * FROM users WHERE id = ?")) {
     * stmt.setLong(1, id);
     * ResultSet rs = stmt.executeQuery();
     * if (rs.next()) {
     * return mapResultSetToUser(rs);
     * }
     * } catch (SQLException e) {
     * e.printStackTrace();
     * }
     * return null;
     * }
     * 
     * private User mapResultSetToUser(ResultSet rs) throws SQLException {
     * User user = new User();
     * user.setId(rs.getLong("id"));
     * user.setFirstName(rs.getString("first_name"));
     * user.setLastName(rs.getString("last_name"));
     * user.setEmail(rs.getString("email"));
     * user.setPassword(rs.getString("password"));
     * user.setRole(User.Role.valueOf(rs.getString("role")));
     * user.setProfilePicture(rs.getString("profile_picture"));
     * return user;
     * }
     */
}