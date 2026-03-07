package cjworld

import interoplib.objc.*

public struct A<T> where T <: ToString {

    public var v: T

    public init(a: T) {
        var b: T = a
        v = b
    }

    public mut prop p: T {
        get() {
          var b: T = v
          b
        }
        set(p) {
          var b: T = p
          v = b
        }
    }

    public func f(a: T): T {
        var b: T = a
        b
    }
}