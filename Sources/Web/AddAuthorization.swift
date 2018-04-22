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

extension Application {
    public func addAuthorization<U, C>(
        userRepository: U.Type,
        cookiesRepository: C.Type
    ) throws where U: UserRepository & Inject, C: CookiesStorage & Inject {
        self.middleware.append(contentsOf: [
            CookiesMiddleware.self,
            AuthorizationMiddleware.self])

        try Services.shared.register(
            transient: U.self,
            as: UserRepository.self)

        try Services.shared.register(
            transient: DefaultUserManager.self,
            as: UserManager.self)

        try Services.shared.register(
            transient: C.self,
            as: CookiesStorage.self)

        try Services.shared.register(
            transient: CookieAuthorization.self,
            as: AuthorizationProtocol.self)

        try addController(LoginController.self)
    }
}
