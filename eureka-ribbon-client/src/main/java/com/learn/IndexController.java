package com.learn;

import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

/**
 * @author shenjin
 * Date: 2019/7/29
 * Note: ...
 */
@RestController
public class IndexController {

    @Autowired
    RestTemplate restTemplate;

    @RequestMapping("/index")
    @HystrixCommand(fallbackMethod = "indexFallback")
    public String index() {
        String info = restTemplate.getForObject("http://eureka-client/user", String.class);
        return "ribbon_" + info;
    }

    public String indexFallback() {
        return "this is index fallBack handler result";
    }
}
