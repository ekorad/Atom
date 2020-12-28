package com.atom.application.controllers;

import java.util.List;

import com.atom.application.models.UserRole;
import com.atom.application.services.UserRoleService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

@RestController
@RequestMapping("/users/roles")
public class UserRoleController {

    @Autowired
    private UserRoleService service;

    @GetMapping
    public List<UserRole> getAllRoles() {
        List<UserRole> roles = service.getAllRoles();
        if (roles.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
        return roles;
    }
    
}
