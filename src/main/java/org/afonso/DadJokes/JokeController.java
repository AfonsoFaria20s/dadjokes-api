package org.afonso.DadJokes;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.Random;

@RestController
public class JokeController {

   private List<Map<String, Object>> jokes;
   private static InputStream inputStream;

   public JokeController() {
      // Carrega as piadas do arquivo jokes_en.json durante a inicialização do
      // controlador

   }

   @GetMapping("/getjoke")
   public ResponseEntity<Map<String, Object>> getRandomJoke(
         @RequestParam(value = "lang", defaultValue = "en") String lang) {

      loadJokes(lang);

      if (jokes == null || jokes.isEmpty()) {
         return ResponseEntity.status(500).body(Map.of("error", "No jokes available"));
      }

      // Selecionar uma piada aleatória
      Random random = new Random();
      int randomIndex = random.nextInt(jokes.size());
      Map<String, Object> randomJoke = jokes.get(randomIndex);

      // Retornar a piada como JSON
      return ResponseEntity.ok(randomJoke);
   }

   public void loadJokes(String lang) {
      ObjectMapper mapper = new ObjectMapper();
      String fileName = "/jokes/" + lang.toString() + ".json";

      try {
         inputStream = getClass().getResourceAsStream(fileName);
         jokes = mapper.readValue(inputStream, new TypeReference<List<Map<String, Object>>>() {
         });
      } catch (IOException e) {
         e.printStackTrace();
      }
   }

}
