package com.victor.dolistapi.domain.repository;

import com.victor.dolistapi.domain.entity.Task;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface CategoryRepository extends JpaRepository<Task, UUID> {
    List<Task> findByUserId(UUID userId);
}
