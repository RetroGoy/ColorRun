<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Color Run - Courses</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.2/css/bootstrap.min.css">
    
    <!-- Styles personnalisés -->
    <style>
        :root {
            --color-purple: #8E44AD;
            --color-blue: #3498DB;
            --color-green: #2ECC71;
            --color-yellow: #F1C40F;
            --color-orange: #E67E22;
            --color-red: #E74C3C;
        }
        
        body {
            font-family: 'Montserrat', sans-serif;
            background-color: #f8f9fa;
        }
        
        .hero-section {
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), 
                        url('https://images.unsplash.com/photo-1587384474964-3a06ce1ce699?ixlib=rb-4.0.3');
            background-size: cover;
            background-position: center;
            color: white;
            text-align: center;
            padding: 60px 0;
            position: relative;
            overflow: hidden;
        }
        
        .color-dot {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            position: absolute;
            opacity: 0.7;
            animation: float 5s infinite ease-in-out;
        }
        
        @keyframes float {
            0%, 100% { transform: translateY(0) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(10deg); }
        }
        
        .btn-color-run {
            background: linear-gradient(90deg, 
                var(--color-purple), 
                var(--color-blue), 
                var(--color-green), 
                var(--color-yellow), 
                var(--color-orange), 
                var(--color-red));
            color: white;
            border: none;
            font-weight: bold;
            padding: 12px 30px;
            border-radius: 30px;
            position: relative;
            overflow: hidden;
            z-index: 1;
            transition: all 0.3s ease;
        }
        
        .btn-color-run:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        
        .race-card {
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            height: 100%;
            border: none;
        }
        
        .race-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        }
        
        .race-card .card-header {
            background: linear-gradient(90deg, var(--color-purple), var(--color-blue));
            color: white;
            font-weight: bold;
            border: none;
            padding: 15px;
        }
        
        .race-info {
            padding: 8px 0;
        }
        
        .race-info i {
            width: 20px;
            text-align: center;
            margin-right: 10px;
            color: var(--color-blue);
        }
        
        .purple { color: var(--color-purple); }
        .blue { color: var(--color-blue); }
        .green { color: var(--color-green); }
        .yellow { color: var(--color-yellow); }
        .orange { color: var(--color-orange); }
        .red { color: var(--color-red); }
        
        .bg-purple { background-color: var(--color-purple); }
        .bg-blue { background-color: var(--color-blue); }
        .bg-green { background-color: var(--color-green); }
        .bg-yellow { background-color: var(--color-yellow); }
        .bg-orange { background-color: var(--color-orange); }
        .bg-red { background-color: var(--color-red); }
        
        .filter-section {
            background-color: white;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 30px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
        }
        
        .filter-label {
            font-weight: bold;
            margin-bottom: 8px;
            color: #444;
        }
        
        .form-control:focus, .form-select:focus {
            border-color: var(--color-purple);
            box-shadow: 0 0 0 0.25rem rgba(142, 68, 173, 0.25);
        }
        
        footer {
            background-color: #343a40;
            color: white;
            padding: 30px 0;
            margin-top: 50px;
        }
        
        .filter-card {
            border-radius: 15px;
            overflow: hidden;
        }
        
        .race-image {
            height: 200px;
            object-fit: cover;
        }
        
        .badge-race-type {
            position: absolute;
            top: 10px;
            right: 10px;
        }
        
        .race-price {
            font-size: 1.25rem;
            font-weight: bold;
        }
        
        .race-date-badge {
            position: absolute;
            top: 10px;
            left: 10px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 5px;
            padding: 5px 10px;
            font-weight: bold;
        }
        
        .race-status {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            padding: 8px;
            text-align: center;
            color: white;
            font-weight: bold;
        }
        
        .status-open {
            background-color: rgba(46, 204, 113, 0.8);
        }
        
        .status-almost-full {
            background-color: rgba(241, 196, 15, 0.8);
        }
        
        .status-full {
            background-color: rgba(231, 76, 60, 0.8);
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">
            <span style="color: var(--color-red);">C</span>
            <span style="color: var(--color-orange);">o</span>
            <span style="color: var(--color-yellow);">l</span>
            <span style="color: var(--color-green);">o</span>
            <span style="color: var(--color-blue);">r</span>
            <span style="color: var(--color-purple);">Run</span>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/">Accueil</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="${pageContext.request.contextPath}/races">Courses</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/about">À propos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/contact">Contact</a>
                </li>
            </ul>
            <div class="d-flex">
                <c:choose>
                    <c:when test="${empty sessionScope.user}">
                        <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-light me-2">Connexion</a>
                        <a href="${pageContext.request.contextPath}/register" class="btn btn-color-run">Inscription</a>
                    </c:when>
                    <c:otherwise>
                        <div class="dropdown">
                            <button class="btn btn-outline-light dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                                ${sessionScope.user.firstName} ${sessionScope.user.lastName}
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/profile">Mon profil</a></li>
                                <c:if test="${sessionScope.user.role == 'PARTICIPANT'}">
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/participant/dashboard">Mon tableau de bord</a></li>
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/become-organizer">Devenir organisateur</a></li>
                                </c:if>
                                <c:if test="${sessionScope.user.role == 'ORGANIZER'}">
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/organizer/dashboard">Tableau de bord organisateur</a></li>
                                </c:if>
                                <c:if test="${sessionScope.user.role == 'ADMIN'}">
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/dashboard">Administration</a></li>
                                </c:if>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Déconnexion</a></li>
                            </ul>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</nav>

<section class="hero-section">
    <!-- Dots colorés animés -->
    <div class="color-dot bg-purple" style="top: 20%; left: 10%;"></div>
    <div class="color-dot bg-blue" style="top: 40%; left: 20%; animation-delay: 0.5s;"></div>
    <div class="color-dot bg-green" style="top: 60%; left: 30%; animation-delay: 1s;"></div>
    <div class="color-dot bg-yellow" style="top: 70%; left: 70%; animation-delay: 1.5s;"></div>
    <div class="color-dot bg-orange" style="top: 30%; left: 80%; animation-delay: 2s;"></div>
    <div class="color-dot bg-red" style="top: 50%; left: 90%; animation-delay: 2.5s;"></div>
    
    <div class="container">
        <h1 class="display-4 fw-bold mb-4">Découvrez toutes nos courses</h1>
        <p class="lead mb-0">Trouvez la Color Run parfaite pour vous et rejoignez l'aventure colorée !</p>
    </div>
</section>

<div class="container mt-5 mb-5">
    <div class="row mb-4">
        <div class="col-md-8">
            <h1>Trouvez votre prochaine course colorée</h1>
            <p class="lead">Découvrez toutes nos courses et filtrez selon vos préférences.</p>
        </div>
        <div class="col-md-4 d-flex align-items-center justify-content-end">
            <div class="dropdown">
                <button class="btn btn-outline-primary dropdown-toggle" type="button" id="sortDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                    Trier par
                </button>
                <ul class="dropdown-menu" aria-labelledby="sortDropdown">
                    <li><a class="dropdown-item ${param.sortBy == 'date' ? 'active' : ''}" href="?sortBy=date">Date (prochainement)</a></li>
                    <li><a class="dropdown-item ${param.sortBy == 'city' ? 'active' : ''}" href="?sortBy=city">Ville (A-Z)</a></li>
                    <li><a class="dropdown-item ${param.sortBy == 'distance' ? 'active' : ''}" href="?sortBy=distance">Distance (croissante)</a></li>
                    <li><a class="dropdown-item ${param.sortBy == 'price' ? 'active' : ''}" href="?sortBy=price">Prix (croissant)</a></li>
                </ul>
            </div>
        </div>
    </div>
    
    <div class="row">
        <!-- Filtres -->
        <div class="col-lg-3 mb-4">
            <div class="card filter-card shadow-sm">
                <div class="card-header bg-primary text-white">
                    <h5 class="mb-0">Filtres</h5>
                </div>
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/races" method="get" id="filterForm">
                        <!-- Date -->
                        <div class="mb-3">
                            <label for="date" class="form-label">Date</label>
                            <input type="date" class="form-control" id="date" name="date" value="${param.date}">
                        </div>
                        
                        <!-- Ville -->
                        <div class="mb-3">
                            <label for="city" class="form-label">Ville</label>
                            <select class="form-select" id="city" name="city">
                                <option value="">Toutes les villes</option>
                                <c:forEach items="${cities}" var="city">
                                    <option value="${city}" ${param.city == city ? 'selected' : ''}>${city}</option>
                                </c:forEach>
                            </select>
                        </div>
                        
                        <!-- Distance -->
                        <div class="mb-3">
                            <label for="distance" class="form-label">Distance</label>
                            <select class="form-select" id="distance" name="distance">
                                <option value="">Toutes les distances</option>
                                <c:forEach items="${distances}" var="distance">
                                    <option value="${distance}" ${param.distance == distance ? 'selected' : ''}>${distance} km</option>
                                </c:forEach>
                            </select>
                        </div>
                        
                        <!-- Places disponibles -->
                        <div class="mb-3">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="true" id="availableOnly" name="availableOnly" ${param.availableOnly ? 'checked' : ''}>
                                <label class="form-check-label" for="availableOnly">
                                    Places disponibles uniquement
                                </label>
                            </div>
                        </div>
                        
                        <input type="hidden" name="sortBy" value="${param.sortBy}">
                        
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary">Appliquer les filtres</button>
                            <a href="${pageContext.request.contextPath}/races" class="btn btn-outline-secondary">Réinitialiser</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
        <!-- Liste des courses -->
        <div class="col-lg-9">
            <c:choose>
                <c:when test="${empty races}">
                    <div class="alert alert-info text-center p-5">
                        <i class="bi bi-exclamation-circle fs-1 mb-3"></i>
                        <h4>Aucune course ne correspond à vos critères</h4>
                        <p>Essayez de modifier vos filtres ou revenez plus tard pour de nouvelles courses.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="row g-4">
                        <c:forEach items="${races}" var="race">
                            <div class="col-md-6 col-lg-4">
                                <div class="card race-card shadow-sm h-100">
                                    <div class="position-relative">
                                        <img src="${pageContext.request.contextPath}/resources/images/course-${race.id}.jpg" class="race-image w-100" alt="${race.name}" onerror="this.src='${pageContext.request.contextPath}/resources/images/course-placeholder.jpg'">
                                        <span class="race-date-badge">
                                            <fmt:formatDate value="${race.dateTime}" pattern="dd MMM yyyy" />
                                        </span>
                                        <span class="badge bg-primary badge-race-type">${race.raceType}</span>
                                        
                                        <c:set var="percentFull" value="${race.participants.size() * 100 / race.maxParticipants}" />
                                        <c:choose>
                                            <c:when test="${percentFull >= 100}">
                                                <div class="race-status status-full">Complet</div>
                                            </c:when>
                                            <c:when test="${percentFull >= 80}">
                                                <div class="race-status status-almost-full">Presque complet</div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="race-status status-open">Inscriptions ouvertes</div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title">${race.name}</h5>
                                        <p class="card-text mb-1">
                                            <i class="bi bi-geo-alt"></i> ${race.location}
                                        </p>
                                        <p class="card-text mb-1">
                                            <i class="bi bi-rulers"></i> ${race.distance} km
                                        </p>
                                        <div class="d-flex justify-content-between align-items-center mt-3">
                                            <span class="race-price">${race.price} €</span>
                                            <a href="${pageContext.request.contextPath}/races/${race.id}" class="btn btn-primary">Détails</a>
                                        </div>
                                    </div>
                                    <div class="card-footer bg-white">
                                        <div class="progress-bar-container">
                                            <c:set var="progressPercentage" value="${race.participants.size() * 100.0 / race.maxParticipants}" />
                                            <div class="progress-bar" ></div>
                                        </div>
                                        <small class="text-muted">${race.participants.size()} / ${race.maxParticipants} participants</small>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h5>À propos de Color Run</h5>
                <p>Color Run organise des courses colorées et amusantes partout en France, offrant une expérience unique et mémorable.</p>
            </div>
            <div class="col-md-4">
                <h5>Liens rapides</h5>
                <ul class="list-unstyled">
                    <li><a href="${pageContext.request.contextPath}/races" class="text-white">Courses</a></li>
                    <li><a href="${pageContext.request.contextPath}/about" class="text-white">À propos</a></li>
                    <li><a href="${pageContext.request.contextPath}/faq" class="text-white">FAQ</a></li>
                    <li><a href="${pageContext.request.contextPath}/contact" class="text-white">Contact</a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <h5>Restez connecté</h5>
                <p>Suivez-nous sur les réseaux sociaux pour ne pas manquer nos prochains événements !</p>
                <div class="d-flex gap-3">
                    <a href="#" class="text-white"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="text-white"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="text-white"><i class="fab fa-twitter"></i></a>
                </div>
            </div>
        </div>
        <hr class="my-4 bg-white">
        <div class="text-center">
            <p class="mb-0">&copy; 2025 Color Run. Tous droits réservés.</p>
        </div>
    </div>
</footer>

<!-- Bootstrap JS et Font Awesome -->
<script src="${pageContext.request.contextPath}/webjars/jquery/3.7.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

<script>
    // Script pour mettre à jour le tri lorsqu'il change
    document.getElementById('sortDropdown').addEventListener('change', function() {
        document.getElementById('filterForm').submit();
    });
    
    // Soumission automatique du formulaire quand les filtres changent
    document.querySelectorAll('#filterForm select, #filterForm input[type="checkbox"]').forEach(function(element) {
        element.addEventListener('change', function() {
            document.getElementById('filterForm').submit();
        });
    });
</script>

</body>
</html> 