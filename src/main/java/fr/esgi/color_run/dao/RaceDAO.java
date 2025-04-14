package fr.esgi.color_run.dao;

import fr.esgi.color_run.model.Race;
import fr.esgi.color_run.model.User;
import fr.esgi.color_run.util.DBConnection;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * DAO pour gérer la persistance des courses
 * Pour le moment, cette classe utilise une base de données en mémoire
 * (simulation)
 */
public class RaceDAO {

    // Simulation d'une base de données en mémoire
    private static List<Race> races = new ArrayList<>();
    private static Long nextId = 1L;

    static {
        // Ajouter quelques courses de test
        User organizer = new UserDAO().findById(2L); // L'utilisateur avec le rôle ORGANIZER

        // Course 1 - Paris
        Race race1 = new Race(
                "Color Run Paris",
                "La course la plus colorée de Paris ! Venez courir 5km dans une ambiance festive et colorée.",
                LocalDateTime.of(2025, 5, 15, 10, 0),
                "Parc de la Villette, Paris",
                5.0,
                1000,
                25.0,
                organizer);
        race1.setId(nextId++);
        races.add(race1);

        // Course 2 - Lyon
        Race race2 = new Race(
                "Color Run Lyon",
                "La course la plus colorée de Lyon ! Venez courir 10km dans une ambiance festive et colorée.",
                LocalDateTime.of(2025, 5, 22, 14, 0),
                "Parc de la Tête d'Or, Lyon",
                10.0,
                800,
                30.0,
                organizer);
        race2.setId(nextId++);
        races.add(race2);

        // Course 3 - Marseille
        Race race3 = new Race(
                "Color Run Marseille",
                "La course la plus colorée de Marseille ! Venez courir 7km dans une ambiance festive et colorée.",
                LocalDateTime.of(2025, 6, 5, 9, 0),
                "Plages du Prado, Marseille",
                7.0,
                600,
                20.0,
                organizer);
        race3.setId(nextId++);
        races.add(race3);
    }

    /**
     * Trouve une course par son ID
     * 
     * @param id l'ID de la course
     * @return la course ou null si elle n'existe pas
     */
    public Race findById(Long id) {
        return races.stream()
                .filter(race -> race.getId().equals(id))
                .findFirst()
                .orElse(null);
    }

    /**
     * Récupère toutes les courses
     * 
     * @return la liste des courses
     */
    public List<Race> findAll() {
        return new ArrayList<>(races);
    }

    /**
     * Enregistre une nouvelle course
     * 
     * @param race la course à enregistrer
     * @return la course enregistrée
     */
    public Race save(Race race) {
        race.setId(nextId++);
        races.add(race);
        return race;
    }

    /**
     * Met à jour une course
     * 
     * @param race la course à mettre à jour
     * @return la course mise à jour
     */
    public Race update(Race race) {
        Race existingRace = findById(race.getId());
        if (existingRace != null) {
            races.remove(existingRace);
            races.add(race);
            return race;
        }
        return null;
    }

    /**
     * Supprime une course
     * 
     * @param id l'ID de la course à supprimer
     * @return true si la course a été supprimée, false sinon
     */
    public boolean delete(Long id) {
        Race race = findById(id);
        if (race != null) {
            return races.remove(race);
        }
        return false;
    }

    /**
     * Trouve les courses organisées par un utilisateur
     * 
     * @param organizerId l'ID de l'organisateur
     * @return la liste des courses organisées par l'utilisateur
     */
    public List<Race> findByOrganizerId(Long organizerId) {
        return races.stream()
                .filter(race -> race.getOrganizer() != null && race.getOrganizer().getId().equals(organizerId))
                .collect(Collectors.toList());
    }

    /**
     * Trouve les courses auxquelles un utilisateur participe
     * 
     * @param participantId l'ID du participant
     * @return la liste des courses auxquelles l'utilisateur participe
     */
    public List<Race> findByParticipantId(Long participantId) {
        return races.stream()
                .filter(race -> race.getParticipants().stream()
                        .anyMatch(user -> user.getId().equals(participantId)))
                .collect(Collectors.toList());
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
     * public Race findById(Long id) {
     * try (Connection conn = getConnection();
     * PreparedStatement stmt = conn.prepareStatement(
     * "SELECT * FROM races WHERE id = ?")) {
     * stmt.setLong(1, id);
     * ResultSet rs = stmt.executeQuery();
     * if (rs.next()) {
     * return mapResultSetToRace(rs);
     * }
     * } catch (SQLException e) {
     * e.printStackTrace();
     * }
     * return null;
     * }
     * 
     * private Race mapResultSetToRace(ResultSet rs) throws SQLException {
     * Race race = new Race();
     * race.setId(rs.getLong("id"));
     * race.setName(rs.getString("name"));
     * race.setDescription(rs.getString("description"));
     * race.setDateTime(rs.getTimestamp("date_time").toLocalDateTime());
     * race.setLocation(rs.getString("location"));
     * race.setDistance(rs.getDouble("distance"));
     * race.setMaxParticipants(rs.getInt("max_participants"));
     * race.setPrice(rs.getDouble("price"));
     * race.setHasObstacles(rs.getBoolean("has_obstacles"));
     * race.setSupportedCause(rs.getString("supported_cause"));
     * 
     * // Récupérer l'organisateur
     * Long organizerId = rs.getLong("organizer_id");
     * User organizer = new UserDAO().findById(organizerId);
     * race.setOrganizer(organizer);
     * 
     * // Récupérer les participants
     * List<User> participants = findParticipantsByRaceId(race.getId());
     * for (User participant : participants) {
     * race.addParticipant(participant);
     * }
     * 
     * return race;
     * }
     * 
     * private List<User> findParticipantsByRaceId(Long raceId) {
     * List<User> participants = new ArrayList<>();
     * try (Connection conn = getConnection();
     * PreparedStatement stmt = conn.prepareStatement(
     * "SELECT u.* FROM users u JOIN race_participants rp ON u.id = rp.user_id WHERE rp.race_id = ?"
     * )) {
     * stmt.setLong(1, raceId);
     * ResultSet rs = stmt.executeQuery();
     * while (rs.next()) {
     * User user = new User();
     * user.setId(rs.getLong("id"));
     * user.setFirstName(rs.getString("first_name"));
     * user.setLastName(rs.getString("last_name"));
     * user.setEmail(rs.getString("email"));
     * user.setRole(User.Role.valueOf(rs.getString("role")));
     * participants.add(user);
     * }
     * } catch (SQLException e) {
     * e.printStackTrace();
     * }
     * return participants;
     * }
     */
}