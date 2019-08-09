package com.learn;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author shenjin
 * Date: 2019/7/29
 * Note: ...
 */
@RestController
public class UserController {

    @RequestMapping("/user")
    public String getMessage() {
        return "This is eureka client, my port is:" + System.getenv("port");
    }
}
