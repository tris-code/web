import XCTest

import WebTests
import MVCTests

var tests = [XCTestCaseEntry]()
tests += WebTests.__allTests()
tests += MVCTests.__allTests()

XCTMain(tests)
