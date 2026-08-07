package com.victor.dolistapi.repository;

import com.victor.dolistapi.domain.Task;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface CategoryRepository extends JpaRepository<Task, UUID> {
    List<Task> findByUserId(UUID userId);
}
