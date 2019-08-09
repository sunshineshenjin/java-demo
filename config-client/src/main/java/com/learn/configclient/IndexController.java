package com.learn.configclient;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author shenjin
 * Date: 2019/8/2
 * Note: ...
 */
@RestController
public class IndexController {

    @Value("${foo}")
    private String fooValue;

    @RequestMapping("/index")
    public String index() {
        return "config client get value-" + fooValue;
    }
}
