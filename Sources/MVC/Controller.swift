/******************************************************************************
 *                                                                            *
 * Tris Foundation disclaims copyright to this source code.                   *
 * In place of a legal notice, here is a blessing:                            *
 *                                                                            *
 *     May you do good and not evil.                                          *
 *     May you find forgiveness for yourself and forgive others.              *
 *     May you share freely, never taking more than you give.                 *
 *                                                                            *
 ******************************************************************************/

import HTTP

public protocol Controller {
    static var basePath: String { get }
    static var middleware: [Middleware.Type] { get }
    static var authorization: Authorization { get }
    static func setup(router: Router<Self>) throws
}

public extension Controller {
    static var basePath: String {
        return ""
    }

    static var middleware: [Middleware.Type] {
        return []
    }

    static var authorization: Authorization {
        return .any
    }
}
