package cjworld

import interoplib.objc.*

public class GenericClass<T> {

    public static func staticFunc() {}

    public func instanceMemberFunction(t : T) : T {
        t
    }
}