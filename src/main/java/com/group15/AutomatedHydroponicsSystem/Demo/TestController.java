package com.group15.AutomatedHydroponicsSystem.Demo;


import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
public class TestController {
    public Object hello(){
        Map<String, String> object = new HashMap<>();
        object.put("name","Danujan");
        object.put("email","Danujan06@gmail.com");
        return object;
    }
}
