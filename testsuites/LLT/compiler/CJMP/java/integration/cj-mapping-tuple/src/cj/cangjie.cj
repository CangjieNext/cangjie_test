package cjworld

import interoplib.interop.*

public struct A {
    public A(let v:(Int8, Int16, Int32, Int64, UInt16, Float32, Float64, Bool)) {}

    public func getValue() : (Int8, Int16, Int32, Int64, UInt16, Float32, Float64, Bool) {
        v
    }
}

public open class B {
    var v:(Int8, Int16, Int32, Int64, UInt16, Float32, Float64, Bool)

    public init(v: (Int8, Int16, Int32, Int64, UInt16, Float32, Float64, Bool)) {
        this.v = v
    }

    public init() {
        this.v = (7, 6, 5, 4, 3, 2.0, 1.0, false)
    }

    public func setValue(v: (Int8, Int16, Int32, Int64, UInt16, Float32, Float64, Bool)) : Unit {
        this.v = v

    }

    public func getValue() : (Int8, Int16, Int32, Int64, UInt16, Float32, Float64, Bool) {
        v
    }

    public open func printTuple(v: (Int8, Int16, Int32, Int64, UInt16, Float32, Float64, Bool)) : Unit {
        println(v[0])
		println(v[1])
		println(v[2])
        println(v[3])
		println(v[4])
		println(v[5])
        println(v[6])
		println(v[7])
        print("", flush: true)
    }
}

public interface C {
    func hoo(v: (Int8, Int16, Int32, Int64, UInt16, Float32, Float64, Bool)): Unit
	func koo(): (Int8, Int16, Int32, Int64, UInt16, Float32, Float64, Bool) {
        (7, 6, 5, 4, 3, 2.0, 1.0, false)
    }
}

public class D {
    public func foo(c: C) {
        c.hoo(c.koo())
    }
}
