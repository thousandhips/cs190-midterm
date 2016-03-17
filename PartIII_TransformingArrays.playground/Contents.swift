/*:
# Part III&mdash;TransformingArrays

In this part, you will use map and filter much like you did in Problem Set #4. You can look at your solution for that Problem.

## Directions

Part III A) 2 pts. Build a function isAutomatic that takes a car and returns true if a car is automatic and false if it is manual.

Part III B) 1 pt. Use filter and the isAutomatic function to filter allFleet into automaticOnly.

Part III C) 1 pt. Build a second function automaticCounter that takes a car and returns 1 if a car is automatic and 0 if it is manual.

Part III D) 1 pt. Use reduce and automaticCounter to count the number of automatic cars in allFleet.
*/

struct RentalCar {
    let automatic: Bool
    let dailyPrice: Float
    let hourlyPrice: Float
}

let teslaP85 = RentalCar(automatic: true, dailyPrice: 149.99, hourlyPrice: 24.99)
let mazdaCX5 = RentalCar(automatic: true, dailyPrice:  59.99, hourlyPrice: 11.99)
let hondaCRX = RentalCar(automatic: false, dailyPrice: 29.99, hourlyPrice:  8.99)

let allFleet = [teslaP85, mazdaCX5, hondaCRX]

// Part III A.
// When you are done implementing this function, testIsAutomaticTrue and testIsAutomaticFalse will pass.
func isAutomatic(rentalCar: RentalCar) -> Bool {
    return rentalCar.automatic
}

// Part III B.
// When you have corrected the following line it will use filter and the isAutomatic function to return just the automatic cars.
let automaticOnly = allFleet.filter(){ value in value.automatic}


// Part III C.
// When you are done implementing this function, testAutomaticCounter will pass.
func automaticCounter(rentalCar: RentalCar) -> Int {
    if( rentalCar.automatic){ return 1}
    else {return 0}
}


// Part III D.
// When you have corrected the following line, testCountAutomatic will pass.
// HINT: There is only one tiny mistake to fix.
let countAutomatic = allFleet.reduce(0, combine: { $0 + automaticCounter($1)} )

/*:
## Unit Tests

These will all pass when you are done.
*/

import XCTest

class TransformingArraysTestSuite: XCTestCase {
    
    func testIsAutomaticTrue() {
        XCTAssertTrue(isAutomatic(teslaP85), "The Tesla is an automatic.")
    }
    
    func testIsAutomaticFalse() {
        XCTAssertFalse(isAutomatic(hondaCRX), "The CRX is manual.")
    }
    
    func testAutomaticOnly() {
        XCTAssertEqual(2, automaticOnly.count, "Expected to get two automatic cars in the automatic-only array.")
    }
    
    func testAutomaticCounter() {
        XCTAssertEqual(1, automaticCounter(teslaP85), "The Tesla counts as an automatic.")
        XCTAssertEqual(0, automaticCounter(hondaCRX), "The CRX doesn't count as an automatic.")
    }
    
    func testCountAutomatic() {
        XCTAssertEqual(2, countAutomatic, "Expected to get 2 for countAutomatic.")
    }
    
    
}

class PlaygroundTestObserver : NSObject, XCTestObservation {
    @objc func testCase(testCase: XCTestCase, didFailWithDescription description: String, inFile filePath: String?, atLine lineNumber: UInt) {
        print("Test failed on line \(lineNumber): \(description)")
    }
}

XCTestObservationCenter.sharedTestObservationCenter().addTestObserver(PlaygroundTestObserver())

TransformingArraysTestSuite.defaultTestSuite().runTest()

