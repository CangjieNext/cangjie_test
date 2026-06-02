// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 5.1 函数声明
func foo(a: Int64): Int64 {
    a
}

func bar(a: Int64 , b!: Float64 = 1.0, s!: String) {} // OK

func f1(a: Int64, _: Int64): Int64 {
    return a + 1
}

func f2(_: String): Unit {
    print("Hello Cangjie")
}

func foo(a: Int64, b: Float64) {
    a = 1 // Error: the parameter 'a' is immutable, and cannot be assigned.
    b = 1.0 // Error: the parameter 'b' is immutable, and cannot be assigned.
}

func add1(a: Int32, b!: Int32): Int32 {
    a + b
} // ok

open class A {
    public open func f(a!: Int32): Int32 {
        return a + 1
    }
}

class B <: A {
    public override func f(a!: Int32): Int32 { // ok
        return a + 1
    }
}

class C <: A {
    public override func f(b!: Int32): Int32 { // error
        return b + 1
    }
}

func f1(a: Int32, b: Int32, c!: Int32 = 3, d!: Int32 = 4): Int32 {
    a + b + c + d
}

func test() {
    f1(1, 2) // 10, f1(1, 2, 3, 4)
    f1(1, 2, c: 5) // 12, f1(1, 2, 5, 4)
}

/* The names introduced in the default value, does not need to have the same or least restrictive accessibility of the function. */
var x = 10
var y = 10

func g() {}

public func f2(a!: Int64 = x * 2 + y, b!: ()->Unit = g) {} // OK.

class AAA {
    static private var x = 10

    func f(a!: Int64 = x) { // OK, public method can use private static field.
        print("${a}")
        x = x + 10
        print("${x}")
    }
}

/*
    When a function is called, the name in the function declaration can use the
        default value. When a function is called by using a variable name, arguments
        cannot be optional.
*/
func f1(): (Int64) -> Unit {
    g1
}

func g1(a!: Int64 = 42) {
    print("g1: ${a}")
}

let gg1 = f1()
let x = gg1() // Error, cannot ommit the argument.
let gg3 = g1
let a = gg3() // Error, cannot ommit the argument.

func f() {
    func g(x! :Int64 = return) { // Error: return must be used inside a function body
        0
    }
    1
}

// 5.1.3.1 局部变量
func foo(): Unit {
    var a = 1
    let b = 1
}

// 5.1.3.2 嵌套函数
func foo(): Unit {
    func add(a: Int32, b: Int32) {
        a + b
    }

    let c = 1

    func nest(): Unit {
        print("${c}") // 1
        var b = add(1, 2) // b = 3
    }
}

// 5.1.4 函数的返回类型
func returnAB(a: Int32, b: Int32): (Int32, Int32) {
    (a, b)
}

func returnAdd(a: Int32, b: Int32): (Int32, Int32) -> Int32 {
    return {a, b => a + b} // Return a lambda expression.
}

class A {}

class B <: A {}

// Return is not written.
func add(a: Int32, b: Int32): B {
    var c = a + b
    if (c > 100) {
        return B()
    } else {
        return A() // Compilation error since A is not a subtype of B.
    }
}

func Column(c: (Data) -> Unit): Unit {
    2
} // return () is automatically inserted

func Column(c: (Data) -> Unit) {
    2
} // return type is Int64

open class Base {}

class Child <: Base {}

func f(a: Rune) {
    if (false) {
        return Base()
    }
    return Child()
}

func f<T1>(a: T1) {}

func f<T2>(b: T2) {}

func f<X,Y>(a:X, b:Y) {}

func f<Y,X>(a:X, b:Y) {}

func f<X,Y>(a:X, b:Y) {}

func f<Y,X>(a:Y, b:X) {}

// 5.2 函数类型

// function type: () -> Unit
func hello(): Unit {
    print("Hello!")
}

// function type: (Int32) -> Unit
func display(a: Int32): Unit {
    print("${a}")
}

// function type: (Int32, Int32) -> Int32
func add(a: Int32, b: Int32): Int32 {
    a + b
}

// function type: ((Int32, Int32) -> Int32, Int32, Int32) -> Unit
func printAdd(add: (Int32, Int32) -> Int32, a: Int32, b: Int32): Unit {
    print("${add(a, b)}")
}

// function type: (Int32, Int32) -> (Int32, Int32) -> Int32
func returnAdd(a: Int32, b: Int32): (Int32, Int32) -> Int32 {
    {a, b => a + b}
}

// function type: (Int32, Int32) -> (Int32, Int32)
func returnAB(a: Int32, b: Int32): (Int32, Int32) {
    (a, b)
}

// 5.3.1 命名实参
func add(a!: Int32, b!: Int32): Int32 {
    a + b
}

var sum1 = add(1, 2) // error
var sum2 = add(a: 1, b: 2) // OK, 3
var sum3 = add(b: 2, a: 1) // OK, 3

// 5.3.2 函数调用类型检查
open class Base {}

class Sub <: Base {}

func f<X, Y>(a: X, b: Y) {} // f1

func f<X>(a: Base, b: X) {} // f2

func foo() {
    f<Base>(Base(), Sub()) // f2 may pass the type checking
}

open class Base {}

class Sub <: Base {}

func f(a: Sub) {
    1 // f1
}

func f(a: Base) {
    Base() // f2
}

let x: Base = f(Sub()) // f2 can pass the type checking

// 5.3.3 尾随 Lambda
func f(a: Int64, fn: (Int64)->Int64) {
    fn(a)
}

func foo() {
    f(1, { i => i * i }) // normal function call
    f(1) { i => i * i } // trailing lambda
}

func g(a!: Int64, fn!: (Int64)->Int64) {
    fn(a)
}

func foo() {
    g(a: 1, fn: { i => i * i }) // normal function call
    g(a: 1) { i => i * i } // trailing lambda
}

// 当函数调用有且只有一个 lambda 实参时，我们还可以省略 ()，只写 lambda。
func f(fn: (Int64)->Int64) {
    fn(1)
}

func foo() {
    f{ i => i * i }
}

// 如果尾随 lambda 不包含形参，=> 可以省略。
func f(fn: ()->Int64) {
    fn()
}

func foo() {
    f{ i * i }
}

func foo() {
    this(1, { i => i * i } )
    this(1) { i => i * i }
    super(1, { i => i * i } )
    super(1) { i => i * i }
}

// 5.3.4 变长参数
func f1(arr: Array<Int64>) {}

func f2(a: Int64, arr: Array<Int64>) {}

func f3(arr: Array<Int64>, a: Int64) {}

func f4(arr1!: Array<Int64>, a!: Int64, arr2!: Array<Int64>) {}

func g() {
    let li = [1, 2, 3]
    f1(li)
    f1(1, 2, 3) // using variable length argument
    f1() // using variable length argument
    f2(4, li)
    f2(4, 1, 2, 3) // using variable length argument
    f3(1, 2, 3) // error, Array is not the last parameter
    f4(arr1: 1,2,3, a: 2, arr2: 1,2,3) // error, named parameters cannot use variable length argument
}

open class A {
    func f(v: Int64): Unit { // f1
    }
}

class B <: A {
    func f(v: Array<Int64>): Unit { // f2
    }
}

func p1() {
    let x = B()
    x.f(1) // call the f1
}

func g<T>(arg: T): Unit { // g1
}

func g(arg: Array<Int64>): Unit { // g2
}

func p2() {
    g(1) // call the g1
}

func h(arg: Any): Unit { // h1
}

func h(arg: Array<Int64>): Unit { // h2
}

func p3() {
    h(1) // call the h1
}

// 5.4 函数作用域
func globalFunction() {
    func nestedFunction() {}
}

interface Myinterface {
    func foo(): Unit
    static func bar(): Unit
}

class MyClass {
    func foo() {}
    static func bar() {}
}

extend MyType {
    func foo(): Unit {}
}

// 5.5 Lambda 表达式
let f1: (Int64, Int64)->Int64 = {a: Int64, b: Int64 => a + b}
var f2: () -> Int32 = { => 123 }

let f2 = {n: Int64, _: Int64 => return n * n}
let f3: (Int32, Int32) -> Int32 = {n, _ => return n * n}
let f4: (String) -> String = {_ => return "Hello"}

func column(c: (Data) -> Unit) {}

func row(r: (Data) -> Unit) {}

func build():Unit {
    column { _ =>
        row { _ =>
            buildDetail()
            buildCalendar()
        } // OK. Well typed since 'return' is inserted.
        width(750)
        height(700)
        backgroundColor("#ff41444b")
    } // OK. Well typed since 'return' is inserted.
}

func foo() {
    var sum1: (Int32, Int32) -> Int32 = {a, b => a + b}
    var sum2: (Int32, Int32) -> Int32 = {a: Int32, b => a + b}
    var display = { => print("Hello") }
    var a = { => return 1 }
    // => 右侧的内容与普通函数体的规则一样，同样可以省略 return。若 => 的右侧为空，返回值为 ()。
    sum1 = {a, b => a + b}
    sum2 = {a, b => return a + b} // Same as that in the previous line.

    // Lambda 表达式支持原地调用，例如：
    let r1 = {a: Int64, b: Int64 => a + b}(1, 2) // r1 = 3
    let r2 = { => 123 }() // r2 = 123
}

// 5.6 闭包
func f(){
    let y = 2
    func h() {
        print(y) // OK, captured an immutable variable.
    }
    let d = h // OK, h can be assigned to variable
    return h // OK, h can be a return value
}

// 以下示例中，g 捕获了 var 声明的变量 x，g 不可以作为一等公民使用，仅能被调用。
func f() {
    var x = 1

    func g() {
        print(x) // OK, captured a mutable variable.
    }

    let b = g // Error, g cannot be assigned to a variable
    g // Error, g cannot be used as an expression
    g() // OK, g can be invoked

    // Lambda captured a mutable variable, cannot be assigned to a variable
    let e = { => print("${x}") } // Error
    let i = { => x*x }() // OK, lambda captured a mutable variable, can be invoked.

    return g // Error, g cannot be used as a return value.
}

// 以下示例中，g 捕获了 var 声明的变量 x，f 调用了 g，且 g 捕获的 x 不在 f 内定义，f 同样不能作为一等公民使用：
func h(){
    var x = 1

    func g() {
        x
    } // captured a mutable variable

    func f() {
        g() // invoked g
    }

    return f // error
}

// 以下示例中，g 捕获了 var 声明的变量 x，f 调用了 g。但 g 捕获的 x 在 f 内定义，f 没有捕获其它
// var 声明的变量。因此，f 仍作为一等公民使用：
func h(){
    func f() {
        var x = 1

        func g() {
            x
        } // captured a mutable variable

        g()
    }
    return f // ok
}

// 访问了 var 修饰的全局变量、静态成员变量、实例成员变量的函数或 lambda 仍可作为一等公民使用。
class C {
    static var a: Int32 = 0

    static func foo() {
        a++ // OK
        return a
    }
}

var globalV1 = 0

func countGlobalV1() {
    globalV1++
    C.a = 99
    let g = C.foo // OK
}

func g(){
    let f = countGlobalV1 // OK
    f()
}

/*
 * 捕获的变量必须满足以下规则：
 * • 被捕获的变量必须在闭包定义时可见，否则编译报错；
 * • 变量被捕获时必须已经完成初始化，否则编译报错；
 * • 如果函数外有变量，同时函数内有同名的局部变量，函数内的闭包因局部变量的作用域未开始而捕获
 * 了函数外的变量时，为避免用户误用，报 warning；
 */
// 1. The captured variable must be defined before the closure.
let x = 4

func f() {
    print("${x}") // Print 4.

    let x = 99

    func f1() {
        print("${x}")
    }

    let f2 = { =>
        print("${x}")
    }

    f1() // Print 99.
    f2() // Print 99.
}

// 2. The variable must be initialized before being captured.
let x = 4

func f() {
    print("${x}") // Print 4.

    let x: Int64

    func f1() {
        print("${x}") // Error: x is not initialized yet.
    }

    x = 99
    f1()
}

// 3. If there is a local variable in a block, closures capture variables of the same name in the outer scope will report a warning.
let x = 4

func f() {
    print("${x}") // Print 4.

    func f1() {
        print("${x}") // warning
    }

    let f2 = { =>
        print("${x}") // warning
    }

    let x = 99
    f1() // print 4
    f2() // print 4
}

// 5.7.1 函数重载定义
type Boolean = Bool

func f(a : Bool) {}

func f(a! : Bool) {}

func f(a! : Bool = false) {}

func f(a! : Boolean) {}

// 示例一：定义源文件顶层的 2 个函数的参数类型不同，f 构成了重载。
// f overloading
func f() {}

func f(a: Int32) {}

// 示例二：接口 I、类 C1、C2 中的函数 f1 构成了重载。
interface I {
    func f1() {}
}

open class C1 {
    func f1(a: Int32) {}
}

class C2 <: C1 & I {
    // f1 overloading
    func f1(a: Int32, b: String) {}
}

// 示例三：类型内的构造函数之间构成重载。
class C {
    var name: String = "abc"

    // constructor overloading
    init(){
        print(name)
    }

    init(name: String){
        this.name = name
    }
}

// 示例四：如下示例，函数参数数量相同，相同位置的类型相同，仅参数类型中包含的类型变元的约束不同，不构成重载
interface I1{}

interface I2{}

func f<T>(a: T) where T <: I1 {}

func f<T>(a: T) where T <: I2 {} // Error, not overloading

// 5.8.1 mut 函数的定义
struct A {
    mut func f(): Unit {} // ok
    mut operator func +(rhs: A): A { // ok
        return A()
    }
}

extend A {
    mut func h(): Unit {} // ok
}

interface I {
    mut func f(): Unit // ok
}

struct Foo {
    var i = 0
    mut func f() {
        this.i += 1 // ok
        i += 1 // ok
    }
}

main() {
    var a = Foo()
    print(a.i) // 0
    a.f()
    print(a.i) // 2
    a.f()
    print(a.i) // 4
    return 0
}

struct Foo {
    var i = 0
    mut func f(): Foo {
    let f1 = { => this } // error
    let f2 = { => this.i = 2 } // error
    let f3 = { => this.i } // error
    let f4 = { => i } // error
        return this // error
    }
}

// 5.8.2 接口中的 mut 函数
interface I {
    mut func f1(): Unit
    func f2(): Unit
}

struct A <: I {
    public mut func f1(): Unit {} // ok
    public func f2(): Unit {} // ok
}

struct B <: I {
    public func f1(): Unit {} // error
    public mut func f2(): Unit {} // error
}

class C <: I {
    public func f1(): Unit {} // ok
    public func f2(): Unit {} // ok
}

interface I {
    mut func f(): Unit
}

struct Foo <: I {
    var v = 0

    public mut func f(): Unit {
        v += 1
    }
}

main() {
    var a = Foo()
    var b: I = a
    b.f()
    print(a.v) // 0
    return 0
}

// 5.8.3 访问规则
interface I {
    mut func f(): Unit
}

struct Foo <: I {
    var i = 0

    public mut func f(): Unit {
        i += 1
    }
}

class Bar <: I {
    var i = 0

    public func f(): Unit {
        i += 1
    }
}

main() {
    let a = Foo()
    a.f() // error
    var b = Foo()
    b.f() // ok
    let c: I = Foo()
    c.f() // ok
    return 0
}

func g1<T>(v: T): Unit where T <: I {
    v.f() // error
}

func g2<T>(v: T): Unit where T <: Bar & I {
    v.f() // ok
}

interface I {
    mut func f(): Unit
}

struct Foo <: I {
    var i = 0

    public mut func f(): Unit {
        i += 1
    }
}

class Bar <: I {
    var i = 0

    public func f(): Unit {
        i += 1
    }
}

main() {
    var a = Foo()
    var fn = a.f // error
    var b: I = Foo()
    fn = b.f // ok
    return 0
}

func g1<T>(v: T): Unit where T <: I {
    let fn = v.f // error
}

func g2<T>(v: T): Unit where T <: Bar & I {
    let fn = v.f // ok
}

// 非 mut 的实例成员函数（包括 lambda 表达式）不能访问 this 的 mut 函数，反之可以。
struct Foo {
    var i = 0

    mut func f(): Unit {
        i += 1
        g() // ok
    }

    func g(): Unit {
        f() // error
    }
}

interface I {
    mut func f(): Unit {
        g() // ok
    }

    func g(): Unit {
        f() // error
    }
}