package com.atom.application.controllers;

import java.util.List;

import com.atom.application.models.WebUser;
import com.atom.application.services.WebUserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

@RestController
@RequestMapping("/users")
@Validated
public class WebUserController {
    
    @Autowired
    private WebUserService service;

    @GetMapping
    public List<WebUser> getAllUsers() {
        List<WebUser> users = service.getAllUsers();
        if (users.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND,
                "No users found");
        }
        return users;
    }

    @GetMapping(params = "username")
    public WebUser getUserByUsername(@RequestParam String username) {
        WebUser user = service.getUserByUsername(username);
        if (user == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND,
                "User with username '" + username + "' not found");
        }
        return user;
    }

    @GetMapping(params = "email")
    public WebUser getUserByEmail(@RequestParam String email) {
        WebUser user = service.getUserByEmail(email);
        if (user == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND,
                "User with email '" + email + "' not found");
        }
        return user;
    }
    
}
