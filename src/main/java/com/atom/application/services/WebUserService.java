package com.atom.application.services;

import java.util.Collection;
import java.util.List;

import com.atom.application.models.WebUser;
import com.atom.application.repos.WebUserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WebUserService {

    @Autowired
    private WebUserRepository repo;

    public WebUser getUserByUsername(String username) {
        return repo.findByUsername(username).orElse(null);
    }

    public WebUser getUserByEmail(String email) {
        return repo.findByEmail(email).orElse(null);
    }

    public List<WebUser> getAllUsers() {
        return repo.findAll();
    }

    public List<WebUser> addAllUsers(Collection<WebUser> users) {
        return repo.saveAll(users);
    }

    public WebUser updateUser(WebUser user) {
        repo.getOne(user.getId());
        return repo.save(user);
    }

    public void removeUser(WebUser user) {
        repo.delete(user);
    }

    public void removeAllUsers() {
        repo.deleteAll();
    }
}
