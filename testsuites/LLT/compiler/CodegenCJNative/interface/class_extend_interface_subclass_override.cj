// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

// Regression test for Cangjie/cangjie_compiler issue #702: when a class implements
// an interface via extension, virtual dispatch on a subclass object must reach the
// subclass override at every optimization level. Covers unconditional extensions,
// extensions of a concrete instantiation, and conditional (where clause) extensions
// whose condition is decided either statically or at runtime.

interface I1 {
    func foo(): Int64 {
        2
    }
}

interface I2 {
    static func bar(): Int64 {
        -1
    }
}

open class A {
    public open func foo(): Int64 {
        1
    }
}

extend A {}

extend A <: I1 & I2 {}

class B <: A {
    public override func foo(): Int64 {
        super.foo() + 1
    }
}

class C <: A {}

interface IG<T> {
    func foo(): Int64 {
        3
    }
}

open class AG<T> {
    public open func foo(): Int64 {
        1
    }
}

extend<T> AG<T> <: IG<T> {}

class BG<T> <: AG<T> {
    public override func foo(): Int64 {
        10
    }
}

// Conditional extension: `class BGC <: AGC<IC>` satisfies the where clause statically,
// while `class BGCGen<U> <: AGC<U>` can only be decided at runtime.
interface IC {}

interface IGC {
    func foo(): Int64 {
        4
    }
}

open class AGC<T> {
    public open func foo(): Int64 {
        1
    }
}

extend<T> AGC<T> <: IGC where T <: IC {}

class BGC <: AGC<IC> {
    public override func foo(): Int64 {
        super.foo() + 66
    }
}

class BGCGen<U> <: AGC<U> {
    public override func foo(): Int64 {
        super.foo() + 66
    }
}

class ICImpl <: IC {}

// Extension of a concrete instantiation: `BConc <: AConc<Bool>` always conforms.
interface IConc {
    func foo(): Int64 {
        5
    }
}

open class AConc<T> {
    public open func foo(): Int64 {
        1
    }
}

extend AConc<Bool> <: IConc {}

class BConc <: AConc<Bool> {
    public override func foo(): Int64 {
        super.foo() + 66
    }
}

main() {
    // Dispatch through an interface reference must reach the override B.foo, which is 2.
    var i: I1 = B()
    if (i.foo() != 2) {
        return 1
    }
    // Dispatch through a class reference must also reach the override B.foo.
    var a: A = B()
    if (a.foo() != 2) {
        return 2
    }
    // A subclass without override still dispatches to A.foo, which is 1.
    var c: I1 = C()
    if (c.foo() != 1) {
        return 3
    }
    // Unconditional generic extension: dispatch on an instantiated subclass object
    // must reach the override BG<T>.foo, which is 10.
    var ig: IG<Int64> = BG<Int64>()
    if (ig.foo() != 10) {
        return 4
    }
    var ag: AG<Int64> = BG<Int64>()
    if (ag.foo() != 10) {
        return 5
    }
    // Conditional extension, condition statically satisfied for BGC.
    var igc: IGC = BGC()
    if (igc.foo() != 67) {
        return 6
    }
    // Conditional extension, condition decided at runtime: BGCGen<ICImpl> conforms to IGC.
    var igcGen: IGC = BGCGen<ICImpl>()
    if (igcGen.foo() != 67) {
        return 7
    }
    // ... but BGCGen<Int64> must not conform to IGC.
    var notIgc: Object = BGCGen<Int64>()
    if (notIgc is IGC) {
        return 8
    }
    // Extension of a concrete instantiation must also reach the subclass override.
    var iconc: IConc = BConc()
    if (iconc.foo() != 67) {
        return 9
    }
    return 0
}
