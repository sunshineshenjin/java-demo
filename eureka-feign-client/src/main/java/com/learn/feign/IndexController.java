package com.learn.feign;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author shenjin
 * Date: 2019/7/30
 * Note: ...
 */
@RestController
public class IndexController {

    @Autowired
    private IndexService indexService;

    @RequestMapping("/feignIndexx")
    public String index(String name) {
        return indexService.sayHi(name);
    }
}
