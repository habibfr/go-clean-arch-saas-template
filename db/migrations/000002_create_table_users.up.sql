-- Valid system_role values: 'user', 'support', 'admin', 'super_admin'
-- These roles are for platform-level access control (not organization-level)
-- 'user' (default): Regular tenant user, only access their own organization
-- 'support': Customer support, can impersonate users and view organizations
-- 'admin': Platform admin, can view all organizations and system analytics
-- 'super_admin': Platform owner, full access to everything
CREATE TABLE users (
    id UUID NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    system_role VARCHAR(50) NOT NULL DEFAULT 'user',
    email_verified BOOLEAN DEFAULT FALSE,
    email_verified_at BIGINT NULL,
    verification_token VARCHAR(100) NULL,
    refresh_token VARCHAR(100) NULL,
    refresh_token_expires_at BIGINT NULL,
    organization_id UUID NULL,
    created_at BIGINT NOT NULL,
    updated_at BIGINT NOT NULL,
    deleted_at BIGINT NULL,
    FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE SET NULL
);

CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_system_role ON users(system_role);
CREATE INDEX idx_users_verification_token ON users(verification_token);
CREATE INDEX idx_users_refresh_token ON users(refresh_token);
CREATE INDEX idx_users_org ON users(organization_id);
CREATE INDEX idx_users_deleted ON users(deleted_at);
