package my_org::test0

import std.reflect.*

public class C<T> {
    public func foo(): Unit {
        println("C<${TypeInfo.of<T>()}>.foo")
    }
}

public class F {}

main(): Unit {
    // let tp = ClassTypeInfo.get("my_org::test0.C<Int64>")
    // let c = tp.getConstructor()
    // let instance = c.apply()
    // let foo = tp.getInstanceFunction("foo")
    // foo.apply(instance, [])
    ClassTypeInfo.get("my_org::test0.F")
}
