/*:

# Part I&mdash;Euclidean Algorithm

In this part, you will implement the Euclidean Algorithm for finding the greatest common divisor of two numbers. This is a common thing to need to do in cryptography.

## Background

From the Wikipedia:

"The Euclidean algorithm is based on the principle that the greatest common divisor of two numbers does not change if the larger number is replaced by its difference with the smaller number. Since this replacement reduces the larger of the two numbers, repeating this process gives successively smaller pairs of numbers until one of the two numbers reaches zero."

Then the other number is the answer.

## Pseudocode

The Wikipedia even gives a pseudocode solution:

    function gcd(a, b)
        while b > 0
            temp = b
            b = a mod b
            a = temp
        return a

## Scoring

5 pts total.

2 pts, your playground compiles without errors.

1 pt, your playground has no warnings.

The remaining 2 pts, the three unit tests pass.

## Directions

DON'T modify the unit tests. That's not the right way to fix your errors, warnings or test failures.

Just look at the pseudocode and convert it to Swift.

HINT: Swift won't let you modify a and b, but the pseodocode modifies them, so how about creating some new variables that you can modify?

Just uncomment the following two lines to get started.
*/

func gcd(a: Int, b: Int) -> Int {
    //a and b are let variables so temp1 and temp2 will take their places respectively
    var temp = b
    var temp1 = a
    var temp2 = b
    
    //while loop where the action happens
    while( temp2 > 0)
    {
        temp = temp2
        temp2 = temp1 % temp2
        temp1 = temp
    }
    
    return temp1
}

/*:
## Unit Tests

These will pass when you are done.
*/

import XCTest

class GCDTestSuite: XCTestCase {
    
    // Test with the Wikipedia's example
    func testGcdWith252And105() {
        let expectedResult = 21
        let result = gcd(252, b: 105)
        XCTAssertEqual(expectedResult, result, "Mismatch in result for gcd(252, 105).")
    }
    
    // Test with the Wikipedia's example
    func testGcdWith462And1071() {
        let expectedResult = 21
        let result = gcd(462, b: 1071)
        XCTAssertEqual(expectedResult, result, "Mismatch in result for gcd(462, 1071).")
    }
    
    // Test with two numbers that are relatively prime
    func testGcdWithRelativePrimes() {
        let expectedResult = 1
        let result = gcd(35, b: 27)
        XCTAssertEqual(expectedResult, result, "Mismatch in result for gcd(35, 27).")
    }
    
}

class PlaygroundTestObserver : NSObject, XCTestObservation {
    @objc func testCase(testCase: XCTestCase, didFailWithDescription description: String, inFile filePath: String?, atLine lineNumber: UInt) {
        print("Test failed on line \(lineNumber): \(description)")
    }
}

XCTestObservationCenter.sharedTestObservationCenter().addTestObserver(PlaygroundTestObserver())

GCDTestSuite.defaultTestSuite().runTest()

