package cjworld

import interoplib.interop.*

public class GenericClass<T, U> where T <: ToString, U <: ToString {

    private var value: (T, U)
    public GenericClass(v: (T, U)) {
        value = v
    }

    public func getValue() : (T, U) {
        return this.value
    }

    public func setValue(t: (T, U)) {
        value = t
    }
}