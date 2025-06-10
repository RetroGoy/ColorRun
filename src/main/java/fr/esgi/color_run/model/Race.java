package fr.esgi.color_run.model;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * Classe représentant une course Color Run
 */
public class Race {
    private Long id;
    private String name;
    private String description;
    private LocalDateTime dateTime;
    private String location;
    private double distance; // en km
    private int maxParticipants;
    private double price;
    private boolean hasObstacles;
    private String supportedCause;
    private User organizer;
    private List<User> participants;
    private List<Message> discussionThread;
    private RaceType raceType;

    public enum RaceType {
        CLASSIC("Course classique"),
        NIGHT("Course nocturne"),
        OBSTACLE("Course à obstacles"),
        FAMILY("Course familiale"),
        CHARITY("Course caritative");

        private final String label;

        RaceType(String label) {
            this.label = label;
        }

        public String getLabel() {
            return label;
        }
    }

    public Race() {
        this.participants = new ArrayList<>();
        this.discussionThread = new ArrayList<>();
        this.raceType = RaceType.CLASSIC; // Type par défaut
    }

    public Race(String name, String description, LocalDateTime dateTime, String location,
            double distance, int maxParticipants, double price, User organizer) {
        this.name = name;
        this.description = description;
        this.dateTime = dateTime;
        this.location = location;
        this.distance = distance;
        this.maxParticipants = maxParticipants;
        this.price = price;
        this.organizer = organizer;
        this.participants = new ArrayList<>();
        this.discussionThread = new ArrayList<>();
        this.raceType = RaceType.CLASSIC; // Type par défaut
    }

    // Getters et Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalDateTime getDateTime() {
        return dateTime;
    }

    public void setDateTime(LocalDateTime dateTime) {
        this.dateTime = dateTime;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public double getDistance() {
        return distance;
    }

    public void setDistance(double distance) {
        this.distance = distance;
    }

    public int getMaxParticipants() {
        return maxParticipants;
    }

    public void setMaxParticipants(int maxParticipants) {
        this.maxParticipants = maxParticipants;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public boolean isHasObstacles() {
        return hasObstacles;
    }

    public void setHasObstacles(boolean hasObstacles) {
        this.hasObstacles = hasObstacles;
    }

    public String getSupportedCause() {
        return supportedCause;
    }

    public void setSupportedCause(String supportedCause) {
        this.supportedCause = supportedCause;
    }

    public User getOrganizer() {
        return organizer;
    }

    public void setOrganizer(User organizer) {
        this.organizer = organizer;
    }

    public List<User> getParticipants() {
        return participants;
    }

    public void setParticipants(List<User> participants) {
        this.participants = participants;
    }

    public void addParticipant(User participant) {
        if (!this.participants.contains(participant) && this.participants.size() < this.maxParticipants) {
            this.participants.add(participant);
            participant.addParticipatingRace(this);
        }
    }

    public boolean removeParticipant(User participant) {
        boolean removed = this.participants.remove(participant);
        if (removed) {
            participant.removeParticipatingRace(this);
        }
        return removed;
    }

    public List<Message> getDiscussionThread() {
        return discussionThread;
    }

    public void setDiscussionThread(List<Message> discussionThread) {
        this.discussionThread = discussionThread;
    }

    public void addMessage(Message message) {
        this.discussionThread.add(message);
    }

    public RaceType getRaceType() {
        return raceType;
    }

    public void setRaceType(RaceType raceType) {
        this.raceType = raceType;
    }

    @Override
    public String toString() {
        return "Race{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", dateTime=" + dateTime +
                ", location='" + location + '\'' +
                ", distance=" + distance +
                ", maxParticipants=" + maxParticipants +
                ", participants=" + participants.size() +
                '}';
    }
}