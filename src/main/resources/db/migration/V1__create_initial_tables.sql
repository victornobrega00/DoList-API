CREATE TABLE tb_users
(
    id         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name       VARCHAR(100) NOT NULL,
    email      VARCHAR(100) NOT NULL UNIQUE,
    password   VARCHAR(255) NOT NULL,
    role       VARCHAR(20)  NOT NULL,
    created_at TIMESTAMP        DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP        DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE tb_categories
(
    id         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name       VARCHAR(50) NOT NULL,
    user_id    UUID        NOT NULL,
    created_at TIMESTAMP        DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_category_user FOREIGN KEY (user_id) REFERENCES tb_users (id) ON DELETE CASCADE
);

CREATE TABLE tb_tasks
(
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title       VARCHAR(150) NOT NULL,
    description TEXT,
    status      VARCHAR(20)  NOT NULL,
    due_date    TIMESTAMP,
    user_id     UUID         NOT NULL,
    category_id UUID,
    created_at  TIMESTAMP        DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP        DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_task_user FOREIGN KEY (user_id) REFERENCES tb_users (id) ON DELETE CASCADE,
    CONSTRAINT fk_task_category FOREIGN KEY (category_id) REFERENCES tb_categories (id) ON DELETE SET NULL
);