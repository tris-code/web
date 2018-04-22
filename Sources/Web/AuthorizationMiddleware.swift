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
