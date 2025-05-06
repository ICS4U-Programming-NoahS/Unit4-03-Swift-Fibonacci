//
// Fibonacci.swift
//
// Created by Noah Smith
// Created on 2025-05-05
// Version 1.0
// Copyright (c) 2025 Noah Smith. All rights reserved.
//
// The Fibonacci program will read a set of whole numbers from 'input.txt'.
// It will check if it is a valid whole number.
// If it is not a valid whole number, it will write an error message.
// It will then calculate the fibonacci of each valid whole number.
// Finally, it will write the results to 'output.txt'.

// Import foundation library
import Foundation

// Function to calculate the fibonacci
func fibonacci(_ n: Int) -> Int {

    // Base case
    if n == 0 || n == 1 {

        // because fib(0) = 0, and fib(1) = 1
        return n

    // Recursive case
    } else {

        // Call the fibonacci method recursively
        // add the fibonacci of the two previous numbers
        // Return the fibonacci of the number
        return fibonacci(n - 1) + fibonacci(n - 2)
    }
}

// Greeting and program description
print("Welcome to the fibonacci program!")
print("This program will read a set")
print(" of whole numbers from 'input.txt'.")
print("It will check if it is a valid whole number.")
print("If it is not a valid whole number,")
print(" it will write an error message.")
print("It will then calculate the fibonacci")
print(" of each valid whole number.")
print("It will write the results to 'output.txt'.")

// initialize output string
var outputStr = ""

// open input file for reading
let inputPath = "./input.txt"

// Create output file
let outputPath = "./output.txt"

do {
    // Read all lines, one by one
    let fileContent = try String(contentsOfFile: inputPath)

    // Split the file content into lines
    let lines = fileContent.components(separatedBy: .newlines)

    // initialize index 
    var index = 0

    // while it has not reached the end of the file
    while index < lines.count {

        // set the line to current line
        let line = lines[index]

                // Try to convert to an integer
                if let number = Int(line) {

                    // Check if it is not a whole number
                    if number < 0 {

                        // write error message
                        outputStr += "'\(line)' is not a valid whole number.\n"
                    } else {
                        // function call
                        let fibonacci = fibonacci(number)

                        // write the fibonacci to the output string
                        outputStr += "The fibonacci of \(number) is \(fibonacci).\n"
                    }

                // if it is an invalid whole number
                } else {
                    // write error message
                    outputStr += "'\(line)' is not a valid whole number.\n"
                }

        // increment index
        index += 1
    }

    // write the output string to the output file
    try outputStr.write(toFile: outputPath, atomically: true, encoding: .utf8)

    // Display success message
    print("\nSuccessfully wrote to file 'output.txt'.")

// If there's a file error
} catch {
    // Display file error message
    print("A file error occurred.")
}
