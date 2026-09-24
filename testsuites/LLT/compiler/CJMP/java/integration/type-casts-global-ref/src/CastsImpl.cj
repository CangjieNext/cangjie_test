package cjworld

import java.lang.*

@JavaImpl
public class CastsImpl {
    public func boo(): Unit {
        let casted = (A() as M).getOrThrow()
        casted.foo()
    }
}
