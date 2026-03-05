package cjworld

import interoplib.objc.*

public struct GenericStruct<T, U> {

    private var valueT : T
    private var valueU : U

    public GenericStruct(v: T, u: U) {
        valueT = v
        valueU = u
    }

    public func getValueT() : T {
        return valueT
    }

    public func getValueU() : U {
        return valueU
    }
}