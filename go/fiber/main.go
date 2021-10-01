package main

import (
	// "encoding/json"

	"fmt"

	"github.com/gofiber/fiber/v2"
)

const (
	bind_address string = "0.0.0.0" // empty means all available interfaces, set '0.0.0.0' here just for explitic value
	bind_port    string = "8080"
	address      string = bind_address + ":" + bind_port
)

func main() {
	app := fiber.New()

	app.Get("/", func(c *fiber.Ctx) error {
		c.Set("Content-type", "application/json")
		return c.SendString(`{"Hello":"World"}`)
	})

	fmt.Printf("Server listening on 'http://%s' ...\n", address)
	app.Listen(address)
}
