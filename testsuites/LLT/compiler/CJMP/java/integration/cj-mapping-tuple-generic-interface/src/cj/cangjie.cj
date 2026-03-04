package cjworld

import interoplib.interop.*

public interface GenericInterface<T, U> {

    func getValue() : (T, U)
    {
        (foo(), koo())
    }

    func setValue(t: (T, U)) : Unit 
    {
        gooT(t[0])
        gooU(t[1])
    }

    func foo() : T
    func koo() : U
    func gooT(t: T) : Unit
    func gooU(u: U) : Unit
}