<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Color Run - Connexion</title>
    
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
        
        .login-card {
            max-width: 500px;
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
                <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-light me-2 active">Connexion</a>
                <a href="${pageContext.request.contextPath}/register" class="btn btn-color-run">Inscription</a>
            </div>
        </div>
    </div>
</nav>

<div class="content-wrapper">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="login-card">
                    <div class="color-dots">
                        <div class="dot purple"></div>
                        <div class="dot blue"></div>
                        <div class="dot green"></div>
                        <div class="dot yellow"></div>
                        <div class="dot orange"></div>
                        <div class="dot red"></div>
                    </div>
                    
                    <h2 class="text-center mb-4 mt-3">Connexion</h2>
                    
                    <!-- Message d'erreur (affiché conditionnellement) -->
                    <% if (request.getAttribute("errorMessage") != null) { %>
                    <div class="alert alert-danger" role="alert">
                        <%= request.getAttribute("errorMessage") %>
                    </div>
                    <% } %>
                    
                    <form action="${pageContext.request.contextPath}/login" method="post">
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Mot de passe</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="rememberMe" name="rememberMe">
                            <label class="form-check-label" for="rememberMe">Se souvenir de moi</label>
                        </div>
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-color-run">Se connecter</button>
                        </div>
                    </form>
                    
                    <div class="text-center mt-3">
                        <a href="${pageContext.request.contextPath}/forgot-password" class="text-decoration-none">Mot de passe oublié ?</a>
                    </div>
                    
                    <hr class="my-4">
                    
                    <div class="text-center">
                        <p>Vous n'avez pas de compte ?</p>
                        <a href="${pageContext.request.contextPath}/register" class="btn btn-outline-dark">Créer un compte</a>
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

</body>
</html> 