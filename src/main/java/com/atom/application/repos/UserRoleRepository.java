package com.atom.application.repos;

import java.util.Optional;

import com.atom.application.models.UserRole;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRoleRepository extends JpaRepository<UserRole, Long> {
    
    public Optional<UserRole> findByName(String name);

}
