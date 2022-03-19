package db

import (
	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
)

type DBConnection struct {
	Core *gorm.DB
}

var conn *DBConnection

func SetupDBConnection() {
	conn = &DBConnection{}

	db, err := gorm.Open(sqlite.Open("test.db"), &gorm.Config{})
	if err != nil {
		panic("")
	}

	conn.Core = db
}

func GetConnection() *DBConnection {
	return conn
}
