<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Color Run - Inscription</title>
    
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
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        
        .content-wrapper {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 0;
        }
        
        .register-card {
            max-width: 600px;
            width: 100%;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            background-color: white;
            position: relative;
            overflow: hidden;
        }
        
        .color-dots {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 8px;
            display: flex;
        }
        
        .color-dots .dot {
            flex: 1;
            height: 8px;
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
        
        .purple { background-color: var(--color-purple); }
        .blue { background-color: var(--color-blue); }
        .green { background-color: var(--color-green); }
        .yellow { background-color: var(--color-yellow); }
        .orange { background-color: var(--color-orange); }
        .red { background-color: var(--color-red); }
        
        footer {
            background-color: #343a40;
            color: white;
            padding: 20px 0;
            margin-top: auto;
        }
        
        .form-control:focus {
            border-color: var(--color-purple);
            box-shadow: 0 0 0 0.25rem rgba(142, 68, 173, 0.25);
        }
        
        .password-strength {
            height: 5px;
            border-radius: 5px;
            margin-top: 5px;
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
                    <a class="nav-link" href="${pageContext.request.contextPath}/races">Courses</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/about">À propos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/contact">Contact</a>
                </li>
            </ul>
            <div class="d-flex">
                <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-light me-2">Connexion</a>
                <a href="${pageContext.request.contextPath}/register" class="btn btn-color-run active">Inscription</a>
            </div>
        </div>
    </div>
</nav>

<div class="content-wrapper">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="register-card">
                    <div class="color-dots">
                        <div class="dot purple"></div>
                        <div class="dot blue"></div>
                        <div class="dot green"></div>
                        <div class="dot yellow"></div>
                        <div class="dot orange"></div>
                        <div class="dot red"></div>
                    </div>
                    
                    <h2 class="text-center mb-4 mt-3">Inscription</h2>
                    
                    <!-- Message d'erreur (affiché conditionnellement) -->
                    <% if (request.getAttribute("errorMessage") != null) { %>
                    <div class="alert alert-danger" role="alert">
                        <%= request.getAttribute("errorMessage") %>
                    </div>
                    <% } %>
                    
                    <form action="${pageContext.request.contextPath}/register" method="post" id="registerForm">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="firstName" class="form-label">Prénom</label>
                                    <input type="text" class="form-control" id="firstName" name="firstName" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="lastName" class="form-label">Nom</label>
                                    <input type="text" class="form-control" id="lastName" name="lastName" required>
                                </div>
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="password" class="form-label">Mot de passe</label>
                            <input type="password" class="form-control" id="password" name="password" required minlength="8" onkeyup="checkPasswordStrength()">
                            <div class="password-strength bg-secondary" id="passwordStrength"></div>
                            <small class="form-text text-muted">Le mot de passe doit contenir au moins 8 caractères.</small>
                        </div>
                        
                        <div class="mb-3">
                            <label for="confirmPassword" class="form-label">Confirmer le mot de passe</label>
                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                        </div>
                        
                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="acceptTerms" name="acceptTerms" required>
                            <label class="form-check-label" for="acceptTerms">J'accepte les <a href="${pageContext.request.contextPath}/terms" target="_blank">conditions d'utilisation</a> et la <a href="${pageContext.request.contextPath}/privacy" target="_blank">politique de confidentialité</a>.</label>
                        </div>
                        
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-color-run">Créer un compte</button>
                        </div>
                    </form>
                    
                    <hr class="my-4">
                    
                    <div class="text-center">
                        <p>Vous avez déjà un compte ?</p>
                        <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-dark">Se connecter</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<footer>
    <div class="container">
        <div class="text-center">
            <p class="mb-0">&copy; 2025 Color Run. Tous droits réservés.</p>
        </div>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="${pageContext.request.contextPath}/webjars/jquery/3.7.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>

<!-- Script pour vérifier la force du mot de passe et la confirmation -->
<script>
    function checkPasswordStrength() {
        const password = document.getElementById('password').value;
        const strengthBar = document.getElementById('passwordStrength');
        
        // Réinitialiser la barre
        strengthBar.style.width = '0%';
        
        if (password.length === 0) {
            strengthBar.style.width = '0%';
            strengthBar.className = 'password-strength bg-secondary';
            return;
        }
        
        // Calculer la force du mot de passe
        let strength = 0;
        
        // Longueur
        if (password.length >= 8) strength += 25;
        
        // Lettres majuscules et minuscules
        if (password.match(/[a-z]/)) strength += 15;
        if (password.match(/[A-Z]/)) strength += 15;
        
        // Chiffres
        if (password.match(/[0-9]/)) strength += 20;
        
        // Caractères spéciaux
        if (password.match(/[^a-zA-Z0-9]/)) strength += 25;
        
        // Mettre à jour la barre de force
        strengthBar.style.width = strength + '%';
        
        // Changer la couleur en fonction de la force
        if (strength < 30) {
            strengthBar.className = 'password-strength bg-danger';
        } else if (strength < 60) {
            strengthBar.className = 'password-strength bg-warning';
        } else {
            strengthBar.className = 'password-strength bg-success';
        }
    }
    
    // Vérifier si les mots de passe correspondent
    document.getElementById('registerForm').addEventListener('submit', function(e) {
        const password = document.getElementById('password').value;
        const confirmPassword = document.getElementById('confirmPassword').value;
        
        if (password !== confirmPassword) {
            e.preventDefault();
            alert('Les mots de passe ne correspondent pas.');
        }
    });
</script>

</body>
</html> 