/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_07_a02_01

  @Level:         1

  @Assertion: 6.1.2.7(2)
              Using ClassName(arguments) for defining instances of classes that are not generic.
              In above, ClassName is the name of the class, and arguments is the list of argument.
              ClassName(arguments) will invoke the closest matching constructor
              (based on the rules in section Function Overloading),
              and then generate an instance of ClassName.

  @Description: Check that objects of non-generic classes of various types can be created

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084, 0006124, 0006136

*/

import utils.assert.Assert

// Empty class
class A {}

// Open empty class
open class B {}

// Derived empty class
class C <: B {}

// Class with a constructor with parameters
class D {
    init(x: Int64, y: Bool) {}
}

// Open class with a constructor with parameters
open class E {
    init(a: String, b: Rune) {}
}

// Derived class with a constructor with parameters
class F <: E {
    init(a: Float64) {
        super("", r'b')
    }
}

interface _I {}
// Class implementing an interface
class G <: _I {}

// Class with static members
class H {
    static func f() {}
    static let x = 1
}

// Class with instance members
class I {
    func f() {}
    var a = 1
    var b = 2
}

// Class with instance and static members
class J {
    static var a = 1
    let n = 2
    func g() {}
}

// A public-modified class
public class TestA0201 {
    init(x: Int64) {}
}

// A sealed-modified class
sealed abstract class L {
    L(let x: Int64) {}
}

// Abstract implementation
abstract class _A {
    public func f(): Unit
}
class M <: _A {
    public func f() {}
}

// Class containing everything
class N {
    static init() {}
    N(let x: Int64) {}
    init() {
        x = 1
    }
    ~init() {}

    let z = 1
    var y = 2
    static var m = 0
    static let k = 1

    func f() {}
    static func s() {}

    mut prop p1: String {
        get() {
            ""
        }
        set(v) {}
    }
    static prop p2: Bool {
        get() {
            false
        }
    }
}

// Type alias for a class
type O = N

main() {
    let a = A()
    Assert.isTrue(a is A)

    let b = B()
    Assert.isTrue(b is B)

    let c = C()
    Assert.isTrue(c is C)

    let d = D(10, false)
    Assert.isTrue(d is D)

    let e = E("", r'e')
    Assert.isTrue(e is E)

    let f = F(1.3031)
    Assert.isTrue(f is F)

    let g = G()
    Assert.isTrue(g is G)

    let h = H()
    Assert.isTrue(h is H)

    let i = I()
    Assert.isTrue(i is I)

    let j = J()
    Assert.isTrue(j is J)

    let k = TestA0201(0)
    Assert.isTrue(k is TestA0201)

    let m = M()
    Assert.isTrue(m is M)

    let n = N()
    Assert.isTrue(n is N)

    let o = O()
    Assert.isTrue(o is N)
}