package com.learn.feign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author shenjin
 * Date: 2019/7/30
 * Note: ...
 */
@FeignClient(value = "eureka-client", configuration = FeignConfig.class, fallback = IndexHystrixHandler.class)
public interface EurekaClientFeign {

    @RequestMapping(value = "/user")
    String index(@RequestParam(value = "name") String name);
}
