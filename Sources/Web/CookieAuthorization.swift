/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

import class HTTP.Response

public final class CookieAuthorization: AuthorizationProtocol, InjectService {
    static var userCookieName = "tris-user"

    let repository: UserRepository

    public init(_ repository: UserRepository) {
        self.repository = repository
    }

    public func authenticate(context: Context) throws {
        let cookieName = CookieAuthorization.userCookieName
        guard let userId = context.cookies[cookieName] else {
            context.user = nil
            return
        }
        context.user = try repository.get(id: userId)
    }

    public func loginRequired(context: Context) {
        context.response = Response(status: .unauthorized)
    }

    public func accessDenied(context: Context) {
        context.response = Response(status: .unauthorized)
    }
}
