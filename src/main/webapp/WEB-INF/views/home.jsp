<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ColorRun - Courses colorées</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.2/css/bootstrap.min.css">
    
    <!-- Styles spécifiques à la page d'accueil -->
    <style>
        .hero-section {
            position: relative;
            color: white;
            padding: 120px 0;
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('${pageContext.request.contextPath}/resources/images/hero-bg.jpg');
            background-size: cover;
            background-position: center;
        }
        
        .color-dot {
            width: 20px;
            height: 20px;
            border-radius: 50%;
            display: inline-block;
            margin-right: 10px;
        }
        
        .feature-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border-radius: 15px;
            overflow: hidden;
            border: none;
        }
        
        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }
        
        .event-card {
            border-radius: 15px;
            overflow: hidden;
            transition: transform 0.3s ease;
        }
        
        .event-card:hover {
            transform: translateY(-5px);
        }
        
        .event-image {
            height: 200px;
            object-fit: cover;
        }
        
        .testimonial-card {
            background-color: white;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }
        
        .testimonial-card img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 15px;
        }
        
        .cta-section {
            background: linear-gradient(90deg, var(--color-purple), var(--color-blue));
            color: white;
            padding: 80px 0;
            border-radius: 15px;
            margin: 50px 0;
        }
    </style>
</head>
<body>

<jsp:include page="../includes/header.jsp" />

<div class="content-wrapper">
    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container text-center">
            <h1 class="display-3 fw-bold mb-4">Courez. Colorez. Célébrez.</h1>
            <p class="lead mb-5">Rejoignez la communauté ColorRun pour des courses colorées uniques dans toute la France.</p>
            <div class="d-flex justify-content-center gap-3">
                <a href="${pageContext.request.contextPath}/races" class="btn btn-lg btn-color-run">Voir les courses</a>
                <a href="${pageContext.request.contextPath}/register" class="btn btn-lg btn-outline-light">S'inscrire</a>
            </div>
        </div>
    </section>
    
    <!-- Features Section -->
    <section class="py-5">
        <div class="container">
            <h2 class="text-center mb-5">Pourquoi participer à une ColorRun ?</h2>
            
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card h-100 feature-card shadow-sm">
                        <div class="card-body text-center p-4">
                            <div class="rounded-circle bg-primary text-white d-inline-flex align-items-center justify-content-center mb-3" style="width: 60px; height: 60px;">
                                <i class="bi bi-heart-fill fs-3"></i>
                            </div>
                            <h4 class="card-title">Pour le plaisir</h4>
                            <p class="card-text">Une course festive et décontractée, accessible à tous, où la bonne humeur est le maître-mot.</p>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card h-100 feature-card shadow-sm">
                        <div class="card-body text-center p-4">
                            <div class="rounded-circle bg-success text-white d-inline-flex align-items-center justify-content-center mb-3" style="width: 60px; height: 60px;">
                                <i class="bi bi-people-fill fs-3"></i>
                            </div>
                            <h4 class="card-title">Pour la convivialité</h4>
                            <p class="card-text">Participez en famille, entre amis ou entre collègues pour un moment de partage unique.</p>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card h-100 feature-card shadow-sm">
                        <div class="card-body text-center p-4">
                            <div class="rounded-circle bg-warning text-white d-inline-flex align-items-center justify-content-center mb-3" style="width: 60px; height: 60px;">
                                <i class="bi bi-heart-pulse-fill fs-3"></i>
                            </div>
                            <h4 class="card-title">Pour la santé</h4>
                            <p class="card-text">Pratiquez une activité physique dans un cadre ludique et sans pression de performance.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Upcoming Events Section -->
    <section class="py-5 bg-light">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2>Prochaines courses</h2>
                <a href="${pageContext.request.contextPath}/races" class="btn btn-outline-primary">Voir toutes les courses</a>
            </div>
            
            <div class="row g-4">
                <c:forEach items="${upcomingRaces}" var="race" end="2">
                    <div class="col-md-4">
                        <div class="card h-100 event-card shadow-sm">
                            <img src="${pageContext.request.contextPath}/resources/images/course-${race.id}.jpg" class="event-image" alt="${race.name}" onerror="this.src='${pageContext.request.contextPath}/resources/images/course-placeholder-1.jpg'">
                            <div class="card-body">
                                <h5 class="card-title">${race.name}</h5>
                                <p class="card-text mb-1">
                                    <i class="bi bi-calendar-event"></i> 
                                    <fmt:formatDate value="${race.dateTime}" pattern="dd MMMM yyyy" />
                                </p>
                                <p class="card-text mb-1">
                                    <i class="bi bi-geo-alt"></i> ${race.location}
                                </p>
                                <p class="card-text mb-3">
                                    <i class="bi bi-rulers"></i> ${race.distance} km
                                </p>
                                <div class="d-grid">
                                    <a href="${pageContext.request.contextPath}/races/${race.id}" class="btn btn-outline-primary">Voir les détails</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                
                <!-- Événements statiques si aucune course n'est disponible -->
                <c:if test="${empty upcomingRaces}">
                    <div class="col-md-4">
                        <div class="card h-100 event-card shadow-sm">
                            <img src="${pageContext.request.contextPath}/resources/images/course-placeholder-1.jpg" class="event-image" alt="ColorRun Paris" onerror="this.src='${pageContext.request.contextPath}/resources/images/course-placeholder-1.jpg'">
                            <div class="card-body">
                                <h5 class="card-title">ColorRun Paris</h5>
                                <p class="card-text mb-1">
                                    <i class="bi bi-calendar-event"></i> 15 mai 2025
                                </p>
                                <p class="card-text mb-1">
                                    <i class="bi bi-geo-alt"></i> Parc de la Villette, Paris
                                </p>
                                <p class="card-text mb-3">
                                    <i class="bi bi-rulers"></i> 5 km
                                </p>
                                <div class="d-grid">
                                    <a href="${pageContext.request.contextPath}/races/1" class="btn btn-outline-primary">Voir les détails</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-4">
                        <div class="card h-100 event-card shadow-sm">
                            <img src="${pageContext.request.contextPath}/resources/images/course-placeholder-2.jpg" class="event-image" alt="ColorRun Lyon" onerror="this.src='${pageContext.request.contextPath}/resources/images/course-placeholder-2.jpg'">
                            <div class="card-body">
                                <h5 class="card-title">ColorRun Lyon</h5>
                                <p class="card-text mb-1">
                                    <i class="bi bi-calendar-event"></i> 22 mai 2025
                                </p>
                                <p class="card-text mb-1">
                                    <i class="bi bi-geo-alt"></i> Parc de la Tête d'Or, Lyon
                                </p>
                                <p class="card-text mb-3">
                                    <i class="bi bi-rulers"></i> 10 km
                                </p>
                                <div class="d-grid">
                                    <a href="${pageContext.request.contextPath}/races/2" class="btn btn-outline-primary">Voir les détails</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-4">
                        <div class="card h-100 event-card shadow-sm">
                            <img src="${pageContext.request.contextPath}/resources/images/course-placeholder-3.jpg" class="event-image" alt="ColorRun Marseille" onerror="this.src='${pageContext.request.contextPath}/resources/images/course-placeholder-3.jpg'">
                            <div class="card-body">
                                <h5 class="card-title">ColorRun Marseille</h5>
                                <p class="card-text mb-1">
                                    <i class="bi bi-calendar-event"></i> 5 juin 2025
                                </p>
                                <p class="card-text mb-1">
                                    <i class="bi bi-geo-alt"></i> Plages du Prado, Marseille
                                </p>
                                <p class="card-text mb-3">
                                    <i class="bi bi-rulers"></i> 7 km
                                </p>
                                <div class="d-grid">
                                    <a href="${pageContext.request.contextPath}/races/3" class="btn btn-outline-primary">Voir les détails</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </section>
    
    <!-- Testimonials Section -->
    <section class="py-5">
        <div class="container">
            <h2 class="text-center mb-5">Ce que nos participants disent</h2>
            
            <div class="row">
                <div class="col-md-4">
                    <div class="testimonial-card">
                        <div class="d-flex align-items-center mb-3">
                            <img src="${pageContext.request.contextPath}/resources/images/participant-1.jpg" alt="Participant" onerror="this.src='${pageContext.request.contextPath}/resources/images/participant-placeholder.jpg'">
                            <div>
                                <h5 class="mb-0">Sophie D.</h5>
                                <p class="text-muted mb-0">Paris</p>
                            </div>
                        </div>
                        <p class="mb-0">"Une expérience incroyable ! L'ambiance était fantastique, et les couleurs ont rendu cette course vraiment unique. Je reviendrai l'année prochaine !"</p>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="testimonial-card">
                        <div class="d-flex align-items-center mb-3">
                            <img src="${pageContext.request.contextPath}/resources/images/participant-2.jpg" alt="Participant" onerror="this.src='${pageContext.request.contextPath}/resources/images/participant-placeholder.jpg'">
                            <div>
                                <h5 class="mb-0">Thomas M.</h5>
                                <p class="text-muted mb-0">Lyon</p>
                            </div>
                        </div>
                        <p class="mb-0">"J'ai participé avec toute ma famille, même mes enfants ont adoré ! Une façon ludique de faire du sport tous ensemble. Organisation parfaite !"</p>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="testimonial-card">
                        <div class="d-flex align-items-center mb-3">
                            <img src="${pageContext.request.contextPath}/resources/images/participant-3.jpg" alt="Participant" onerror="this.src='${pageContext.request.contextPath}/resources/images/participant-placeholder.jpg'">
                            <div>
                                <h5 class="mb-0">Julie L.</h5>
                                <p class="text-muted mb-0">Marseille</p>
                            </div>
                        </div>
                        <p class="mb-0">"Ce n'était pas une course, mais une fête ! J'ai rencontré des personnes formidables et passé un moment inoubliable. Je me suis déjà inscrite pour la prochaine édition !"</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Call to Action Section -->
    <section class="container">
        <div class="cta-section">
            <div class="container text-center">
                <h2 class="mb-4">Prêt à vivre l'expérience ColorRun ?</h2>
                <p class="lead mb-4">Inscrivez-vous dès maintenant et rejoignez la course la plus colorée de l'année !</p>
                <div class="d-flex justify-content-center gap-3">
                    <a href="${pageContext.request.contextPath}/races" class="btn btn-light btn-lg">Voir les courses</a>
                    <a href="${pageContext.request.contextPath}/register" class="btn btn-outline-light btn-lg">S'inscrire</a>
                </div>
            </div>
        </div>
    </section>
</div>

<jsp:include page="../includes/footer.jsp" />

<!-- Bootstrap JS & jQuery -->
<script src="${pageContext.request.contextPath}/webjars/jquery/3.7.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>

<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

</body>
</html> 