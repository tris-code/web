import XCTest

import MVCTests
import WebTests

var tests = [XCTestCaseEntry]()
tests += MVCTests.__allTests()
tests += WebTests.__allTests()

XCTMain(tests)
