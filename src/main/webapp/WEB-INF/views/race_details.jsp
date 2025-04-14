<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ColorRun - ${race.name}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
</head>
<body>
    <jsp:include page="../includes/header.jsp" />
    
    <div class="container mt-5">
        <div class="row">
            <div class="col-lg-8">
                <div class="card shadow-sm mb-4">
                    <div class="card-body">
                        <h1 class="text-primary">${race.name}</h1>
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <span class="badge bg-primary">${race.raceType}</span>
                            <span class="text-muted">
                                <fmt:formatDate value="${race.date}" pattern="dd MMMM yyyy" /> à 
                                <fmt:formatDate value="${race.date}" pattern="HH:mm" />
                            </span>
                        </div>
                        
                        <div class="mb-3">
                            <h5>Description</h5>
                            <p>${race.description}</p>
                        </div>
                        
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <h5>Lieu</h5>
                                <p>${race.location}</p>
                            </div>
                            <div class="col-md-6">
                                <h5>Distance</h5>
                                <p>${race.distance} km</p>
                            </div>
                        </div>
                        
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <h5>Prix</h5>
                                <p>${race.price} €</p>
                            </div>
                            <div class="col-md-6">
                                <h5>Organisateur</h5>
                                <p>${race.organizer.name}</p>
                            </div>
                        </div>
                        
                        <div class="mb-4">
                            <h5>Progression des inscriptions</h5>
                            <div class="progress-bar-container">
                                <c:set var="progressPercentage" value="${race.participants.size() * 100.0 / race.maxParticipants}" />
                                <div class="progress-bar"></div>
                            </div>
                            <small class="text-muted">${race.participants.size()} / ${race.maxParticipants} participants</small>
                        </div>
                        
                        <c:choose>
                            <c:when test="${isParticipant}">
                                <div class="alert alert-success">
                                    Vous êtes inscrit à cette course !
                                </div>
                                <form action="<c:url value='/races/${race.id}/unregister'/>" method="post">
                                    <button type="submit" class="btn btn-outline-danger">Se désinscrire</button>
                                </form>
                            </c:when>
                            <c:when test="${race.participants.size() < race.maxParticipants}">
                                <form action="<c:url value='/races/${race.id}/register'/>" method="post">
                                    <button type="submit" class="btn btn-primary">S'inscrire</button>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <div class="alert alert-warning">
                                    Les inscriptions sont complètes pour cette course.
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-4">
                <div class="card shadow-sm mb-4">
                    <div class="card-body">
                        <h5 class="card-title">Informations complémentaires</h5>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item d-flex justify-content-between">
                                <span>Âge minimum</span>
                                <span>${race.minAge} ans</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between">
                                <span>Nombre de points colorés</span>
                                <span>${race.colorPoints}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between">
                                <span>Certificat médical requis</span>
                                <span>${race.medicalCertificateRequired ? 'Oui' : 'Non'}</span>
                            </li>
                        </ul>
                    </div>
                </div>
                
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Partager</h5>
                        <div class="d-flex justify-content-around mt-3">
                            <a href="#" class="text-primary"><i class="bi bi-facebook"></i></a>
                            <a href="#" class="text-info"><i class="bi bi-twitter"></i></a>
                            <a href="#" class="text-success"><i class="bi bi-whatsapp"></i></a>
                            <a href="#" class="text-secondary"><i class="bi bi-envelope"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row mt-4">
            <div class="col-12">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Liste des participants</h5>
                        <c:choose>
                            <c:when test="${not empty race.participants}">
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>Nom</th>
                                                <th>Prénom</th>
                                                <th>Date d'inscription</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${race.participants}" var="participant">
                                                <tr>
                                                    <td>${participant.lastName}</td>
                                                    <td>${participant.firstName}</td>
                                                    <td><fmt:formatDate value="${participant.registrationDate}" pattern="dd/MM/yyyy" /></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <p class="text-center mt-3">Aucun participant inscrit pour le moment.</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <jsp:include page="../includes/footer.jsp" />
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="<c:url value='/resources/js/main.js'/>"></script>
</body>
</html>