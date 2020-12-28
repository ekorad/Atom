package com.atom.application.controllers;

import java.util.List;

import com.atom.application.models.UserPermission;
import com.atom.application.services.UserPermissionService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

@RestController
@RequestMapping("/users/permissions")
//@Validated
public class UserPermissionController {

    @Autowired
    private UserPermissionService service;

    // TODO: remove all comented code when possible

    /*@PostMapping(path = "/add", params = "permissionName")
    @ResponseStatus(HttpStatus.CREATED)
    public UserPermission addNewPermission(@RequestParam @NotBlank @Size(min = 3, max = 50) String permissionName) {
        UserPermission perm = new UserPermission();
        perm.setName(permissionName);
        return service.addPermission(perm);
    }*/

    /*@PutMapping(path = "/update", params = { "oldPermissionName", "newPermissionName" })
    public UserPermission updatePermission(@RequestParam @NotBlank @Size(min = 3, max = 50) String oldPermissionName,
            @RequestParam @NotBlank @Size(min = 3, max = 50) String newPermissionName) {
        UserPermission perm = service.getPermissionByName(oldPermissionName);
        perm.setName(newPermissionName);
        retur*n service.updatePermission(perm);
    }*/

    @GetMapping
    public List<UserPermission> getAllPermissions() {
        List<UserPermission> permissions = service.getAllPermissions();
        if (permissions.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
        return permissions;
    }

    /*@GetMapping(params = "permissionName")
    public UserPermission getPermissionByName(@RequestParam @NotBlank @Size(min = 3, max = 50) String permissionName) {
        UserPermission perm = service.getPermissionByName(permissionName);
        if (perm == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
        return perm;
    }*/

    /*@DeleteMapping(path = "/delete", params = "permissionName")
    public void deletePermissionByName(@RequestParam @NotBlank @Size(min = 3, max = 50) String permissionName) {
        UserPermission perm = service.getPermissionByName(permissionName);
        if (perm == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
        service.removePermission(perm);
    }*/
}
