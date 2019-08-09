package com.learn.authserver.dao;

import com.learn.authserver.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author shenjin
 * Date: 2019/8/9
 * Note: ...
 */
public interface UserDao extends JpaRepository<User, Long> {

    User findUserByName(String username);
}
