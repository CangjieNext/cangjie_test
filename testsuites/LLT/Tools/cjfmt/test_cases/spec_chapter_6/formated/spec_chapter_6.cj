// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 6.1.1 类的声明
interface I1<X> {}

interface I2 {}

open class A {}

// The following class B inherits class A and implements interface I2.
open class B <: A & I2 {}

/* The following class C declares 1 type parameters U. It inherits B and implements
   interfaces I1<U> and I2. Also, its type parameters have constraints U <: A */
class C<U> <: B & I1<U> & I2 where U <: A {}

// 6.1.1.1 类的修饰符
/* The following class is declared with modifier `open`, indicating that it can
   be inherited. */
open class C1 {
    func foo(): Unit {
        return
    }
}

class C2 <: C1 {}

// package A
public sealed class C1 {} // OK

sealed class C2 {} // OK, 'public' is optional when 'sealed' is used

class S1 <: C1 {} // OK

public open class S2 <: C1 {} // OK

public sealed class S3 <: C1 {} // OK

open class S4 <: C1 {} // OK

// package B
class SS1 <: S2 {} // OK

class SS2 <: S3 {} // Error, S3 is sealed class, cannot be inherited here.

sealed abstract class C1 {}

open abstract class C1 {}

// 6.1.1.2 类继承
open class C1 {}

class C2 <: C1 {}

// 父类可以是一个泛型类，只需要在继承时提供合法的类型即可。例如：非泛型类 C2 与泛型类 C3 继承 泛型类 C1：
open class C1<T> {}

class C2 <: C1<Int32> {}

class C3<U> <: C1<U> {}

// 所有类都有一个父类，对于没有定义父类的类，默认其父类为 Object。Object 例外，没有父类。
class Empty {} // Inherit from Object implicitly: class Empty <: Object {}

// 类仅支持单继承。以下示例中的语法将引起编译错误。
open class C1 {}

open class C2 {}

class C3 <: C1 & C2 {} // Error: Multiple inheritance is not supported.

//当一个类继承另一个类时，将被继承的类称为父类，将产生继承行为的类称为子类。
open class C1 {} // C1 is superclass

class C2 <: C1 {} // C2 is subclass

// 6.1.1.3 实现接口
// 类支持实现一个或多个接口，通过 <: I1 & I2 & ... & Ik 的方式声明当前类想要实现的接口，多个接口之间用 & 分隔。如果当前类也指定了父类，则接口需要出现在父类后面。例如：
interface I1 {}

interface I2 {}

// Class C1 implements interface I1
open class C1 <: I1 {}

// Class C2 inherits class C1 and implements interface I1, I2.
class C2 <: C1 & I1 & I2 {}

// 接口也可以是泛型的，此时在实现泛型接口时需要给出合法的类型参数。例如：
interface I1<T> {}

interface I2<U> {}

class C1 <: I1<Int32> & I2<Bool> {}

class C2<K, V> <: I1<V> & I2<K> {}

// 当类型实现接口时，对于非泛型接口不能直接实现多次，对于泛型接口不能用同样的类型参数直接实现多次。例如：
interface I1 {}

class C1 <: I1 & I1 {} // error

interface I2<T> {}

class C2 <: I2<Int32> & I2<Int32> {} // error

class C3<T> <: I2<T> & I2<Int32> {} // ok

// 如果上述定义的泛型类 C3 在使用时被应用了类型参数 Int32，导致重复实现了两个相同类型的接口，那么编译器会在类型被使用到的位置报错：
interface I1<T> {}

open class C3<T> <: I1<T> & I1<Int32> {} // ok

var b = C3<Int32>() // error

class C4 <: C3<Int32> {} // error

// 6.1.1.4 类体
class Test {
    static let counter: Int64 = 3
    let name: String = "afdoaidfad"
    private Test(
        name: String, // regular parameter
        annotation!: String = "nnn", // regular parameter
        var width!: Int64 = 1, // member variable parameter with initial value
        private var length!: Int64, // member variable parameter
        private var height!: Int64 = 3 // member variable parameter
    ) {
    }
}

open class A<X> {
    A(protected var x: Int64, protected var y: X) {
        this.x = x
        this.y = y
    }
}

class B<X> <: A<X> {
    B( // primary constructor, it's name is the same as the class
        x: Int64, // regular parameter
        y: X, // regular parameter
        v!: Int64 = 1, // regular parameter
        private var z!: Int64 = v // member variable parameter
    ) {
        super(x, y)
    }
    /* The corresponding init constructor with primary constructor auto-generated
    by compiler.
    private var z: Int64 // auto generated member variable definition
    init( x: Int64,
        y: X,
        v!: Int64 = 1,
        z!: Int64 = v) { // auto generated named parameter definition
        super(x, y)
        this.z = z // auto generated assign expression of member variable
    }
     */
}

class C {
    init() {}
    init(name: String, age: Int32) {}
}

var b: Int64 = 1

class A {
    var a: Int64 = 1
    var b: () -> Int64 = {=> 3} // OK

    /* Cannot use lambda which captured `this` before all of the instance member
    variables are initialized. */
    var c: () -> Int64 = {=> a}
    /* Cannot use function which captured `this` before all of the instance member variables are initialized. */
    var d: () -> Int64 = f // Error
    var e: Int64 = a + 1 // OK

    func f(): Int64 {
        return a
    }
}

class B {
    var a: Int64 = 1
    var b: () -> Int64

    init() {
        b = {=> 3}
    }

    init(p: Int64) {
        this()
        b = {=> this.a} // OK
        b = f // OK
    }

    func f(): Int64 {
        return a
    }
}

var globalVar: C = C()

func f(c: C) {
    globalVar = c
}

open class C {
    init() {
        globalVar = this // Error, `this` cannot escape out of constructors of `open` class
        f(this) // Error, `this` cannot escape out of constructors of `open` class
        m() // Error: calling instance function is forbidden in constructors of `open` class
    }

    func m() {}
}

// 6.1.2.2 静态初始化器
class Foo <: Bar {
    static let y: Int64

    static init() { // called first
        y = x // error: not yet initialized variable
    }
}

open class Bar {
    static let x: Int64

    static init() { // called second
        x = 2
    }
}

class Foo {
    static let a: Int64
    static var c: Int64
    static var d: Int64 // error: uninitialized variable
    static var e: Int64 = 2
    static let f: Int64 // error: uninitialized variable
    static let g: Int64 = 1
    let x = c

    static init() {
        a = 1
        b = 2
        Foo.c // error: not yet initialized variable
        let anotherFoo = Foo()
        anotherFoo.x // error: not yet initialized variable
        c = 3
        e = 4
        g = 2 // error: reassignment
    }
    static let b: Int64
}

// 6.1.2.3 成员变量
open class A {
    var m1: Int32 = 1
}

class C <: A {
    var a: Int32 = 10
    let b: Int32 = super.m1 // Error
}

class C {
    static var a = 1
}

var r1 = C.a // ok

// 6.1.2.4 类成员函数
// 抽象成员函数
// 抽象成员函数只能在抽象类或接口中声明，没有函数体。
abstract class A {
    public func foo(): Unit // abstract member function
}

// 非抽象成员函数
// 非抽象成员函数允许在任何类中定义，必须有函数体。
class Test {
    func foo(): Unit { // non-abstract member function
        return
    }
}

// 静态成员函数
class C<T> {
    static let a: Int32 = 0

    static func foo(b: T): Int32 {
        return a
    }
}

main(): Int64 {
    print("${C<Int32>.foo(3)}")
    print("${C<Bool>.foo(true)}")
    return 0
}

class C<T> {
    static func foo<U>(a: U, b: T): U {
        a
    }
}

var a: Bool = C<Int32>.foo<Bool>(true, 1)
var b: String = C<Bool>.foo<String>("hello", false)

func f<V>(a: V): V {
    C<Int32>.foo<V>(a, 0)
}

// 类成员函数的修饰符
// case 1
open class C1 { // In this case, the 'open' modifier before 'class C1' is required.
    public open func f() {}
}

class C2 <: C1 {
    public override func f() {}
}

// case 2
open class A {
    public open func f() {}
}

open class B <: A {}

class C <: B {
    public override func f() {} // ok
}

// case 3
interface I {
    func f() {}
}

open class Base <: I {} // The function f Inherits the open modifier.

class Sub <: Base {
    public override func f() {} // ok
}

// 静态成员函数内不可以访问所在类的实例成员；实例成员函数内能访问所在类的静态成员。
class C {
    static func f() {} // Cannot be overwritten and must have a function body.
}

// • redef：当一个静态函数重定义继承自父类型的静态函数时，允许可选地使用 redef 进行修饰。
open class C1 {
    static func f1() {}
    static func f2() {}
}

class C2 <: C1 {
    static redef func f1() {}
    static redef func f2() {}
}

// 6.1.2.5 类终结器
// 类终结器是类的一个实例成员函数，这个方法在类的实例被垃圾回收的时候被调用。
class C {
    // below is a finalizer
    ~init() {}
}

class SomeType0 {
    ~init() {} // OK
}

open class SomeType4 {
    ~init() {} // Error, open class can't have a finalizer
}

var GlobalVar: SomeType5 = SomeType5()

class SomeType5 {
    ~init() {
        GlobalVar = this // do not escape `this` out of finalizer, otherwise, unexpected behavior may happen.
    }
}

// 6.1.2.7 类的实例化
class C {
    var a: Int32 = 1

    init(a: Int32) {
        this.a = a
    }

    init(a: Int32, b: Int32) {
        this.a = a + b
    }
}

main(): Int64 {
    var myC = C(2) // invoke the first constructor
    var myC2 = C(3, 4) // invoke the second constructor
    return 0
}

class C<T, U> {
    var a: T
    var b: U

    init(a: T, b: U) {
        this.a = a
        this.b = b
    }
}

main(): Int64 {
    var myC = C<Int32, Int64>(3, 4)
    var myC2 = C(3, 4) // The type of myC2 is inferred to C<Int64, Int64>.
    return 0
}

// 6.1.4 This 类型
open class C1 {
    func f(): This { // its type is `() -> C1`
        return this
    }

    func f2() { // its type is `() -> C1`
        return this
    }

    public open func f3(): C1 {
        return this
    }
}

class C2 <: C1 {
    // member function f is inherited from C1, and its type is `() -> C2` now
    public override func f3(): This { // ok
        return this
    }
}

var obj1: C2 = C2()
var obj2: C1 = C2()
var x = obj1.f() // During compilation, the type of x is C2
var y = obj2.f() // During compilation, the type of y is C1

// 6.2 接口
// 6.2.1.1 接口声明的语法
interface I1 {}

public interface I2<T> {}

public interface I3<U> {}

public interface I4<V> <: I2<V> & I3<Int32> {}

// 访问修饰符
public interface I {} // can be accessed outside the package

interface I2 {} // can only be accessed inside the package

// 继承性修饰符
public sealed interface I1 {} // OK

sealed interface I2 {} // OK, 'public' is optional when 'sealed' is used

open interface I3 {} // OK

interface I4 {} // OK, 'open' is optional

class C1 <: I1 {} // OK

public open class C2 <: I1 {} // OK

public sealed class C3 <: I1 {} // OK

extend Int64 <: I1 {} // OK

// package B
class S1 <: C2 {} // OK

class S2 <: C3 {} // Error, C3 is sealed class, cannot be inherited here.

// 6.2.2 接口成员
interface I1 {
    func f(): Unit
}

interface I2 <: I1 {}

// 6.2.2.1 接口中的函数
interface MyInterface {
    func f1(): Unit // Default implementation not included

    static func f2(): Unit // Default implementation not included

    func f3(): Unit { // Default implementation included
        return
    }

    static func f4(): Unit { // Default implementation included
        return
    }
}

// 抽象函数可以拥有命名参数，但不能拥有参数默认值。
interface MyInterface {
    func f1(a!: Int64): Unit // OK
    func f2(a!: Int64 = 1): Unit // Error, cannot have parameter default values
}

// 接口中函数和属性的修饰符

/*
使用 static 修饰的函数被称为静态成员函数，可以没有函数体。没有函数体的 static 函数不能直接
使用接口类型调用，拥有函数体的 static 函数可以使用接口类型调用。当使用 interface 类型名直接调用其
静态成员函数时，如果这个函数里面直接或间接调用了接口中（自己或其它接口）没有实现的其它静态函数，
则编译报错。
 */
interface I {
    static func f1(): Unit
    static func f2(): Unit {}
    static func f3(): Unit {
        f1()
    }
}

main() {
    I.f1() // Error, cannot directly call
    I.f2() // OK
    I.f3() // Error, f1 not implemented
}

// 接口中的实例成员函数默认具有 open 的语义。在接口中定义实例成员函数时，open 修饰符是可选的。
interface I {
    open func foo1() {} // ok
    func foo2() {} // ok
}

// 使用 mut 修饰的函数是一种特殊的实例成员函数，可以用于抽象 struct 类型的可变行为。
interface I {
    mut func f(): Unit
}

// 6.2.2.3 接口的默认实现
interface I {
    func f() { // f: () -> I
        let a = this // a: I
        return this
    }
}

// 6.2.3 接口继承
interface I1<T> {}

interface I2 {}

interface I3<U> <: I1<U> {} // inherit a generic interface.

interface I4<V> <: I1<Int32> & I2 {} // inherit multiple interfaces.

// 子接口继承父接口时，会继承父接口的所有成员。
// 子接口继承父接口时，对于非泛型接口不能直接继承多次，对于泛型接口不能使用相同类型参数直接继承多次。例如：
interface I1 {}

interface I2 <: I1 & I1 {} // error

interface I3<T> {}

interface I4 <: I3<Int32> & I3<Int32> {} // error

interface I5<T> <: I3<T> & I3<Int32> {} // ok

// 如果泛型接口 I3 在使用时被给了类型参数为 Int32，那么编译器会在类型使用的位置报错：
interface I1<T> {}

interface I2<T> <: I1<T> & I1<Int32> {} // ok

interface I3 <: I2<Int32> {} // error

main() {
    var a: I2<Int32> // error
}

// 6.2.3.1 子接口中的默认实现
interface I1 {
    func f1(): Unit
    static func f2(): Unit
}

interface I2 <: I1 {
    func f1(): Unit // ok
    static func f2(): Unit // ok
}

interface I3 <: I1 {
    override func f1(): Unit // ok
    static redef func f2(): Unit // ok
}

interface I4 <: I1 {
    func f1(): Unit {} // ok
    static func f2(): Unit {} // ok
}

interface I5 <: I1 {
    override func f1(): Unit {} // ok
    static redef func f2(): Unit {} // ok
}

// 子接口如果继承了父接口中有默认实现的函数或属性，则在子接口中不允许仅写此函数或属性的声明而
// 没有实现，如果子接口中给出新的默认实现，那么定义前的 override 或 redef 修饰符是可选的。示例如下：
interface I1 {
    func f1(): Unit {}
    static func f2(): Unit {}
}

interface I2 <: I1 {
    func f1(): Unit // error, 'f1' must has a new implementation
    static func f2(): Unit // error, 'f2' must has a new implementation
}

interface I3 <: I1 {
    override func f1(): Unit {} // ok
    static redef func f2(): Unit {} // ok
}

interface I4 <: I1 {
    func f1(): Unit {} // ok
    static func f2(): Unit {} // ok
}

// 如果子接口继承的多个父接口中拥有相同签名成员的默认实现，子接口必须提供自己版本的新默认实现，否则会编译报错。
interface I1 {
    func f() {}
}

interface I2 {
    func f() {}
}

interface I3 <: I1 & I2 {} // error, I3 must implement f: () -> Unit

interface I {
    func f1(): Unit

    func f2(): Unit {
        return
    }

    static func f3(): Int64
}

class C <: I {
    public func f1(): Unit {}

    public func f2(): Unit {
        return
    }

    public static func f3(): Int64 {
        return 0
    }
}

abstract class C1 <: I {
    public static func f3(): Int64 {
        return 1
    }
}

// 示例：接口 I 中的函数 f 和 g 为泛型函数，class E 和 F 满足实现函数的类型变元约束比被实现函数的更宽松或相同的要求，编译成功；class D 不满足要求，则编译报错。
// C <: B <: A
interface I {
    static func f<T>(a: T): Unit where T <: B
    static func g<T>(): Unit where T <: B
}

class D <: I {
    public static func f<T>(a: T) where T <: C {} // Error，stricter constraint
    public static func g<T>() where T <: C {} // Error，stricter constraint
}

class E <: I {
    public static func f<T>(a: T) where T <: A {} // OK, looser constraint
    public static func g<T>() where T <: A {} // OK, looser constraint
}

class F <: I {
    public static func f<T>(a: T) where T <: B {} // OK，same constraint
    public static func g<T>() where T <: B {} // OK，same constraint
}

// 更多例子：
// case 1
interface I1 {
    func f(): Unit
}

interface I2 {
    func f(): Unit
}

class A <: I1 & I2 {
    public func f(): Unit {} // ok
}

// case 2
interface I1 {
    func f(): Unit
}

interface I2 {
    func f(): Unit {}
}

open class A {
    public open func f(): Unit {} // ok
}

class B <: A & I1 & I2 {
    public override func f(): Unit {} // ok
}

// case 3
interface I1 {
    func f(): Unit
}

interface I2 {
    func f(): Unit {}
}

class A <: I1 & I2 {} // ok, f from I2

// case 4
interface I1 {
    func f(): Unit {}
}

interface I2 {
    func f(): Unit {}
}

class A <: I1 & I2 {} // error

class B <: I1 & I2 { // ok,
    public func f(): Unit {}
}

// case 5
interface I1 {
    func f(a: Int): Unit {}
}

interface I2 {
    func f(a: Int): Unit {}
}

open class A {
    public open func f(a: Int): Unit {}
}

open class B <: A & I1 & I2 {} // ok, f from A

// 实现接口时函数重载的规则
interface I1 {
    func f(): Unit
}

interface I2 {
    func f(a: Int32): Unit
}

class C <: I1 & I2 {
    public func f(): Unit {} // The f in I1 needs to be implemented.
    public func f(a: Int32): Unit {} // The f in I2 needs to be implemented.
}

// 示例二：分别在 I1 和 I2 中定义了函数相同、参数列表不同的默认函数 f。不需要在 C 中实现 f。
interface I1 {
    func f() {}
}

interface I2 {
    func f(a: Int32) {}
}

class C <: I1 & I2 {}

//示例三：在 I1 中声明了函数名为 f，参数类型为 Unit 的函数；在 I2 中定义了函数名为 f，参数类型为 Int32 的函数。类 C 中必须实现参数类型为 Unit 的函数 f。
interface I1 {
    func f(): Unit
}

interface I2 {
    func f(a: Int32): Unit {
        return
    }
}

class C <: I1 & I2 {
    public func f(): Unit {
        return
    }
}

// 6.2.5 Any 接口
class A {}

struct B {}

enum C {
    D
}

main() {
    var i: Any = A() // ok
    i = B() // ok
    i = C.D // ok
    i = (1, 2) // ok
    i = {=> 123} // ok
    return 0
}

// 在类型定义处可以显式声明实现 Any 接口，如果没有则会由编译器隐式实现，但不能使用扩展重新实现Any接口。
class A <: Any {} // ok

class B {} // Implicit implement Any

extend B <: Any {} // error

// 6.3.1.1 覆盖的定义
open class Father {}

class Child <: Father {}

open class C1 {
    public open func f() {}
    public open func f1(): Father {
        Father()
    }
    public open func f2<T>(a: T): Unit {}
    public open func f3<T>(a: T): Unit where T <: I1 & I2 {}
}

interface I {
    func f() {}
}

class C2 <: C1 & I {
    public override func f() {} // OK.
    public override func f1() {
        Child()
    } // OK.
    public override func f2<U>(b: U): Unit {} // OK.
    public override func f3<U>(x: U): Unit where U <: I1 & I2 {} // OK.
}

// 6.3.1.2 覆盖函数的调用
open class C1 {
    public open func f(): Unit {
        return
    }
}

class C2 <: C1 {
    public override func f(): Unit {
        return
    }
}

var myC1 = C1()
var myC2 = C2()

// Assign the object of the superclass C1 to the variable of the C1 type.
var a: C1 = myC1

// Assign the object of the superclass C2 to the variable of the C1 type.
var b: C1 = myC2

// Invokes f of C1 based on the object type of at runtime
var c = a.f()

// Invokes f of C2 based on the object type of at runtime
var d = b.f()

// 6.3.2 重载
open class Base {}

class Sub <: Base {}

open class C {
    static func foo(a: Base) {}
}

open class B <: C {
    func foo(a: Sub) { // Error
        C.foo(Sub())
    }
}

class A <: B {
    // Static and instance functions cannot be overloaded.
    static func foo(a: Sub) {} // Error
}

// 6.3.3 遮盖
open class C1 {
    let x = 1
}

class C2 <: C1 {
    let x = 2 // error
}

// 6.3.4.1 重定义函数的定义
open class Father {}

class Child <: Father {}

open class C1 {
    public static func f() {}
    public static func f1(): Father {
        Father()
    }
}

interface I {
    static func f() {}
}

class C2 <: C1 & I {
    public static redef func f() {} // OK.
    public static redef func f1(): Child {
        Child() // OK.
    }
}

// 示例：基类 Base 中的函数 f 和 g 为泛型函数，子类 E 和 F 满足重定义函数比被重定义函数的类型变元约束更宽松或相同的要求，编译成功；子类 D 不满足要求，则编译报错。
// C <: B <: A
open class Base {
    static func f<T>(a: T): T where T <: B {}
    static func g<T>(): T where T <: B {}
}

class D <: Base {
    static redef func f<T>(a: T): T where T <: C {} // Error，stricter constraint
    static redef func g<T>(): T where T <: C {} // Error，stricter constraint
}

class E <: Base {
    static redef func f<T>(a: T): T where T <: A {} // OK, looser constraint
    static redef func g<T>(): T where T <: A {} // OK, looser constraint
}

class F <: Base {
    static redef func f<T>(a: T): T where T <: B {} // OK，same constraint
    static redef func g<T>(): T where T <: B {} // OK，same constraint
}

// 6.3.4.2 重定义函数的调用
open class C1 {
    static func f(): Unit {
        return
    }
}

class C2 <: C1 {
    static redef func f(): Unit {
        return
    }
}

// Invokes f of C1
var c = C1.f()
// Invokes f of C2
var d = C2.f()

// 6.3.5 访问控制等级限制
open class A {
    protected open func f() {}
}

interface I {
    func m() {} // public by default
}

class C <: A & I {
    private override func f() {} // Error: the access control of override function is lower than the overriden function
    protected func m() {} // Error: the access control of function which implements abstract function is lower than the abstract function
}

// 6.5.1 实例化类型导致函数签名重复
open class C1<T> {
    public func c1(a: Int32) {} // ok
    public func c1(a: T) {} // ok
}

interface I1<T> {
    func i1(a: Int32): Unit // ok
    func i1(a: T): Unit // ok
}

// 6.5.2 类与接口的泛型成员函数
interface Bar {
    func bar<T>(a: T): Unit // OK
}

abstract class Foo {
    func foo<T>(a: T): Unit // OK
    public open func goo<T>(a: T) {} // OK
}

class Boo {
    public open func boo<T>(a: T) {} // OK
}
