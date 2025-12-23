CREATE TABLE audit_logs (
    id UUID NOT NULL PRIMARY KEY,
    user_id UUID,
    organization_id UUID,
    action VARCHAR(100) NOT NULL,
    resource VARCHAR(100) NOT NULL,
    resource_id UUID,
    details JSON,
    ip_address VARCHAR(45),
    user_agent TEXT,
    created_at BIGINT NOT NULL,
    deleted_at BIGINT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL,
    FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE SET NULL
);

CREATE INDEX idx_audit_user ON audit_logs(user_id);
CREATE INDEX idx_audit_org ON audit_logs(organization_id);
CREATE INDEX idx_audit_created ON audit_logs(created_at);
CREATE INDEX idx_audit_deleted ON audit_logs(deleted_at);
