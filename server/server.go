package main

import (
	"fmt"
	"io/ioutil"
	"strings"

	"github.com/gin-gonic/contrib/static"
	"github.com/gin-gonic/gin"
)

// // attach the database once to the applicaiton once the package is imported
// // NOTE: we want connections in innot to prevent looping
// // ref: https://www.digitalocean.com/community/tutorials/understanding-init-in-go
// func init() {
// 	config.ConnectDatabase()
// 	migrations.Migrate(config.DB)
// }

func main() {
	// initialize the gin router using default middleware (logger, recovery)
	router := gin.Default()

	// CLIENT SERVER
	// staticly server the client UI webpack files
	router.Use(static.Serve("/", static.LocalFile("../client/build", true)))

	// ERROR HANDLERS
	// load ascii art for when the server starts
	content, _ := ioutil.ReadFile("../motd.txt")
	fmt.Println(string(content))

	api := router.Group("/api")
	{
		api.GET("/ping", func(c *gin.Context) {
			c.JSON(200, gin.H{
				"message": "pong improved",
			})
		})
	}

	err := router.SetTrustedProxies(nil)
	if err != nil {
		fmt.Println(fmt.Errorf(("Could Not Establish Trusted Proxies...")))
	}

	router.NoRoute(func(c *gin.Context) {
		path := c.Request.URL.Path
		if strings.HasPrefix(path, "/api") {
			c.JSON(404, gin.H{"message": "Page Not Found"})
		} else {
			c.JSON(404, gin.H{"message": string(content)})
			fmt.Println("Unauthorized root request")
		}
	})

	fmt.Printf("Server is running...\n")
	if err := router.Run(":8000"); err != nil {
		fmt.Println(fmt.Errorf("an error has occurred in the router: %s", err))
		return
	}
}
