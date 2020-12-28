package com.atom.application.repos;

import java.util.Optional;

import com.atom.application.models.WebUser;

import org.springframework.data.jpa.repository.JpaRepository;

public interface WebUserRepository extends JpaRepository<WebUser, Long> {
    
    public Optional<WebUser> findByUsername(String username);

    public Optional<WebUser> findByEmail(String email);
    
}
