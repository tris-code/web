import XCTest

extension AntiForgeryMiddlewareTests {
    static let __allTests = [
        ("testPostWithoutTokens", testPostWithoutTokens),
        ("testPostWithSingleToken", testPostWithSingleToken),
        ("testPostWithTokens", testPostWithTokens),
        ("testToken", testToken),
    ]
}

extension AuthorizationMiddlewareTests {
    static let __allTests = [
        ("testMiddleware", testMiddleware),
    ]
}

extension CookiesMiddlewareTests {
    static let __allTests = [
        ("testMiddleware", testMiddleware),
    ]
}

extension UserManagerTests {
    static let __allTests = [
        ("testLogin", testLogin),
        ("testRegister", testRegister),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(AntiForgeryMiddlewareTests.__allTests),
        testCase(AuthorizationMiddlewareTests.__allTests),
        testCase(CookiesMiddlewareTests.__allTests),
        testCase(UserManagerTests.__allTests),
    ]
}
#endif
