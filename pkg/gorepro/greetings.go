package gorepro

import "fmt"

func GetGreeting() string {
	return "Hello"
}

func PrintGreeting(message string) {
	fmt.Printf("%s\n", message)
}
