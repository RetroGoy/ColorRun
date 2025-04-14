<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<footer class="bg-dark text-white py-4 mt-auto">
    <div class="container">
        <div class="row">
            <div class="col-md-4 mb-3 mb-md-0">
                <h5>À propos de ColorRun</h5>
                <p class="text-muted">
                    Des courses colorées et festives pour tous ! Rejoignez-nous pour une expérience unique mêlant sport et divertissement.
                </p>
            </div>
            
            <div class="col-md-2 mb-3 mb-md-0">
                <h5>Liens</h5>
                <ul class="list-unstyled">
                    <li><a href="${pageContext.request.contextPath}/" class="text-muted">Accueil</a></li>
                    <li><a href="${pageContext.request.contextPath}/races" class="text-muted">Courses</a></li>
                    <li><a href="${pageContext.request.contextPath}/about" class="text-muted">À propos</a></li>
                    <li><a href="${pageContext.request.contextPath}/contact" class="text-muted">Contact</a></li>
                </ul>
            </div>
            
            <div class="col-md-3 mb-3 mb-md-0">
                <h5>Légal</h5>
                <ul class="list-unstyled">
                    <li><a href="${pageContext.request.contextPath}/terms" class="text-muted">Conditions d'utilisation</a></li>
                    <li><a href="${pageContext.request.contextPath}/privacy" class="text-muted">Politique de confidentialité</a></li>
                    <li><a href="${pageContext.request.contextPath}/cookies" class="text-muted">Gestion des cookies</a></li>
                </ul>
            </div>
            
            <div class="col-md-3">
                <h5>Nous suivre</h5>
                <div class="d-flex">
                    <a href="#" class="text-muted me-3"><i class="bi bi-facebook"></i></a>
                    <a href="#" class="text-muted me-3"><i class="bi bi-instagram"></i></a>
                    <a href="#" class="text-muted me-3"><i class="bi bi-twitter"></i></a>
                    <a href="#" class="text-muted"><i class="bi bi-youtube"></i></a>
                </div>
                <div class="mt-3">
                    <a href="${pageContext.request.contextPath}/newsletter" class="btn btn-outline-light btn-sm">S'abonner à la newsletter</a>
                </div>
            </div>
        </div>
        
        <hr class="my-4 bg-secondary">
        
        <div class="row align-items-center">
            <div class="col-md-6 text-center text-md-start">
                <p class="mb-0">&copy; 2025 ColorRun. Tous droits réservés.</p>
            </div>
            <div class="col-md-6 text-center text-md-end">
                <img src="${pageContext.request.contextPath}/resources/images/payment-methods.png" alt="Méthodes de paiement" class="img-fluid" style="max-height: 30px;">
            </div>
        </div>
    </div>
</footer>

<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"> 