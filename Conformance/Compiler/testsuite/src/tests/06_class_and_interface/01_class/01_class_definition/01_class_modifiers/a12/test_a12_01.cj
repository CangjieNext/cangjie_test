/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_01_a12_01

  @Level:         1

  @Assertion: 6.1.1.1(12)
              A non-abstract subclass of an abstract class must implement all abstract functions in its superclass.

  @Description: Check that there're no errors when a non-abstract subclass defines all abstract functions of its superclasses.

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

// Case #1: The abstract superclass does not have any abstract functions
abstract class A {}
class B <: A {}

func checkCase1() {
  var b = B()
  Assert.isTrue(b is A)
  Assert.isTrue(b is B)
}

// Case #2: The abstract superclass has a single abstract function
abstract class C {
  public func f(): String
}

class D <: C {
  public func f() {
    return "f"
  }
}

func checkCase2() {
  var d = D()
  Assert.isTrue(d is C)
  Assert.isTrue(d is D)
  Assert.equals("f", d.f())
}

// Case #3: The abstract superclass has several abstract functions
abstract class E<T1, T2> {
  public func foo(x: Int64, y: Int64): Int64
  public func bar(x: String): Bool
  public func foobar(x: Int64): (Int64, Int64)
}

class F <: E<Rune, Rune> {
  public func foo(x: Int64, y: Int64) {
    return x + y
  }
  public func bar(x: String) {
    if (x == "X") {
      return true
    } else {
      return false
    }
  }
  public func foobar(x: Int64) {
    return (x, x+1)
  }
}

func checkCase3() {
  var f = F()
  Assert.isTrue(f is E<Rune, Rune>)
  Assert.isTrue(f is F)
  Assert.equals(42, f.foo(40, 2))
  Assert.equals(true, f.bar("X"))
  Assert.equals(1, f.foobar(1)[0])
  Assert.equals(2, f.foobar(1)[1])
}

// Case #4: Two abstract superclasses, all abstract functions are in the abstract superclass
abstract class G {
  public func foo(): Int64
  public func bar(): Int64
}

abstract class H <: G {}

class I <: H {
  public func foo() {
    return 1
  }
  public func bar() {
    return 2
  }
}

func checkCase4() {
  var i = I()
  Assert.isTrue(i is G)
  Assert.isTrue(i is H)
  Assert.isTrue(i is I)
  Assert.equals(1, i.foo())
  Assert.equals(2, i.bar())
}

// Case #5: Two abstract superclasses, all abstract functions are in the abstract subclass

abstract class J {}

abstract class K <: J {
  public func foo(x: Int64): Int64
  public func bar(x: Int64): Int64
}

class L <: K {
  public func foo(x: Int64) {
    return x * 2
  }
  public func bar(x: Int64) {
    return x * 4
  }
}

func checkCase5() {
  var l = L()
  Assert.isTrue(l is J)
  Assert.isTrue(l is K)
  Assert.isTrue(l is L)
  Assert.equals(20, l.foo(10))
  Assert.equals(40, l.bar(10))
}

// Case #6: Two abstract superclasses, both have abstract functions
abstract class M {
  public func a(x: Int64, y: Int64): Int64
  public func b(x: Int64, y: Int64): Int64
}

abstract class N <: M {
  public func c(x: Int64, y: Int64): Int64
  public func d(x: Int64, y: Int64): Int64
}

class O <: N {
  public func a(x: Int64, y: Int64) {
    return x + y
  }
  public func b(x: Int64, y: Int64) {
    return x - y
  }
  public func c(x: Int64, y: Int64) {
    return x * y
  }
  public func d(x: Int64, y: Int64) {
    return x / y
  }
}

func checkCase6() {
  var o = O()
  Assert.isTrue(o is M)
  Assert.isTrue(o is N)
  Assert.isTrue(o is O)
  Assert.equals(20, o.a(10, 10))
  Assert.equals(0, o.b(10, 10))
  Assert.equals(100, o.c(10, 10))
  Assert.equals(1, o.d(10, 10))
}

// Case #7: Two abstract superclasses but the abstract subclass defines all the functions of its superclass
abstract class P {
  public func f1(): Int64
  public func f2(): String
}

abstract class Q <: P {
  public func f1() {
    return 42
  }

  public func f2() {
    return "42"
  }
}

class R <: Q {}

func checkCase7() {
  var r = R()
  Assert.isTrue(r is P)
  Assert.isTrue(r is Q)
  Assert.isTrue(r is R)
  Assert.equals(42, r.f1())
  Assert.equals("42", r.f2())
}

// Case #8: Two abstract superclasses, the abstract subclass defines all the functions of its superclass and adds its own
abstract class S {
  public func f1(x: Int64): Array<Int64>
  public func f2(x: Float64): Float64
}

abstract class T <: S {
  public func f1(x: Int64) {
    return [x, x + 1, x + 2]
  }
  public func f2(x:Float64) {
    return x / 2.0
  }
  public func f3(): Rune
}

class U <: T {
  public func f3(): Rune {
    return r'a'
  }
}

func checkCase8() {
  var u = U()
  Assert.isTrue(u is S)
  Assert.isTrue(u is T)
  Assert.isTrue(u is U)
  Assert.equals(10, u.f1(10)[0])
  Assert.equals(11, u.f1(10)[1])
  Assert.equals(12, u.f1(10)[2])
  Assert.equals(0.25, u.f2(0.5))
  Assert.equals(r'a', u.f3())
}

// Case #9: An inheritance chain of 5 abstract classes
abstract class V {
  public func f1(x: Int64, y: Int64): Int64
}

abstract class W <: V {
  public func f2(x: String): String
}

abstract class X <: W {
  public func f3(): Bool
}

abstract class Y <: X {
  public func f4(x: Bool): String
}

abstract class Z <: Y {
  public func f5(x: Int64): Int64
}

class AA <: Z {
  public func f1(x: Int64, y: Int64) {
    return x + y
  }
  public func f2(x: String) {
    return x + "!"
  }
  public func f3() {
    return false
  }
  public func f4(x: Bool) {
    if (x) {
      return "true"
    } else {
      return "false"
    }
  }
  public func f5(x: Int64) {
    return x - 1
  }
}

func checkCase9() {
  var aa = AA()
  Assert.isTrue(aa is V)
  Assert.isTrue(aa is W)
  Assert.isTrue(aa is X)
  Assert.isTrue(aa is Y)
  Assert.isTrue(aa is Z)
  Assert.isTrue(aa is AA)
  Assert.equals(7, aa.f1(4, 3))
  Assert.equals("Hello, world!", aa.f2("Hello, world"))
  Assert.equals(false, aa.f3())
  Assert.equals("true", aa.f4(true))
  Assert.equals(-1, aa.f5(0))
}

main() {
  checkCase1()
  checkCase2()
  checkCase3()
  checkCase4()
  checkCase5()
  checkCase6()
  checkCase7()
  checkCase8()
  checkCase9()
}
