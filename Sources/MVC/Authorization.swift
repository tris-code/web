/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

public enum Authorization {
    case any
    case user
    case guest
    case claim(String)
}

extension Authorization {
    public enum Result {
        case ok
        case unauthorized
        case unauthenticated
    }

    public func challenge(user: UserProtocol?) -> Result {
        guard let user = user else {
            switch self {
            case .any: return .ok
            case .guest: return .ok
            default: return .unauthenticated
            }
        }
        switch self {
        case .any: return .ok
        case .user: return .ok
        case .claim(let claim) where user.claims.contains(claim): return .ok
        default: return .unauthorized
        }
    }
}
