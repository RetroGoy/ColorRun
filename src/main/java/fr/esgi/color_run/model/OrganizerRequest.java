package fr.esgi.color_run.model;

import java.time.LocalDateTime;

/**
 * Classe représentant une demande pour devenir organisateur
 */
public class OrganizerRequest {
    private Long id;
    private User requestingUser;
    private String motivation;
    private LocalDateTime requestDate;
    private RequestStatus status;
    private User reviewedBy;
    private LocalDateTime reviewDate;

    public enum RequestStatus {
        PENDING,
        APPROVED,
        REJECTED
    }

    public OrganizerRequest() {
        this.requestDate = LocalDateTime.now();
        this.status = RequestStatus.PENDING;
    }

    public OrganizerRequest(User requestingUser, String motivation) {
        this.requestingUser = requestingUser;
        this.motivation = motivation;
        this.requestDate = LocalDateTime.now();
        this.status = RequestStatus.PENDING;
    }

    // Getters et Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getRequestingUser() {
        return requestingUser;
    }

    public void setRequestingUser(User requestingUser) {
        this.requestingUser = requestingUser;
    }

    public String getMotivation() {
        return motivation;
    }

    public void setMotivation(String motivation) {
        this.motivation = motivation;
    }

    public LocalDateTime getRequestDate() {
        return requestDate;
    }

    public void setRequestDate(LocalDateTime requestDate) {
        this.requestDate = requestDate;
    }

    public RequestStatus getStatus() {
        return status;
    }

    public void setStatus(RequestStatus status) {
        this.status = status;
    }

    public User getReviewedBy() {
        return reviewedBy;
    }

    public void setReviewedBy(User reviewedBy) {
        this.reviewedBy = reviewedBy;
    }

    public LocalDateTime getReviewDate() {
        return reviewDate;
    }

    public void setReviewDate(LocalDateTime reviewDate) {
        this.reviewDate = reviewDate;
    }

    public void approve(User admin) {
        this.status = RequestStatus.APPROVED;
        this.reviewedBy = admin;
        this.reviewDate = LocalDateTime.now();
        if (this.requestingUser != null) {
            this.requestingUser.setRole(User.Role.ORGANIZER);
        }
    }

    public void reject(User admin) {
        this.status = RequestStatus.REJECTED;
        this.reviewedBy = admin;
        this.reviewDate = LocalDateTime.now();
    }

    @Override
    public String toString() {
        return "OrganizerRequest{" +
                "id=" + id +
                ", requestingUser=" + (requestingUser != null ? requestingUser.getEmail() : "Unknown") +
                ", status=" + status +
                ", requestDate=" + requestDate +
                ", reviewDate=" + reviewDate +
                '}';
    }
}