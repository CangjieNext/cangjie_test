package genericStruct

import java.internal.*

public struct GenericStruct<T> where T <: ToString {

    private var value: T
    public GenericStruct(v: T) {
        value = v
    }

    public func getValue() : T {
        println(this.value)
        return this.value
    }

    public func setValue(t: T) {
        t
    }
}
