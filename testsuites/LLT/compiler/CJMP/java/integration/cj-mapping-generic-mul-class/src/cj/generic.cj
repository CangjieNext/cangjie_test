package genericClass

import interoplib.interop.*

public class GenericClass<T, U> {

    private var valueT : T
    private var valueU : U

    public GenericClass(v: T, u: U) {
        valueT = v
        valueU = u
    }

    public func setValueT(t : T) {
        valueT = t
    }

    public func setValueU(u : U) {
        valueU = u
    }

    public func getValueT() : T {
        return valueT
    }

    public func getValueU() : U {
        return valueU
    }

    public func setUGetValueT(u : U) : T {
        valueU = u
        return valueT
    }

    public func setTGetValueU(t : T) : U {
        valueT = t
        return valueU
    }
}
