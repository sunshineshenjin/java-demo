package com.learn.feign;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author shenjin
 * Date: 2019/7/30
 * Note: ...
 */
@Service
public class IndexService {

    @Autowired
    private EurekaClientFeign eurekaClientFeign;

    public  String sayHi(String name) {
        return eurekaClientFeign.index(name);
    }
}
