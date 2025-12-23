CREATE TABLE subscriptions (
    id UUID NOT NULL PRIMARY KEY,
    organization_id UUID NOT NULL,
    plan_id UUID NOT NULL,
    status VARCHAR(50) NOT NULL DEFAULT 'active',
    current_period_start BIGINT NOT NULL,
    current_period_end BIGINT NOT NULL,
    created_at BIGINT NOT NULL,
    updated_at BIGINT NOT NULL,
    deleted_at BIGINT NULL,
    FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE CASCADE,
    FOREIGN KEY (plan_id) REFERENCES plans(id)
);

CREATE INDEX idx_sub_org ON subscriptions(organization_id);
CREATE INDEX idx_sub_status ON subscriptions(status);
CREATE INDEX idx_sub_deleted ON subscriptions(deleted_at);
