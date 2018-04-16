/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

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
