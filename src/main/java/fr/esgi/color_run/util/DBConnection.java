package fr.esgi.color_run.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Classe utilitaire pour gérer la connexion à la base de données H2
 */
public class DBConnection {

    private static final String JDBC_URL = "jdbc:h2:mem:colorrundb;DB_CLOSE_DELAY=-1";
    private static final String JDBC_USER = "sa";
    private static final String JDBC_PASSWORD = "";

    private static Connection connection;

    /**
     * Obtient une connexion à la base de données
     * 
     * @return la connexion à la base de données
     * @throws SQLException si une erreur se produit lors de la connexion
     */
    public static Connection getConnection() throws SQLException {
        if (connection == null || connection.isClosed()) {
            try {
                Class.forName("org.h2.Driver");
                connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
                // Initialisation de la base de données si nécessaire
                initDatabase();
            } catch (ClassNotFoundException e) {
                throw new SQLException("Driver H2 non trouvé", e);
            }
        }
        return connection;
    }

    /**
     * Initialise la structure de la base de données si nécessaire
     * 
     * @throws SQLException si une erreur se produit lors de l'initialisation
     */
    private static void initDatabase() throws SQLException {
        try (Connection conn = getConnection()) {
            // Création de la table des utilisateurs
            conn.createStatement().execute(
                    "CREATE TABLE IF NOT EXISTS users (" +
                            "id BIGINT AUTO_INCREMENT PRIMARY KEY, " +
                            "first_name VARCHAR(100) NOT NULL, " +
                            "last_name VARCHAR(100) NOT NULL, " +
                            "email VARCHAR(255) NOT NULL UNIQUE, " +
                            "password VARCHAR(255) NOT NULL, " +
                            "profile_picture VARCHAR(255), " +
                            "role VARCHAR(20) NOT NULL DEFAULT 'PARTICIPANT'" +
                            ")");

            // Création de la table des courses
            conn.createStatement().execute(
                    "CREATE TABLE IF NOT EXISTS races (" +
                            "id BIGINT AUTO_INCREMENT PRIMARY KEY, " +
                            "name VARCHAR(255) NOT NULL, " +
                            "description TEXT, " +
                            "date_time TIMESTAMP NOT NULL, " +
                            "location VARCHAR(255) NOT NULL, " +
                            "distance DOUBLE NOT NULL, " +
                            "max_participants INT NOT NULL, " +
                            "price DOUBLE NOT NULL, " +
                            "has_obstacles BOOLEAN DEFAULT FALSE, " +
                            "supported_cause VARCHAR(255), " +
                            "organizer_id BIGINT NOT NULL, " +
                            "FOREIGN KEY (organizer_id) REFERENCES users(id)" +
                            ")");

            // Création de la table des participants aux courses
            conn.createStatement().execute(
                    "CREATE TABLE IF NOT EXISTS race_participants (" +
                            "race_id BIGINT NOT NULL, " +
                            "user_id BIGINT NOT NULL, " +
                            "PRIMARY KEY (race_id, user_id), " +
                            "FOREIGN KEY (race_id) REFERENCES races(id), " +
                            "FOREIGN KEY (user_id) REFERENCES users(id)" +
                            ")");

            // Création de la table des messages
            conn.createStatement().execute(
                    "CREATE TABLE IF NOT EXISTS messages (" +
                            "id BIGINT AUTO_INCREMENT PRIMARY KEY, " +
                            "content TEXT NOT NULL, " +
                            "timestamp TIMESTAMP NOT NULL, " +
                            "author_id BIGINT NOT NULL, " +
                            "race_id BIGINT NOT NULL, " +
                            "FOREIGN KEY (author_id) REFERENCES users(id), " +
                            "FOREIGN KEY (race_id) REFERENCES races(id)" +
                            ")");

            // Création de la table des demandes pour devenir organisateur
            conn.createStatement().execute(
                    "CREATE TABLE IF NOT EXISTS organizer_requests (" +
                            "id BIGINT AUTO_INCREMENT PRIMARY KEY, " +
                            "motivation TEXT NOT NULL, " +
                            "request_date TIMESTAMP NOT NULL, " +
                            "status VARCHAR(20) NOT NULL DEFAULT 'PENDING', " +
                            "requesting_user_id BIGINT NOT NULL, " +
                            "reviewed_by_id BIGINT, " +
                            "review_date TIMESTAMP, " +
                            "FOREIGN KEY (requesting_user_id) REFERENCES users(id), " +
                            "FOREIGN KEY (reviewed_by_id) REFERENCES users(id)" +
                            ")");

            // Création de la table des dossards
            conn.createStatement().execute(
                    "CREATE TABLE IF NOT EXISTS bib_numbers (" +
                            "id BIGINT AUTO_INCREMENT PRIMARY KEY, " +
                            "number VARCHAR(20) NOT NULL, " +
                            "qr_code VARCHAR(255) NOT NULL, " +
                            "generation_date TIMESTAMP NOT NULL, " +
                            "participant_id BIGINT NOT NULL, " +
                            "race_id BIGINT NOT NULL, " +
                            "FOREIGN KEY (participant_id) REFERENCES users(id), " +
                            "FOREIGN KEY (race_id) REFERENCES races(id), " +
                            "UNIQUE (race_id, number)" +
                            ")");
        }
    }

    /**
     * Ferme la connexion à la base de données
     */
    public static void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}