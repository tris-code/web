/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

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
