// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 10.1 函数重载
// 下例中，class A 中的实例成员函数 f 和静态成员函数 f 重载，将编译报错。
class A {
    func f() {}
    //Static member function can not be overloaded with instance member function.
    static func f(a: Int64) {} // Error
}

// 下例中，class A 的扩展中实例成员函数 g 和静态成员函数 g 重载，将编译报错。
class A {}

extend A {
    func g() {}
    static func g(a: Int64) {} // Error
}

// 下例中，实例成员函数 h 和静态成员函数 h 在 class A 的不同扩展中，且都是 private，编译不报错。
extend A {
    private func h() {}
}

extend A {
    private static func h(a: Int64) {} // OK
}

// 下例中，enum E 的构造器 f，实例成员函数 f 和静态成员函数 f 重载，将编译报错。
enum E {
    f(Int64) // constructor

    // Instance member function can not be overloaded with constructor.
    func f(a: Float64) {} // Error

    // Static member function can not be overloaded with instance member function or constructor.
    static func f(a: Bool) {} // Error
}

// 10.1.2.2 类型检查
open class Base {}

class Sub <: Base {}

func f<X, Y>(a: X, b: Y) {} // f1, number of type parameters is not matched

func f<X>(a: Base, b: X) where X <: Sub {} // f2

func test() {
    f<Sub>(Base(), Sub()) // candidate set: { f2 }
}

// 需要注意的是，如果实参有多个类型，在类型检查阶段，如果实参的多个类型中有一个能通过类型检查，
// 则认为该实参能通过候选函数的类型检查。
open class A {}

open class B <: A {}

func g(a: A): B { //g1
    B()
}

func g(a: B): B { //g2
    B()
}

func g(a: Int64): Unit {} //g3

// (A)->B <: (B)->B <: (B)->A
func f(a: (A)->B) {} //f1, g1 can pass the type check

func f(a: (B)->B) {} //f2, g1, g2 can pass the type check

func f(a: (B)->A) {} //f3, g1, g2 can pass the type check

func f(a: Bool) {} //f4, no g can pass the type check

func test() {
    f(g) // candidate set: { f1, f2, f3 }
}

// 函数 innermost 中调用函数 g，且传入实参 B()，根据作用域级优先原则，优先选作用域级别高的，因此，选第 7 行定义的函数 g。
/*
    According to the scope-level precedence principle, two functions in the
    candidate set, with different scope-levels, are preferred to the one with
    higher scope-level.
 */
func outer() {
    func g(a: B) {
        print("1")
    }

    func g(a: Int32) {
        print("3")
    }

    func inner() {
        func g(a: A) {
            print("2")
        }

        func innermost() {
            g(B()) // Output: 2
            g(1) // Output: 3
        }
        g(B()) // Output: 2
        innermost()
    }

    inner()
    g(B()) // Output: 1
}

// 上例中，函数 display 调用函数 f，且传入实参 Child()，父类和子类中构成重载的函数均属于同一作用域级别，将根据最匹配规则选择 Father 类中定义的 f(x: Child) {...}。
/* The inherited names are at the same scope level as the names defined or declared in the class. */
open class Father {
    func f(x: Child) {
        print("in Father")
    }
}

class Child <: Father {
    func f(x: Father) {
        print("in Child")
    }
}

func display() {
    var obj: Child = Child()
    obj.f(Child()) // in Father
}

// 下例中，类型 C 中定义的函数 f 和 C 的扩展中定义的函数 f，在函数重载时当成同一作用域优先级处理。
open class Base {}

class Sub <: Base {}

class C {
    func f(a: Sub): Unit {} // f1
}

extend C {
    func f(a: Base): Unit {} // f2

    func g() {
        f(Sub()) // f1
    }
}

var obj = C()
var x = obj.f(Sub()) // f1

open class Base {}

class Sub <: Base {}

func f(a!: Sub = Sub(), b!: Int32 = 2) {} // This is f1,

func f(a!: Base = Base()) {} // This is f2.

var x1 = f(a: Sub()) // parameters involved in comparison in f1 is only a

// 以下列举了一些函数重载决议的例子：
interface I3 {}

interface I1 <: I2 & I3 {}

interface I2 <: I4 {}

interface I4 <: I3 {}

func f(x: I4) {} // f1

func f(x: I3) {} // f2

class C1 <: I1 {}

var obj = C1()

var result = f(obj) // choose f1, because I4 <: I3

open class C1 {}

open class C2 <: C1 {}

class C3 <: C2 {}

func f(a: C1, b: C2, c: C1) {} // f1

func f(a: C3, b: C3, c: C2) {} // f2

func f(a: C3, b: C2, c: C1) {} // f3

// function call
var x = f(C3(), C3(), C3()) // f2

open class A {}

class B <: A {}

func foo<X>(a: X, b: X): Int32 {} // foo1

func foo(a: A, b: B): Int32 {} // foo2

func foo<X>(a: A, b: X): Int32 {} // foo3

// 10.1.3.3 确定实参类型
// Sub <: Base
func f(a: (Base)->Int64, b : Sub) {} //f1

func f(a: (Sub)->Int64, b: Base) {} //f2

func g(a: Base): Int64 { 0 } // g1

func g(a: Sub): Int64 { 0 } // g2

func test() {
    f(g, Base()) // Error, both of g can pass f2's type check.
    f(g, Sub()) // OK，only g1 passes f1's type check.
}

// 10.2 操作符重载
class Point {
    var x: Int32 = 0
    var y: Int32 = 0

    init (a: Int32, b: Int32) {
        x = a
        y = b
    }

    operator func -(): Point {
        return Point(-x, -y)
    }

    operator func +(right: Point): Point {
        return Point(x + right.x, y + right.y)
    }
}

main(): Int64 {
    let p1 = Point(8, 24)
    let p2 = -p1 // p2 = Point(-8, -24)
    let p3 = p1 + p2 // p3 = Point(0, 0)
    return 0
}

// Scenario for `this` or `super`.
open class A {
    init(x: Int64) {
        this() // error, missing argument for call with parameter list: (Int64)
    }

    operator func ()(): Unit {}
}

class B <: A {
    init() {
        super() // error, missing argument for call with parameter list: (Int64)
    }
}

// Scenario for enum constructor.
enum E {
    Y | X | X(Int64)
    operator func ()(a: Int64){a}
    operator func ()(a: Float64){a}
}

main() {
    let e = X(1) // ok, X(1) is to call the constructor X(Int64).
    X(1.0) // ok, X(1.0) is to call the operator () overloading function.
    let e1 = X
    e1(1) // ok, e1(1) is to call the operator () overloading function.
    Y(1) // oK, Y(1) is to call the operator () overloading function.
}

class A {
    operator func [](arg1: Int64, arg2: String): Int64 {
        return 0
    }
}

func f() {
    let a = A()
    let b: Int64 = a[1, "2"]
    // b == 0
}

class A {
    operator func [](arg1: Int64, arg2: String, value!: Int64): Unit {
        return
    }
}

func f() {
    let a = A()
    a[1, "2"] = 0
}
