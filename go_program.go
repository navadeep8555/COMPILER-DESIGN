package main

import (
	"fmt"
)

func add(a, b float64) float64 {
	return a + b
}

func subtract(a, b float64) float64 {
	return a - b
}

func multiply(a, b float64) float64 {
	return a * b
}

func divide(a, b float64) (float64, error) {
	if b == 0 {
		return 0, fmt.Errorf("cannot divide by zero")
	}
	return a / b, nil
}

func main() {
	num1 := 10.0
	num2 := 5.0

	// Addition
	resultAdd := add(num1, num2)
	fmt.Printf("%v + %v = %v\n", num1, num2, resultAdd)

	// Subtraction
	resultSub := subtract(num1, num2)
	fmt.Printf("%v - %v = %v\n", num1, num2, resultSub)

	// Multiplication
	resultMul := multiply(num1, num2)
	fmt.Printf("%v * %v = %v\n", num1, num2, resultMul)

	// Division
	resultDiv, err := divide(num1, num2)
	if err != nil {
		fmt.Println("Error:", err)
	} else {
		fmt.Printf("%v / %v = %v\n", num1, num2, resultDiv)
	}
}

