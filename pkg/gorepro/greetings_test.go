package gorepro

import (
	"testing"
)

func Test_GetGreeting(t *testing.T) {
	if "Hello" != GetGreeting() {
		t.Fatal("Not the expected greeting")
	}
}

func Example_PrintGreeting_Hello() {
	PrintGreeting("Hello")
	// Output: Hello
}
