/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

public struct AuthorizationMiddleware: Middleware {
    public static func chain(
        with middleware: @escaping (Context) throws -> Void
    ) -> (Context) throws -> Void {
        return { context in
            let auth = try context.services.resolve(AuthorizationProtocol.self)
            try auth.authenticate(context: context)
            let result = context.authorization.challenge(user: context.user)
            switch result {
            case .ok: try middleware(context)
            case .unauthorized: auth.accessDenied(context: context)
            case .unauthenticated: auth.loginRequired(context: context)
            }
        }
    }
}
