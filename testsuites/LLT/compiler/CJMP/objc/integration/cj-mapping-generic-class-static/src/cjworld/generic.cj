package cjworld

import objc.lang.*

public class GenericClass<T> {

    public static func staticFunc() {}

    public func instanceMemberFunction(t : T) : T {
        t
    }
}