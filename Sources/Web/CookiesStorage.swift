/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

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
