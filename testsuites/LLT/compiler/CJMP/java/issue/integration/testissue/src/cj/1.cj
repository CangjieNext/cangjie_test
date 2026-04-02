package testissue

import interoplib.interop

public struct G<T> {
    public func f(t: T): T { t }
}

public struct H<T> {
    public func g(t: T): T { t }
}