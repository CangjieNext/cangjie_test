package cjworld

import interoplib.objc.*

public class GenericClass<T> {

    private var value: T

    public GenericClass(v: T) {
        this.value = v
    }
    public func getValue() : T {
        return this.value
    }

    public func setValue(t: T) {
        value = t
    }
}
