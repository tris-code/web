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

public protocol CookiesStorage: Inject {
    func get(hash: String) throws -> Cookies?
    func upsert(cookies: Cookies) throws
    func delete(hash: String) throws
}

import struct HTTP.Cookie

public final class InMemoryCookiesStorage: CookiesStorage {
    static var cookies: [String : [String : Cookie]] = [:]

    public init() {}

    public func get(hash: String) throws -> Cookies? {
        guard let values = InMemoryCookiesStorage.cookies[hash] else {
            return nil
        }
        return Cookies(hash: hash, values: values)
    }

    public func upsert(cookies: Cookies) throws {
        InMemoryCookiesStorage.cookies[cookies.hash] = cookies.values
    }

    public func delete(hash: String) throws {
        InMemoryCookiesStorage.cookies[hash] = nil
    }
}
