package test3

import test1.*

public interface I {
    func foo() {
        println("I::foo")
    }
}

extend A <: I {

}