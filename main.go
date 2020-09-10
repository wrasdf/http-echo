package main

import (
    "net/http"
    "os"
    "log"
    "fmt"
)

const DefaultPort = "8080";
const DefaultEchoString = "Hello World.";

func getServerPort() (string) {
    port := os.Getenv("SERVER_PORT");
    if port != "" {
        return port;
    }

    return DefaultPort;
}

func getDefaultEchoString() (string) {
    echoString := os.Getenv("SERVER_ECHO");
    if echoString != "" {
        return echoString;
    }

    return DefaultEchoString;
}

func EchoHandler(writer http.ResponseWriter, request *http.Request) {
    writer.Header().Set("Access-Control-Allow-Origin", "*")
    writer.Header().Set("Access-Control-Allow-Headers", "Content-Range, Content-Disposition, Content-Type, ETag")
    writer.Header().Set("X-Content-Type-Options", "nosniff")
    fmt.Fprintln(writer, getDefaultEchoString())
}

func main() {
    log.Println("starting server, listening on port " + getServerPort())
    http.HandleFunc("/", EchoHandler)
    http.ListenAndServe(":" + getServerPort(), nil)
}
