package fr.esgi.color_run.model;

import java.util.ArrayList;
import java.util.List;

/**
 * Classe représentant un utilisateur de l'application Color Run
 */
public class User {
    private Long id;
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private String profilePicture;
    private Role role;
    private List<Race> participatingRaces;

    public enum Role {
        PARTICIPANT,
        ORGANIZER,
        ADMIN
    }

    public User() {
        this.participatingRaces = new ArrayList<>();
    }

    public User(String firstName, String lastName, String email, String password) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.role = Role.PARTICIPANT; // Par défaut, un utilisateur est un participant
        this.participatingRaces = new ArrayList<>();
    }

    // Getters et Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getProfilePicture() {
        return profilePicture;
    }

    public void setProfilePicture(String profilePicture) {
        this.profilePicture = profilePicture;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public List<Race> getParticipatingRaces() {
        return participatingRaces;
    }

    public void setParticipatingRaces(List<Race> participatingRaces) {
        this.participatingRaces = participatingRaces;
    }

    public void addParticipatingRace(Race race) {
        if (!this.participatingRaces.contains(race)) {
            this.participatingRaces.add(race);
        }
    }

    public boolean removeParticipatingRace(Race race) {
        return this.participatingRaces.remove(race);
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", email='" + email + '\'' +
                ", role=" + role +
                '}';
    }
}