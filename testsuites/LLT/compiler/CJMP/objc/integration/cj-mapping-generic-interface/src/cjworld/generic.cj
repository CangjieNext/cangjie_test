package cjworld

import interoplib.objc.*

public interface GenericInterface<T> {

    func argretGenericFunc(v: T) : T {
        setValue(v)
        return getValue()
    }

    func setValue(v: T) : Unit

    func getValue() : T

    func normalFunc(v: Int32) : Int32
}
