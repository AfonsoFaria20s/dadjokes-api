package org.afonso.DadJokes;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HealthCheck {

   @GetMapping("/health")
   public ResponseEntity<String> healthCheck() {
      return ResponseEntity.ok("Program is working!");
   }

}
