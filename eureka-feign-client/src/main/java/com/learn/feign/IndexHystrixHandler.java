package com.learn.feign;

import org.springframework.stereotype.Component;

/**
 * @author shenjin
 * Date: 2019/7/30
 * Note: ...
 */
@Component
public class IndexHystrixHandler implements EurekaClientFeign {
    @Override
    public String index(String name) {
        return "hystrix handler, error for index callback ";
    }
}
