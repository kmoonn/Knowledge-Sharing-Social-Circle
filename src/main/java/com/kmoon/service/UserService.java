package com.kmoon.service;

import com.kmoon.exception.MessageException;
import com.kmoon.model.Invitecode;
import com.kmoon.model.User;

import java.util.List;

public interface UserService {

    /**
     * 注册
     *
     * @param user
     * @param invitecode
     * @throws MessageException
     */
    void register(User user, Invitecode invitecode) throws MessageException;

    /**
     * 登录
     *
     * @param user
     * @return
     */
    User login(User user);


    /**
     * 查询所有用户
     */
    List<User> findAllUser();


    /**
     * 禁言用户
     *
     * @param user
     */
    void banUser(User user);

    /**
     * 禁言用户
     *
     * @param user
     */
    void unbanUser(User user);

    /**
     * uid查询用户
     */
    User findUserByUid(Integer uid);


    /**
     * 更改用户密码
     */
    void updatePassword(String uname, String oldPwd, String newPwd) throws MessageException;
}
