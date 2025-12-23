package db

import (
	"go-clean-arch-saas/internal/entity"

	"gorm.io/gorm"
)

// SeedDatabase inserts demo data if not exists
func SeedDatabase(db *gorm.DB) error {
	// Seed Plans
	plans := []entity.Plan{
		{ID: "550e8400-e29b-41d4-a716-446655440001", Name: "Free", Slug: "free", Price: 0.00, BillingPeriod: "monthly", Features: `{"storage": "1GB", "users": "1", "support": "Community"}`, Limits: `{"api_calls_per_month": 1000, "max_users": 1, "storage_gb": 1}`, IsActive: true},
		{ID: "550e8400-e29b-41d4-a716-446655440002", Name: "Pro", Slug: "pro", Price: 29.00, BillingPeriod: "monthly", Features: `{"storage": "50GB", "users": "10", "support": "Email"}`, Limits: `{"api_calls_per_month": 100000, "max_users": 10, "storage_gb": 50}`, IsActive: true},
		{ID: "550e8400-e29b-41d4-a716-446655440003", Name: "Enterprise", Slug: "enterprise", Price: 99.00, BillingPeriod: "monthly", Features: `{"storage": "Unlimited", "users": "Unlimited", "support": "Priority"}`, Limits: `{"api_calls_per_month": -1, "max_users": -1, "storage_gb": -1}`, IsActive: true},
	}
	for _, plan := range plans {
		db.FirstOrCreate(&plan, entity.Plan{ID: plan.ID})
	}

	// Seed Organization
	org := entity.Organization{ID: "650e8400-e29b-41d4-a716-446655440001", Name: "Demo Organization", Slug: "demo-org"}
	db.FirstOrCreate(&org, entity.Organization{ID: org.ID})

	// Seed User
	user := entity.User{
		ID: "750e8400-e29b-41d4-a716-446655440001",
		Name: "Demo User",
		Email: "demo@example.com",
		Password: "$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy", // password123
		EmailVerified: true,
		OrganizationID: org.ID,
	}
	db.FirstOrCreate(&user, entity.User{ID: user.ID})

	// Seed OrganizationMember
	member := entity.OrganizationMember{
		OrganizationID: org.ID,
		UserID: user.ID,
		Role: "owner",
	}
	db.FirstOrCreate(&member, entity.OrganizationMember{OrganizationID: org.ID, UserID: user.ID})

	// Seed Subscription
	sub := entity.Subscription{
		ID: "850e8400-e29b-41d4-a716-446655440001",
		OrganizationID: org.ID,
		PlanID: plans[0].ID,
		Status: "active",
	}
	db.FirstOrCreate(&sub, entity.Subscription{ID: sub.ID})

	return nil
}
