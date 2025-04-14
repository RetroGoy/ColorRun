<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                    <a class="nav-link ${pageContext.request.servletPath == '/index.jsp' ? 'active' : ''}" href="${pageContext.request.contextPath}/">Accueil</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${pageContext.request.servletPath == '/races' ? 'active' : ''}" href="${pageContext.request.contextPath}/races">Courses</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${pageContext.request.servletPath == '/about' ? 'active' : ''}" href="${pageContext.request.contextPath}/about">À propos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${pageContext.request.servletPath == '/contact' ? 'active' : ''}" href="${pageContext.request.contextPath}/contact">Contact</a>
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
                                <c:choose>
                                    <c:when test="${sessionScope.user.role == 'ADMIN'}">
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/dashboard">Tableau de bord</a></li>
                                    </c:when>
                                    <c:when test="${sessionScope.user.role == 'ORGANIZER'}">
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/organizer/dashboard">Tableau de bord</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/participant/dashboard">Mon profil</a></li>
                                    </c:otherwise>
                                </c:choose>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/my-races">Mes courses</a></li>
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

<!-- Styles communs pour toutes les pages -->
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
        min-height: 100vh;
        display: flex;
        flex-direction: column;
    }
    
    .content-wrapper {
        flex: 1;
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
        padding: 8px 20px;
        border-radius: 30px;
        transition: all 0.3s ease;
    }
    
    .btn-color-run:hover {
        transform: scale(1.05);
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
    }
    
    .progress-bar-container {
        width: 100%;
        height: 10px;
        background-color: #e9ecef;
        border-radius: 5px;
        overflow: hidden;
        margin-bottom: 5px;
    }
    
    .progress-bar {
        height: 100%;
        background: linear-gradient(90deg, 
            var(--color-purple), 
            var(--color-blue), 
            var(--color-green), 
            var(--color-yellow), 
            var(--color-orange), 
            var(--color-red));
    }
</style> 