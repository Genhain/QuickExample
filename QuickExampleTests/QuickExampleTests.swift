//
//  QuickExampleTests.swift
//  QuickExampleTests
//
//  Created by Ben Fowler on 11/4/2018.
//

import XCTest
import Quick
import Nimble

@testable import QuickExample

class QuickExampleTests: QuickSpec {
    
    override func spec() {
        
        feature("first group of tests") {
            first_tests()
        }
        
        feature("second group of tests") {
            second_tests()
        }
    }
}

extension QuickExampleTests {
    func first_tests() {
        
        var SUT: NSNumber!
        var actual: Int!
        var otherValue: Int!
        
        beforeEach {
            SUT = NSNumber(integerLiteral: 10)
        }
        
        afterEach {
            SUT = nil
        }
        
        scenario("trying to add a number with value of NSNumber") {
            
            given("make another number to add") {
                otherValue = 10
            }
            
            when("you add the 2 values together") {
                actual = otherValue + SUT.intValue
            }
            
            then("it adds them both") {
                expect(actual).to(equal(20))
            }
        }
    }

    func second_tests() {
        var SUT: NSNumber!
        var actual: Int!
        var otherValue: Int!
        
        beforeEach {
            SUT = NSNumber(integerLiteral: 20)
        }
        
        afterEach {
            SUT = nil
        }
        
        scenario("trying to add a number with value of NSNumber") {
            
            given("make another number to add") {
                otherValue = 5
            }
            
            when("you add the 2 values together") {
                actual = otherValue + SUT.intValue
            }
            
            then("it adds them both") {
                expect(actual).to(equal(25))
            }
        }
    }
}
