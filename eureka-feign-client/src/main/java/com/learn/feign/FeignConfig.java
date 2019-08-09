package com.learn.feign;

import feign.Retryer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author shenjin
 * Date: 2019/7/30
 * Note: ...
 */
@Configuration
public class FeignConfig {

    @Bean
    public Retryer feignRetryer() {
        return new Retryer.Default();
    }
}
