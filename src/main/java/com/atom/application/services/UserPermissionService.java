package com.atom.application.services;

import java.util.Collection;
import java.util.List;

import com.atom.application.models.UserPermission;
import com.atom.application.repos.UserPermissionRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserPermissionService {
    
    @Autowired
    private UserPermissionRepository repo;

    public UserPermission addPermission(UserPermission permission) {
        return repo.save(permission);
    }

    public List<UserPermission> addAllPermissions(Collection<UserPermission> permissions) {
        return repo.saveAll(permissions);
    }

    public UserPermission getPermissionByName(String name) {
        return repo.findByName(name).orElse(null);
    }

    public List<UserPermission> getAllPermissions() {
        return repo.findAll();
    }

    public UserPermission updatePermission(UserPermission permission) {
        repo.getOne(permission.getId());
        return repo.save(permission);
    }

    public void removePermissionByName(String name) {
        repo.deleteByName(name);
    }

    public void removeAllPermissions() {
        repo.deleteAll();
    }

}
