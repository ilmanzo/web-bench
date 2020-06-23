package main

import (
	// "encoding/json"
	"fmt"
	"log"
	"net/http"
)

const (
	bind_address string = "0.0.0.0" // empty means all available interfaces, set '0.0.0.0' here just for explitic value
	bind_port    string = "8000"
	address      string = bind_address + ":" + bind_port
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/json")
		// w.Write([]byte(`{"Hello":"World"}`))
		fmt.Fprintf(w, `{"Hello":"World"}`)
	})

	fmt.Printf("Server listening on 'http://%s' ...\n", address)
	log.Fatal(http.ListenAndServe(address, nil))
}
