CREATE TABLE organizations (
    id UUID NOT NULL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    slug VARCHAR(200) UNIQUE NOT NULL,
    created_at BIGINT NOT NULL,
    updated_at BIGINT NOT NULL,
    deleted_at BIGINT NULL
);

CREATE INDEX idx_org_slug ON organizations(slug);
CREATE INDEX idx_org_deleted ON organizations(deleted_at);
