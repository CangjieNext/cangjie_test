// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 9.2 泛型约束
// 例如以下示例展示了泛型约束声明的写法：
interface Enumerable<U> where U <: Bounded {}

interface Comparable<T> {}

func collectionCompare<T>(a: T, b: T) where T <: Comparable<T> & Seqence {}

func sort<T, V>(input: T) where T <: Enumerable<V>, V <: Object {}

// 在仓颉编程语言中，所有的泛型都是不型变的。这意味着如果 A 是 B 的子类型，ClassName<A> 和 ClassName<B> 之间没有子类型关系。我们禁止这样的行为以保证运行时的安全。
interface I {}

open class Base {
    func f<T>(a: T): I where T <: I
}

class Sub <: Base {
    func f<T>(x: T): T where T <: I // Error
}

// 9.4 泛型约束上界的约束
interface Eq<T> {
    func eq(other: T): Bool
}

interface Ord<T> where T <: Eq<T> {
    func lt(other: T): Bool
}

func foo<T>(a: T) where T <: Ord<T> {
    a.eq(a)
    a.lt(a)
}

interface A {}

class B<T> where T <: A {}

class C<U> where U <: B<U> {} // actual constraints are U <: A & B<U>

class C<T1, T2> {} // generic class

interface I<T1> {} // generic interface

type BinaryOperator<T> = (T, T) -> T // generic typealias

open class C {
    func coo() {}
}

class D <: C {}

interface Tr {
    func bar(): Int64
}

func foo<T>(a: T) {
    var b: C = a // error, T is not a subtype of C
    a.coo() // error, T has no member function coo
    a.bar() // error, T did not implement Tr
}

extend C <: Tr {
    func bar(): Int64 {}
}

interface I {
    static func f(): Unit
}

func g<T>(): Unit where T <: I {}

main() {
    g<I>() // error
    return 0
}

class A<T> {
    func test(a: A<(A<T>, A<T>)>): Bool {
        true
    }
}

main(): Int64 {
    var a: A<Int32> = A<Int32>()
    return 0
}

func show<T>(a: T) where T <: ToString {
    a.toString()
}

// 9.7.1.1 实例化泛型函数的限制
// 例如，以下函数的声明都是不合法的：
abstract class AbsClass {
    public func foo<T>(a: T): Unit // error: abstract generic function in abstract class
    public open func bar<T>(a: T) { // error: open generic function in abstract class
    }
}

interface IF {
    func foo<T>(a: T): Unit // error: abstract generic function in interface
}

open class Foo {
    public open func foo<T>(a: T): Unit { // error: open generic function in class
    }
}

// 而以下的泛型函数是合法的：
class Foo {
    static func foo<T>(a: T) {} // generic static function in class
    func bar<T>(a: T) {} // generic non-open function in class
}

abstract class Bar {
    func bar<T>(a: T) {} // generic non-open function in abstract class
}

struct R {
    func foo<T>(a: T) {} // generic function in struct
}

enum E {
    A | B | C

    func e<T>(a: T) {} // generic function in enum
}

// 9.7.2 类与接口的实例化
class Foo<T> <: IBar<T> {
    var a: T

    init(a: T) {
        this.a = a
    }

    static func foo(a: T) {}
    public func bar(a: T, b: Int32): Unit {}
}

interface IBar<T> {
    func bar(a: T, b: Int32): Unit
}

// 9.7.3 struct 的实例化
// 结构体的实例化与类的实例化十分类似。
struct Foo<T> {
    func foo(a: T) {}
}

// 9.7.4 Enum 的实例化
enum Either<T, R> {
    Left(T)
    | Right(R)
}

// 9.8 泛型函数重载
class F<X> {
    static func foo<Y>(a: X, b: Y) {} // foo1
    static func foo<Z>(a: Sub, b: Z) {} // foo2
}

class C<T, U> {
    init(a: T, b: U) {}
    func foo(a: T, b: U) {} // foo1
    func foo(a: Base, b: U) {} // foo2
}
