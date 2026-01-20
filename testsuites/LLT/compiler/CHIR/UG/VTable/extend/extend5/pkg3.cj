package test3

import test1.*
import test2.*

public interface I {
    func foo() {
        println("I::foo")
    }
}

extend A <: I {
    
}

public func printB(): B {
    var b = B()
    b.foo()
    return b
}