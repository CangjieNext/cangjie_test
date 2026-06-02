/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_07_a04_01

  @Level:         1

  @Assertion: 6.1.2.7(4)
              Using ClassName<Type1, Type2, ... , TypeK>(arguments) for defining instances of generic classes.
              The only difference from defining an instance of a non-generic class is that type variables need to be
              instanced for generic classes, i.e., ‘Type1’ to ‘TypeN’ should be given or be inferred.

  @Description: Check that objects of generic classes of various types can be created

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084, 0006124, 0006136

*/

import utils.assert.Assert

// Empty class
class A<T> {}

// Open empty class
open class B<T> {}

// Derived empty class
class C<U, V> <: B<U> {}

// Class with a constructor with parameters
class D<T1, T2> where T2 <: Object {
    init(x: Int64, y: Bool) {}
}

// Open class with a constructor with parameters
open class E<T> {
    init(a: String, b: Rune) {}
}

// Derived class with a constructor with parameters
class F<T1, T2> <: E<T2> {
    init(a: Float64) {
        super("", r'b')
    }
}

interface _I {}
// Class implementing an interface
class G<T1, T2, T3> <: _I {}

// Class with static members
class H<T> {
    static func f() {}
    static let x = 1
}

// Class with instance members
class I<R, Y> {
    func f() {}
    var a = 1
    var b = 2
}

// Class with instance and static members
class J<T> {
    static var a = 1
    let n = 2
    func g() {}
}

// A public-modified class
public class TestA0401<T> {
    init(x: T) {}
}

// A sealed-modified class
sealed abstract class L<T> {
    L(let x: T) {}
}

// Abstract implementation
abstract class _A {
    public func f(): Unit
}
class M<T> <: _A {
    public func f() {}
}

// Class containing everything
class N<T1, T2> {
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
type O = N<Int64, Bool>

main() {
    let a = A<String>()
    Assert.isTrue(a is A<String>)

    let b = B<Rune>()
    Assert.isTrue(b is B<Rune>)

    let c = C<UInt8, Float16>()
    Assert.isTrue(c is C<UInt8, Float16>)

    let d = D<Unit, A<Unit>>(10, false)
    Assert.isTrue(d is D<Unit, A<Unit>>)

    let e = E<Any>("", r'e')
    Assert.isTrue(e is E<Any>)

    let f = F<Bool, (Bool, Bool)>(1.3031)
    Assert.isTrue(f is F<Bool, (Bool, Bool)>)

    let g = G<Int64, Int64, Int64>()
    Assert.isTrue(g is G<Int64, Int64, Int64>)

    let h = H<(Rune) -> String>()
    Assert.isTrue(h is H<(Rune) -> String>)

    let i = I<Range<Int32>, Array<Int32>>()
    Assert.isTrue(i is I<Range<Int32>, Array<Int32>>)

    let j = J<((Bool) -> Bool, (Rune) -> Rune)>()
    Assert.isTrue(j is J<((Bool) -> Bool, (Rune) -> Rune)>)

    let k = TestA0401<Int64>(0)
    Assert.isTrue(k is TestA0401<Int64>)

    let m = M<IntNative>()
    Assert.isTrue(m is M<IntNative>)

    let n = N<Float64, Int64>()
    Assert.isTrue(n is N<Float64, Int64>)

    let o = O()
    Assert.isTrue(o is N<Int64, Bool>)
}