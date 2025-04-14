package fr.esgi.color_run.model;

import java.time.LocalDateTime;

/**
 * Classe représentant un dossard pour un participant à une course
 */
public class BibNumber {
    private Long id;
    private User participant;
    private Race race;
    private String number;
    private String qrCode;
    private LocalDateTime generationDate;

    public BibNumber() {
        this.generationDate = LocalDateTime.now();
    }

    public BibNumber(User participant, Race race, String number) {
        this.participant = participant;
        this.race = race;
        this.number = number;
        this.generationDate = LocalDateTime.now();
        // Le QR code sera généré lors de la création du dossard
        this.qrCode = generateQRCode();
    }

    // Getters et Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getParticipant() {
        return participant;
    }

    public void setParticipant(User participant) {
        this.participant = participant;
    }

    public Race getRace() {
        return race;
    }

    public void setRace(Race race) {
        this.race = race;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getQrCode() {
        return qrCode;
    }

    public void setQrCode(String qrCode) {
        this.qrCode = qrCode;
    }

    public LocalDateTime getGenerationDate() {
        return generationDate;
    }

    public void setGenerationDate(LocalDateTime generationDate) {
        this.generationDate = generationDate;
    }

    /**
     * Méthode pour générer un QR code pour le dossard
     * Dans une implémentation réelle, cette méthode utiliserait une bibliothèque
     * pour générer un vrai QR code
     * Pour simplifier, nous retournons juste une chaîne représentant les
     * informations encodées
     */
    private String generateQRCode() {
        if (this.participant == null || this.race == null || this.number == null) {
            return null;
        }

        // Format : BIB_[Numéro de dossard]_[ID du participant]_[ID de la course]
        return "BIB_" + this.number + "_" + this.participant.getId() + "_" + this.race.getId();
    }

    /**
     * Méthode pour vérifier si le dossard est valide
     */
    public boolean isValid() {
        return this.participant != null && this.race != null && this.number != null && this.qrCode != null;
    }

    @Override
    public String toString() {
        return "BibNumber{" +
                "id=" + id +
                ", participant="
                + (participant != null ? participant.getFirstName() + " " + participant.getLastName() : "Unknown") +
                ", race=" + (race != null ? race.getName() : "Unknown") +
                ", number='" + number + '\'' +
                ", generationDate=" + generationDate +
                '}';
    }
}