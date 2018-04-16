/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

import class HTTP.Request
import class HTTP.Response
import struct HTTP.HeaderName
import struct Foundation.UUID

public struct AntiForgeryMiddleware: Middleware {
    static var tokenCookieName = "X-CSRF-Token"
    static var tokenHeaderName: HeaderName = "X-CSRF-Token"

    public static func chain(
        with middleware: @escaping (Context) throws -> Void
    ) -> (Context) throws -> Void {
        return { context in
            guard !context.request.isSafe else {
                // generate new token if empty
                if context.cookies[tokenCookieName] == nil {
                    context.cookies[tokenCookieName] = UUID().uuidString
                }
                try middleware(context)
                return
            }

            // validate token for unsafe requests (post, etc.)
            guard let token = context.cookies[tokenCookieName],
                context.request.headers[tokenHeaderName] == token else {
                    context.response = Response(status: .badRequest)
                    return
            }
            try middleware(context)
        }
    }
}

extension Request {
    var isSafe: Bool {
        switch method {
        case .get, .head, .options: return true
        default: return false
        }
    }
}
