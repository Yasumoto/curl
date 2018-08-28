import XCTest

import curlTests

var tests = [XCTestCaseEntry]()
tests += curlTests.allTests()
XCTMain(tests)