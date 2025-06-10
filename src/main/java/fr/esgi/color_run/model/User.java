package fr.esgi.color_run.model;

import java.util.ArrayList;
import java.util.List;
import java.time.LocalDate;

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
    private String phone;
    private Role role;
    private List<Race> participatingRaces;
    private boolean emailNotificationsEnabled;
    private boolean smsNotificationsEnabled;
    private boolean newsletterEnabled;
    private LocalDate birthDate;
    private String gender;
    private String address;
    private String postalCode;
    private String city;

    public enum Role {
        PARTICIPANT,
        ORGANIZER,
        ADMIN
    }

    public User() {
        this.participatingRaces = new ArrayList<>();
        this.emailNotificationsEnabled = true;
        this.smsNotificationsEnabled = false;
        this.newsletterEnabled = false;
    }

    public User(String firstName, String lastName, String email, String password) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.role = Role.PARTICIPANT;
        this.participatingRaces = new ArrayList<>();
        this.emailNotificationsEnabled = true;
        this.smsNotificationsEnabled = false;
        this.newsletterEnabled = false;
    }

    // Getters and Setters
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isEmailNotificationsEnabled() {
        return emailNotificationsEnabled;
    }

    public void setEmailNotificationsEnabled(boolean emailNotificationsEnabled) {
        this.emailNotificationsEnabled = emailNotificationsEnabled;
    }

    public boolean isSmsNotificationsEnabled() {
        return smsNotificationsEnabled;
    }

    public void setSmsNotificationsEnabled(boolean smsNotificationsEnabled) {
        this.smsNotificationsEnabled = smsNotificationsEnabled;
    }

    public boolean isNewsletterEnabled() {
        return newsletterEnabled;
    }

    public void setNewsletterEnabled(boolean newsletterEnabled) {
        this.newsletterEnabled = newsletterEnabled;
    }

    public LocalDate getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(LocalDate birthDate) {
        this.birthDate = birthDate;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
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