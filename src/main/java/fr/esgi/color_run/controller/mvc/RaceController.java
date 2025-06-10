package fr.esgi.color_run.controller.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/races")
public class RaceController {

    @GetMapping
    public String listRaces(Model model) {
        // Données statiques pour la liste des courses
        List<Map<String, Object>> races = new ArrayList<>();

        Map<String, Object> race1 = new HashMap<>();
        race1.put("id", 1);
        race1.put("name", "ColorRun Paris");
        race1.put("date", "15 Mai 2025");
        race1.put("location", "Parc de la Villette");
        race1.put("distance", 5);
        race1.put("price", 25.0);
        race1.put("participantsCount", 150);
        race1.put("maxParticipants", 500);
        race1.put("description", "Une course colorée au cœur de Paris");
        races.add(race1);

        Map<String, Object> race2 = new HashMap<>();
        race2.put("id", 2);
        race2.put("name", "ColorRun Lyon");
        race2.put("date", "22 Juin 2025");
        race2.put("location", "Parc de la Tête d'Or");
        race2.put("distance", 7);
        race2.put("price", 30.0);
        race2.put("participantsCount", 200);
        race2.put("maxParticipants", 600);
        race2.put("description", "Découvrez Lyon en couleurs");
        races.add(race2);

        Map<String, Object> race3 = new HashMap<>();
        race3.put("id", 3);
        race3.put("name", "ColorRun Marseille");
        race3.put("date", "8 Juillet 2025");
        race3.put("location", "Parc Borély");
        race3.put("distance", 10);
        race3.put("price", 35.0);
        race3.put("participantsCount", 100);
        race3.put("maxParticipants", 400);
        race3.put("description", "Course colorée face à la Méditerranée");
        races.add(race3);

        model.addAttribute("races", races);
        return "races";
    }

    @GetMapping("/{id}")
    public String raceDetails(@PathVariable int id, Model model) {
        // Données statiques pour les détails d'une course
        Map<String, Object> race = new HashMap<>();
        race.put("id", id);
        race.put("name", "ColorRun Paris");
        race.put("date", "15 Mai 2025");
        race.put("time", "10:00");
        race.put("location", "Parc de la Villette");
        race.put("distance", 5);
        race.put("price", 25.0);
        race.put("participantsCount", 150);
        race.put("maxParticipants", 500);
        race.put("description",
                "Rejoignez-nous pour une expérience unique au cœur de Paris ! Cette course de 5km vous fera traverser le magnifique Parc de la Villette tout en étant aspergé de poudres colorées 100% naturelles. Une ambiance festive et musicale vous accompagnera tout au long du parcours.");
        race.put("requirements",
                "- Être âgé de 12 ans minimum\n- Porter des vêtements blancs\n- Apporter une bonne humeur contagieuse");
        race.put("schedule",
                "08:00 - Ouverture du village\n09:00 - Échauffement collectif\n10:00 - Départ de la course\n11:30 - Début des animations\n12:00 - Remise des prix");
        race.put("latitude", 48.8937);
        race.put("longitude", 2.3900);

        model.addAttribute("race", race);
        return "race_details";
    }
}