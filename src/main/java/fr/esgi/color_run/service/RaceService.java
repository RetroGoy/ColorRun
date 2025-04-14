package fr.esgi.color_run.service;

import fr.esgi.color_run.dao.RaceDAO;
import fr.esgi.color_run.model.Race;
import fr.esgi.color_run.model.User;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Service pour gérer les courses
 */
public class RaceService {

    private RaceDAO raceDAO;

    public RaceService() {
        this.raceDAO = new RaceDAO();
    }

    /**
     * Récupère toutes les courses
     * 
     * @return la liste des courses
     */
    public List<Race> getAllRaces() {
        return raceDAO.findAll();
    }

    /**
     * Récupère une course par son ID
     * 
     * @param id l'ID de la course
     * @return la course ou null si elle n'existe pas
     */
    public Race getRaceById(Long id) {
        return raceDAO.findById(id);
    }

    /**
     * Crée une nouvelle course
     * 
     * @param race la course à créer
     * @return la course créée
     */
    public Race createRace(Race race) {
        return raceDAO.save(race);
    }

    /**
     * Met à jour une course
     * 
     * @param race la course à mettre à jour
     * @return la course mise à jour
     */
    public Race updateRace(Race race) {
        return raceDAO.update(race);
    }

    /**
     * Supprime une course
     * 
     * @param id l'ID de la course à supprimer
     * @return true si la course a été supprimée, false sinon
     */
    public boolean deleteRace(Long id) {
        return raceDAO.delete(id);
    }

    /**
     * Inscrit un participant à une course
     * 
     * @param raceId l'ID de la course
     * @param user   l'utilisateur à inscrire
     * @return true si l'inscription a réussi, false sinon
     */
    public boolean registerUserToRace(Long raceId, User user) {
        Race race = raceDAO.findById(raceId);
        if (race == null)
            return false;

        if (race.getParticipants().size() >= race.getMaxParticipants()) {
            return false; // La course est complète
        }

        race.addParticipant(user);
        raceDAO.update(race);
        return true;
    }

    /**
     * Désinscrit un participant d'une course
     * 
     * @param raceId l'ID de la course
     * @param userId l'ID de l'utilisateur à désinscrire
     * @return true si la désinscription a réussi, false sinon
     */
    public boolean unregisterUserFromRace(Long raceId, Long userId) {
        Race race = raceDAO.findById(raceId);
        if (race == null)
            return false;

        User participant = race.getParticipants().stream()
                .filter(user -> user.getId().equals(userId))
                .findFirst()
                .orElse(null);

        if (participant == null)
            return false;

        race.removeParticipant(participant);
        raceDAO.update(race);
        return true;
    }

    /**
     * Filtre les courses par date
     * 
     * @param races la liste des courses à filtrer
     * @param date  la date de filtre
     * @return la liste des courses filtrées
     */
    public List<Race> filterRacesByDate(List<Race> races, LocalDate date) {
        return races.stream()
                .filter(race -> {
                    LocalDate raceDate = race.getDateTime().toLocalDate();
                    return raceDate.equals(date);
                })
                .collect(Collectors.toList());
    }

    /**
     * Filtre les courses par ville
     * 
     * @param races la liste des courses à filtrer
     * @param city  la ville de filtre
     * @return la liste des courses filtrées
     */
    public List<Race> filterRacesByCity(List<Race> races, String city) {
        return races.stream()
                .filter(race -> race.getLocation().toLowerCase().contains(city.toLowerCase()))
                .collect(Collectors.toList());
    }

    /**
     * Filtre les courses par distance
     * 
     * @param races    la liste des courses à filtrer
     * @param distance la distance de filtre
     * @return la liste des courses filtrées
     */
    public List<Race> filterRacesByDistance(List<Race> races, double distance) {
        return races.stream()
                .filter(race -> race.getDistance() == distance)
                .collect(Collectors.toList());
    }

    /**
     * Trie les courses selon un critère
     * 
     * @param races  la liste des courses à trier
     * @param sortBy le critère de tri (date, city, distance)
     * @return la liste des courses triées
     */
    public List<Race> sortRaces(List<Race> races, String sortBy) {
        List<Race> sortedRaces = new ArrayList<>(races);

        switch (sortBy.toLowerCase()) {
            case "date":
                sortedRaces.sort(Comparator.comparing(Race::getDateTime));
                break;
            case "city":
                sortedRaces.sort(Comparator.comparing(Race::getLocation));
                break;
            case "distance":
                sortedRaces.sort(Comparator.comparing(Race::getDistance));
                break;
            default:
                // Par défaut, trier par date
                sortedRaces.sort(Comparator.comparing(Race::getDateTime));
        }

        return sortedRaces;
    }

    /**
     * Récupère les villes distinctes des courses
     * 
     * @return la liste des villes distinctes
     */
    public List<String> getDistinctCities() {
        return raceDAO.findAll().stream()
                .map(Race::getLocation)
                .distinct()
                .collect(Collectors.toList());
    }

    /**
     * Récupère les distances distinctes des courses
     * 
     * @return la liste des distances distinctes
     */
    public List<Double> getDistinctDistances() {
        return raceDAO.findAll().stream()
                .map(Race::getDistance)
                .distinct()
                .collect(Collectors.toList());
    }

    /**
     * Récupère les courses futures
     * 
     * @return la liste des courses futures
     */
    public List<Race> getUpcomingRaces() {
        LocalDateTime now = LocalDateTime.now();
        return raceDAO.findAll().stream()
                .filter(race -> race.getDateTime().isAfter(now))
                .sorted(Comparator.comparing(Race::getDateTime))
                .collect(Collectors.toList());
    }

    /**
     * Récupère les courses organisées par un utilisateur
     * 
     * @param userId l'ID de l'organisateur
     * @return la liste des courses organisées par l'utilisateur
     */
    public List<Race> getRacesByOrganizer(Long userId) {
        return raceDAO.findByOrganizerId(userId);
    }

    /**
     * Récupère les courses auxquelles un utilisateur participe
     * 
     * @param userId l'ID du participant
     * @return la liste des courses auxquelles l'utilisateur participe
     */
    public List<Race> getRacesByParticipant(Long userId) {
        return raceDAO.findByParticipantId(userId);
    }
}