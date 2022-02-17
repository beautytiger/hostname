package main

import (
	"github.com/gin-gonic/gin"
	"os"
)

func main() {
	r := gin.Default()
	r.GET("/", func(c *gin.Context) {
		name, err := os.Hostname()
		if err != nil {
			c.JSON(500, gin.H{
				"error": err.Error(),
			})
			return
		}
		c.JSON(200, gin.H{
			"hostname": name,
		})
	})
	r.Run()
}
