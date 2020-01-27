package main

import (
    "os"
    "fmt"
    "net/http"
    "log"
    "time"
    "crypto/md5"
)

func getEnv(name, defaultValue string) string {
    value := os.Getenv(name)
    if value == "" {
        fmt.Printf("Env %s not defined. Using default value '%s'.\n", name, defaultValue)
        return defaultValue
    }
    return value
}

func main() {
    listenAddr := getEnv("LISTEN_ADDR", ":8080")
    startedAt := time.Now()
    response := getEnv("RESPONSE", fmt.Sprintf("%x", md5.Sum([]byte(time.Now().String()))))
    counter := 0
    http.HandleFunc("/", func (w http.ResponseWriter, r *http.Request) {
        counter++
        fmt.Printf("Processing request (%d)\n", counter)
        fmt.Fprintf(w, "%s\nStarted at: %v\nAge: %v\n", response, startedAt, time.Now().Sub(startedAt))
        fmt.Fprintf(w, "\nEnvironment:\n")
        for _, e := range os.Environ() {
            fmt.Fprintf(w, "%s\n", e)
        }
    })
    log.Fatal(http.ListenAndServe(listenAddr, nil))
}
