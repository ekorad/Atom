package com.atom.application.services;

import java.util.Collection;
import java.util.List;

import com.atom.application.models.UserRole;
import com.atom.application.repos.UserRoleRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserRoleService {

    @Autowired
    private UserRoleRepository repo;

    public UserRole addRole(UserRole role) {
        return repo.save(role);
    }

    public List<UserRole> addAllRoles(Collection<UserRole> roles) {
        return repo.saveAll(roles);
    }

    public UserRole getRoleByName(String name) {
        return repo.findByName(name).orElse(null);
    }

    public List<UserRole> getAllRoles() {
        return repo.findAll();
    }

    public UserRole updatePermission(UserRole role) {
        repo.getOne(role.getId());
        return repo.save(role);
    }

    public void removeRole(UserRole role) {
        repo.delete(role);
    }

    public void removeAllPermissions() {
        repo.deleteAll();
    }
}
