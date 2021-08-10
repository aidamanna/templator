package org.aida.templator;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DummyController {

    @GetMapping("/")
    public String execute() {
        return "This is a dummy endpoint!";
    }


}
