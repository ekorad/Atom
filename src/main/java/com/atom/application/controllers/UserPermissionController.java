package com.atom.application.controllers;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import com.atom.application.models.UserPermission;
import com.atom.application.services.UserPermissionService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/users/permissions")
@Validated
public class UserPermissionController {
    
    @Autowired
    private UserPermissionService service;

    @PostMapping(path = "/add", params = "permissionName")
    @ResponseStatus(HttpStatus.CREATED)
    public void addNewPermission(@RequestParam @NotBlank @Size(min = 3, max = 50) String permissionName) {
        UserPermission perm = new UserPermission();
        perm.setName(permissionName);
        service.addPermission(perm);
    }
}
