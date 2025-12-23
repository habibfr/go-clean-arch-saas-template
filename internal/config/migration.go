package config

import (
	"go-clean-arch-saas/internal/entity"

	"gorm.io/gorm"
)

// RunAutoMigration migrates all database schemas using GORM
func RunAutoMigration(db *gorm.DB) error {
	return db.AutoMigrate(
		&entity.Organization{},
		&entity.User{},
		&entity.OrganizationMember{},
		&entity.Plan{},
		&entity.Subscription{},
		&entity.AuditLog{},
	)
}
