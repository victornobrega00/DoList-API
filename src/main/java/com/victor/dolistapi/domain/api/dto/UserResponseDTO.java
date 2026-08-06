package com.victor.dolistapi.domain.api.dto;

import com.victor.dolistapi.domain.entity.User;
import com.victor.dolistapi.domain.enums.UserRole;

import java.util.UUID;

public record UserResponseDTO(
        UUID id,
        String name,
        String email,
        UserRole role
) {
    public static UserResponseDTO fromEntity(User user){
        return new UserResponseDTO(
                user.getId(),
                user.getName(),
                user.getEmail(),
                user.getRole()
        );
    }
}
