import XCTest

extension ApplicationTests {
    static let __allTests = [
        ("testConvenienceAPI", testConvenienceAPI),
        ("testPartialUrl", testPartialUrl),
    ]
}

extension ControllerTests {
    static let __allTests = [
        ("testContextResponse", testContextResponse),
        ("testInject2Services", testInject2Services),
        ("testInject3Services", testInject3Services),
        ("testInject4Services", testInject4Services),
        ("testInject5Services", testInject5Services),
        ("testInject6Services", testInject6Services),
        ("testInjectable", testInjectable),
        ("testInjectContext", testInjectContext),
        ("testInjectContextService", testInjectContextService),
        ("testInjectService", testInjectService),
    ]
}

extension MiddlewareTests {
    static let __allTests = [
        ("testMiddleware", testMiddleware),
        ("testMiddlewareOrder", testMiddlewareOrder),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ApplicationTests.__allTests),
        testCase(ControllerTests.__allTests),
        testCase(MiddlewareTests.__allTests),
    ]
}
#endif
