/*:
# Part II&mdash;Closures and Car Rentals

In this part, you will write a function that calculates the price of a car rental from its daily and hourly price. Then you will use that function and closures to implement a function that takes a car and returns a pricing function for that car.

## Background

The price of a car rental based on how days and hours it is rented for, which isn't quite the same thing as just charing by the hour.

Example:

You don't charge someone 49 times the one hour rate if they rent the car for two days and one hour. You charge them for two days plus one hour.

## Directions

Part II A) 3 pts. Implement the function price below.

Part II B) 2 pts. Implement the function pricingFunctionForCar below. The function takes a car and returns a function(!!), not a price.

*/

struct RentalCar {
    let dailyPrice: Float
    let hourlyPrice: Float
}

// This is the function you are implementing for Part II A.
func price(rentalCar: RentalCar, totalHours: Int) -> Float {
    let days = totalHours / 24  // this you need to compute from totalHours
    let hours = totalHours % 24 // you also need to compute this from totalHours
    let dailyPrice = rentalCar.dailyPrice
    let hourlyPrice = rentalCar.hourlyPrice
    return Float(CGFloat(days) * CGFloat(dailyPrice) + CGFloat(hours) * CGFloat(hourlyPrice)) // this return statement isn't quite right yet!
}

// This is the function you are implementing for Part II B.
func pricingFunctionForCar(rentalCar: RentalCar) -> (Int) -> (Float) {
    func priceForHours(totalHours: Int) -> Float {
        return price( rentalCar, totalHours: totalHours) // with what you did in Part II A, fixing this return to return the right thing is easy
    }
    return priceForHours // this is a function that is being returned!!
}

/*:
## Unit Tests

These will pass when you are done.
*/

import XCTest


let teslaP85 = RentalCar(dailyPrice: 149.99, hourlyPrice: 24.99)
let mazdaCX5 = RentalCar(dailyPrice:  59.99, hourlyPrice: 11.99)

let teslaRentals = [24, 2, 49] // three rentals of the Tesla -- one for a day, one for two hours, one for two days and two hours
let mazdaRentals = [98] // one rental of the Mazda -- 4 days and 2 hours

class GCDTestSuite: XCTestCase {
    
    func testPriceTesla24() {
        let expectedResult: Float = 149.99
        let result = price(teslaP85, totalHours: 24)
        XCTAssertEqual(expectedResult, result, "Mismatch in Tesla P85 pricing.")
    }
    
    func testPriceTesla2() {
        let expectedResult: Float = 49.98
        let result = price(teslaP85, totalHours: 2)
        XCTAssertEqual(expectedResult, result, "Mismatch in Tesla P85 pricing.")
    }
    
    func testPriceTesla49() {
        let expectedResult: Float = 324.97
        let result = price(teslaP85, totalHours: 49)
        XCTAssertEqual(expectedResult, result, "Mismatch in Tesla P85 pricing.")
    }
    
    func testPriceMazda98() {
        let expectedResult: Float = 59.99
        let result = price(mazdaCX5, totalHours: 24)
        XCTAssertEqual(expectedResult, result, "Mismatch in Mazda CX5 pricing.")
    }
    
    func testPricingFunctionForCar() {
        let expectedRentalPrices: [Float] = [149.99, 49.98, 324.97]
        let rentalPrices = teslaRentals.map(pricingFunctionForCar(teslaP85))
        XCTAssertEqual(expectedRentalPrices, rentalPrices, "Mismatch computing Tesla rental prices using map." )
    }
    
    
}

class PlaygroundTestObserver : NSObject, XCTestObservation {
    @objc func testCase(testCase: XCTestCase, didFailWithDescription description: String, inFile filePath: String?, atLine lineNumber: UInt) {
        print("Test failed on line \(lineNumber): \(description)")
    }
}

XCTestObservationCenter.sharedTestObservationCenter().addTestObserver(PlaygroundTestObserver())

GCDTestSuite.defaultTestSuite().runTest()

