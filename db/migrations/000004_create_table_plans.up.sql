CREATE TABLE plans (
    id UUID NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    slug VARCHAR(100) UNIQUE NOT NULL,
    price NUMERIC(10,2) NOT NULL DEFAULT 0.00,
    billing_period VARCHAR(20) NOT NULL,
    features JSON,
    limits JSON,
    is_active BOOLEAN DEFAULT TRUE,
    created_at BIGINT NOT NULL,
    updated_at BIGINT NOT NULL,
    deleted_at BIGINT NULL
);

CREATE INDEX idx_plan_slug ON plans(slug);
CREATE INDEX idx_plan_active ON plans(is_active);
CREATE INDEX idx_plan_deleted ON plans(deleted_at);
