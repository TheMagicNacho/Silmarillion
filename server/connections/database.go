package connections

import (
	"fmt"
	"time"

	"gorm.io/driver/postgres"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
)

var db *gorm.DB

func Database() {
	dsn := "host=silmarillion-database port=5432 user=dev dbname=silmarillion password=dev sslmode=disable"

	// connect to the database, if the connection fails try again
	for i := 0; i < 10; i++ {
		dbScoped, err := gorm.Open(postgres.Open(dsn), &gorm.Config{Logger: logger.Default.LogMode(logger.Info)})
		if err != nil {
			fmt.Println(fmt.Errorf("error connecting to database: %s", err))
			time.Sleep(time.Second * 3)
			fmt.Println("Retrying connection...")
		} else {
			db = dbScoped
			break
		}
	}
}
