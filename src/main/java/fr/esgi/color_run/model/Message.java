package fr.esgi.color_run.model;

import java.time.LocalDateTime;

/**
 * Classe représentant un message dans le fil de discussion d'une course
 */
public class Message {
    private Long id;
    private String content;
    private LocalDateTime timestamp;
    private User author;
    private Race race;

    public Message() {
        this.timestamp = LocalDateTime.now();
    }

    public Message(String content, User author, Race race) {
        this.content = content;
        this.author = author;
        this.race = race;
        this.timestamp = LocalDateTime.now();
    }

    // Getters et Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public LocalDateTime getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(LocalDateTime timestamp) {
        this.timestamp = timestamp;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public Race getRace() {
        return race;
    }

    public void setRace(Race race) {
        this.race = race;
    }

    @Override
    public String toString() {
        return "Message{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", timestamp=" + timestamp +
                ", author=" + (author != null ? author.getFirstName() + " " + author.getLastName() : "Unknown") +
                '}';
    }
}