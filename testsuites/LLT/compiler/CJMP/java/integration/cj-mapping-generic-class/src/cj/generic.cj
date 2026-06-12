package genericClass

import java.lang.*

public class GenericClass<T> where T <: ToString {

    private var value: T
    public GenericClass(v: T) {
        value = v
    }

    public func getValue() : T {
        println(this.value)
        return this.value
    }

    public func setValue(t: T) {
        value = t
    }
}
