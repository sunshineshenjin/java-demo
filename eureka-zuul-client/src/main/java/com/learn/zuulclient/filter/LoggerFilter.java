package com.learn.zuulclient.filter;

import brave.Tracer;
import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.exception.ZuulException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @author shenjin
 * Date: 2019/8/2
 * Note: ...
 */
@Component
public class LoggerFilter extends ZuulFilter {

    private Logger logger = LoggerFactory.getLogger(ZuulFilter.class);

    @Autowired
    private Tracer tracer;

    @Override
    public String filterType() {
        return "post";
    }

    @Override
    public int filterOrder() {
        return 900;
    }

    @Override
    public boolean shouldFilter() {
        return true;
    }

    @Override
    public Object run() throws ZuulException {
        logger.info("trace id=" + tracer.currentSpan().context().traceIdString());
        tracer.currentSpan().tag("invokeUser", "shenjin");
        return null;
    }
}
