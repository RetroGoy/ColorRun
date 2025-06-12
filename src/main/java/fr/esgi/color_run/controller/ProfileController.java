package fr.esgi.color_run.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/profile")
public class ProfileController {

    @GetMapping
    public ModelAndView profile() {
        ModelAndView mav = new ModelAndView("profile");
        return mav;
    }
}