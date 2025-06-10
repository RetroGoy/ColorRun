package fr.esgi.color_run.controller;

import fr.esgi.color_run.model.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AuthController {
    private static final Logger logger = LoggerFactory.getLogger(AuthController.class);

    @GetMapping("/login")
    public String login(@RequestParam(required = false) String error, Model model) {
        logger.info("Accessing login page");
        if (error != null) {
            model.addAttribute("error", "Identifiants invalides");
        }
        return "login";
    }

    @GetMapping("/register")
    public String register(Model model) {
        logger.info("Accessing register page");
        model.addAttribute("user", new User());
        return "register";
    }
}