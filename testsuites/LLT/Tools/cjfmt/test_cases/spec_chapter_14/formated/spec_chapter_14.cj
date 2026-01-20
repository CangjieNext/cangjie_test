// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package a

let a0: Tokens = quote(==) // ok
let a1: Tokens = quote(2+3) // ok
let a2: Tokens = quote(2) + quote(+) + quote(3) // ok
let a3: Tokens = quote(main(): Int64 {
0
}) // ok
let a4: Tokens = quote(select * from Users where id=100086) // ok
let b1: Tokens = quote(quote(x)) // ok -- `b1.size == 4`

// quote 表达式还可以引用宏调用表达式，例如：
let a = quote(@SayHi("say hi")) // a quoted, un-expanded macro -- macro expansion happens later

let a1: Tokens = quote(2+3) // ok
let a2: Tokens = quote(2) + quote(+) + quote(3) // ok

func foo() {
    var rightOp: Tokens = quote(3)
    quote(2 + $rightOp) // quote(2 + 3)
}

interface ToTokens {
    func toTokens(): Tokens
}

func foo1() {
    var x: Int64 = 2 + 3

    // tokens in the quote are obtained from the corresponding Tokens.
    quote(x + 2) // quote(x + 2)

    // The Tokens type can only add with Tokens type.
    quote(x) + 1 // error! quote(x) is Tokens type, can't add with integer

    // The value of code interpolation in quote equals to the tokens result corresponding to the value of the interpolation expression.
    quote($x) // quote(5)
    quote($x + 2) // quote(5 + 2)
    quote($x + (2 + 3)) // quote(5 + (2 + 3))
    quote(1 + ($x + 1) * 2) // quote(1 + (5 + 1) * 2)
    quote(1 + $(x + 1) * 2) // quote(1 + 6 * 2)
    var t: Tokens = quote(x) // quote(x)

    // without interpolation, the `t` is the token `t`
    quote(t) // quote(t)

    // with interpolation, `t` is evaluated and expected to implement ToTokens
    quote($t) // quote(x)
    quote($t+1) // quote(x+1)

    // quote expressions can be used inside of interpolations, and cancel out
    quote($(quote(t))) // quote(t)
    quote($(quote($t))) // quote(x)
    quote($(t+1)) // error! t is Tokens type, can't add with integer

    // to the macro
    quote(@PlusOne(x)) // quote(@PlusOne(x))
    quote(@PlusOne($x)) // quote(@PlusOne(5))
    quote(@PlusOne(2+3)) // quote(@PlusOne(2+3))
    quote(1 + @PlusOne(x) * 2) // quote(1 + @PlusOne(x) * 2)

    // When the macro invocation is outside the quote, the macro expansion happens early
    var y: Int64 = @PlusOne(x) // 5 + 1
    quote(1 + $y * 2 ) // quote(1 + 6 * 2)
}

public macro foo(x: Tokens): Tokens {
    x
}

public macro bar(x: Tokens): Tokens {
    return quote($x) // or just `return x`
}

// 下面是有属性宏的示例。和无属性宏相比，多一个 Tokens 类型的输入，宏定义体内可以进行更灵活的操作。
public macro foo(attr: Tokens, x: Tokens): Tokens {
    attr + x
}

public macro bar(attr: Tokens, x: Tokens): Tokens {
    return quote($attr + $x)
}

// 下面是无属性宏、有属性宏、不带括号的宏调用的示例。
func foo() {
    print("In foo\n")
}

// Non-attribute macros
public macro Twice(input: Tokens): Tokens {
    print("Compiling the macro `Twice` ...\n")
    quote($input; $input)
}

@Twice(foo()) // After Macro expand: foo(); foo()

@Twice() // error, parameters in macro invocation can not be empty.

// Attributed macros
public macro Joint(attr: Tokens, input: Tokens): Tokens {
    print("Compiling the macro `Joint` ...\n")
    quote($attr; $input)
}

@Joint[foo()](foo()) // After Macro expand: foo(); foo()

@Joint[foo()]() // error, parameters in macro invocation can not be empty.

@Joint[](foo()) // error, attribute in macro invocation can not be empty.

// Non-attribute macros
public macro MacroWithoutParens(input: Tokens): Tokens {
    print("Compiling the macro `MacroWithoutParens` ...\n")
    quote(func foo() { $input })
}

@MacroWithoutParens
var a: Int64 = 0 // After Macro expand: func foo() { var a: Int64 = 0 }

public macro echo(input: Tokens) {
    return input
}

@echo
class A {} // ok, class can only be defined in top-level, so is current macro invocation

func goo() {
    @echo func tmp() {} // ok, function can be defined in another function body,
}

public macro M(input: Tokens): Tokens { // only macros can be modified by `public`
    return input
}

main() {
    @M()
    return 0
}

public macro M1(input: Tokens): Tokens {
    return input
}

func F1(input: Int64): Int64 {
    return input
}

public macro M2(input: Tokens): Tokens {
    return @M1(input) + Token(TokenKind.ADD) + quote($(F1(1)))
}

// 14.2.4 嵌套宏和递归宏
public macro Inner(input: Tokens): Tokens {
    AssertParentContext("Outer")
    // ...or...
    if (InsideParentContext("Outer")) {
        // ...
    }
}

public macro Inner(input: Tokens): Tokens {
    AssertParentContext("Outer")
    SetItem("key1", "value1")
    SetItem("key2", "value2")
    // ...
}

public macro Outer(input: Tokens): Tokens {
    let messages = GetChildMessages("Inner")
    for (m in messages) {
        let value1 = m.getString("key1")
        let value2 = m.getString("key2")
        // ...
    }
}

public macro A(input: Tokens): Tokens {
    print("Compiling the macro A ...\n")
    let tmp = A_part_0(input)
    if (tmp) {
        return quote($tmp)
    }
    let bb: Tokens = quote(@A(quote($tmp))) // ok
    A_part_1()
}

main(): Int64 {
    var res: Int64 = @A(2+3) // ok, @A will be treated as Int64 after macro expand
    return res
}

public macro A(input: Tokens): Tokens {
    let tmp = A_part_0(input)
    if (tmp) {
        return quote($tmp)
    }
    let bb: Tokens = @A(quote($tmp)) // error, recursive macro expression not in quote
    A_part_1()
}

main(): Int64 {
    var res: Int64 = @A(2+3) // error, type mismatch
    return res
}

// 14.2.5 限制
public macro A(input: Tokens) {
    @B(2+3) // error
}
// ======= file B.cj
public macro B(input: Tokens) {
    @A(2+3) // error
}

// 14.2.6.1 源码位置

func test1() {
    let s: String = @sourceFile() // The value of `s` is the current source file name
}

func test2(n!: Int64 = @sourceLine()) { /* at line 5 */
    // The default value of `n` is the source file line number of the definition of `test2`
    println(n) // print 5
}

// 14.2.6.3 @Intrinsic
@Intrinsic
func invokeGC(heavy: Bool): Unit

func GC(heavy!: Bool = false): Unit {
    unsafe { return invokeGC(heavy) } // CJ_MCC_InvokeGC(heavy)
}

// 编译器内置条件变量
@When[os == "Linux"]
func foo() {
    print("Linux")
}

@When[os == "Windows"]
func foo() {
    print("Windows")
}

main() {
    foo() // Compiling and running the code will print "Linux" or "Windows" on Linux or Windows
    return 0
}

@When[backend == "cjnative"]
func foo() {
    print("cjnative backend")
}

// 用户自定义条件变量
//source.cj
@When[feature == "lion"] // "feature" is user custom conditional variable.
func foo() {
    print("feature lion, ")
}

@When[platform == "dsp"] // "specific" is user custom conditional variable.
func fee() {
    println("specific dsp")
}

main() {
    foo()
    fee()
}

// 14.2.6.6 多条件编译
@When[(backend == "cjnative" || os == "Linux") && cjc_version >= "0.40.1"]
func foo() {
    print("This is Multi-conditional compilation")
}

main() {
    // Conditions for compiling source code: cjc_version greater than 0.40.1; compiler backend is cjnative or os is Linux.
    foo()
    return 0
}

// 14.2.6.7 废弃标记
@Deprecated // no arguments passed
func f1() {}

@Deprecated["only message is specified"]
func f2() {}

@Deprecated["message and strict", strict: true]
func f3() {}

@Deprecated[strict: true] // strict only
func f4() {}

abstract class Base {
    @Deprecated
    func a(): Unit

    @Deprecated
    func b(): Unit

    @Deprecated[strict: true]
    func x(): Unit

    @Deprecated[strict: true]
    func y(): Unit
}

class Child <: Base {
    // warning: overriding deprecated API
    override func a(): Unit {}
    // no warning because overridden with deprecation
    @Deprecated
    override func b(): Unit {}
    // warning: overriding deprecated API
    // because the parent is strict, the child isn't
    @Deprecated
    override func x(): Unit {}
    // no warning because overridden with deprecation
    // with same strict in parent and child
    @Deprecated[strict: true]
    override func y(): Unit {}
}

// 说明在另一个已废弃的声明内部使用一个已废弃的声明时，如果它们都在同一个包中，并且它们的strict 参数相同或者父类型 strict 为 false 的示例：
@Deprecated
func a() {}

@Deprecated[strict: true]
func aStrict() {}

@Deprecated
func b() {
    a() // NO warning because both are deprecated
    aStrict() // warning because of strict field
}

// 如果枚举构造器已废弃，不会在相关的模式匹配处抛出告警或错误：
enum E {
    | @Deprecated
    A
    | B
}

func f(p: E) {
    match (p) {
        case A => print(" A ...\n") // no warning
        case B => print(" B ...\n")
    }
}

// 属性
class A {
    mut prop p1: String {
        get() {
            ""
        }
        @Deprecated // this is ok
        set(newValue) {}
    }

    @Deprecated["a"]
    mut prop p2: String {
        get() {
            ""
        }
        @Deprecated["b"] // ok
        set(newValue) {}
    }

    func usage() {
        println(p2) // warning: a
        p2 = "aaa" // warning: a
    }
}

// 函数参数
func f(@Deprecated param!: Int = 1) {}

func user() {
    f() // ok
    f(param: 1111) // warning
}

// 宏 废弃标记修饰宏调用时，废弃信息不应用于宏调用本身，由于宏 + 标记的交互实现方式，废弃标记应用于宏展开后的结果。
@Deprecated // this deprecates func f
@Test
func f() {}

// 在这种情况下，@oncall 的宏调用应抛出告警
@oncall // warning: Use @OnCall instead
func f() {}

// 14.2.6.8 派生
// 派生是一种根据类型的字段自动生成接口实现的技术。
@Derive[ToString]
struct Uid {
    var uid: Int
}

@Derive[ToString]
class Z {}

@Derive[Hashable where T <: Hashable]
class Container<T> {}

@Derive[Comparable] // ok
struct S1 {}

@Derive[Comparable, Equatable] // ok
struct S2 {}

@Derive[Equatable, Comparable] // ok
struct S3 {}

@Derive[ToString where T <: ToString]
struct MyBox<T> {
    var value: T = 1
}

@Derive[ToString]
class C {}

let x: ToString = C() // ok, compiles successfully

@Derive[ToString]
class C {
    let a = 1 // ok, Int64 has ToString implementation
    let m = Object() // ERROR: there is no ToString implementation for Object
    let self: ?C = None /// ok, implementation for C is provided by Deriving
}

// 排除字段
@Derive[Equatable]
class C {
    var a = 1
    @DeriveExclude
    var cachedValue: ?Value
}

@Derive[Equatable]
class C {
    C(let id: Int) {}

    @DeriveInclude
    prop name: String {
        get() {
            findById(id)
        }
    }
}

@Derive[ToString]
@DeriveOrder[b, a]
class S {
    let a = 1
    let b = 2
}

// 应用于枚举时，@DeriveOrder 接受枚举构造函数列表。
@Derive[Comparable]
@DeriveOrder[C, B, A]
enum E {
    A | B | C
}

// Equatable 和 Comparable
@Derive[Comparable]
@DeriveOrder[C, B, A, D]
enum E {
    A
    | B
    | C
    | D(Int, String)
}

// Equatable 示例：
@Derive[Equatable]
struct S {
    var a = 1
    var b = "b"
}

// 已生成
extend S <: core.Equatable<S> {
    public operator func ==(other: S): Bool {
        return this.a == other.a && this.b == other.b
    }
    public operator func !=(other: S): Bool {
        return !(this == other)
    }
}

// Comparable 示例：
@Derive[Comparable]
struct S {
    let a = 1
    let b = 2
}

// 已生成
extend S <: Equatable<S> {
    public operator func ==(other: S): Bool {
        return this.a == other.a && this.b == other.b
    }
    public operator func !=(other: S): Bool {
        return !(this == other)
    }
}

extend S <: Comparable<S> {
    public func compare(other: S): core.Ordering {
        match (this.a.compare(other.a)) {
            case core.Ordering.EQ => ()
            case notEqual => return notEqual
        }
        match (this.b.compare(other.b)) {
            case core.Ordering.EQ => ()
            case notEqual => return notEqual
        }
        return core.Ordering.EQ
    }
    public operator func <=(other: S): Bool {
        return this.compare(other) <= Ordering.EQ
    }
    // ... 其他运算符省略
}

// Hashable 派生的 Hashable 实现应该收集所有相关的值（字段/属性/参数）并将它们聚合起来。当应用于
// 枚举时，在聚合期间也应考虑枚举构造函数的零为基的索引（即所谓的序数）。
// 示例：
@Derive[Hashable]
struct S {
    var a = 1
}

@Derive[Hashable]
enum E {
    A | B(String)
}

// 已生成
extend S <: core.Hashable {
    public func hashCode(): Int64 {
        var h = DefaultHasher()
        h.write(a)
        return h.finish()
    }
}

extend E <: core.Hashable {
    public func hashCode(): Int64 {
        var h = DefaultHasher()
        match (this) {
            case A => h.write(0) // index of A
            case B(s) =>
                h.write(1) // index of B
                h.write(s)
        }
        return h.finish()
    }
}

// 泛型 当目标类型具有泛型参数时，生成的扩展可能需要每个泛型参数的泛型约束，以便每个泛型参数都应绑定到目标接口类型：
@Derive[ToString]
class C<T> {}

/* 派生在默认情况下尝试为泛型参数找到适当的约束，或者如果由于某种原因无法可靠地确定，可能会为
所有泛型参数生成没有上界的约束。当默认生成的泛型约束不适用，或者需要为 API 的稳定性指定约束时，
可以在接口名称和 where 关键字后的 @Derive 参数中显式提供替代约束，这样在派生特定接口时就不会应
用默认约束。
在以下示例中，泛型参数 Something 未用于数据字段，因此在派生时考虑它没有意义。 */
@Derive[ToString where Data <: ToString]
@Derive[Hashable]
class C<Data, Something> {
    C(let a: Data) {}
    func f(): Something {}
}

// 所有选项示例 以下示例演示了 @Derive 和所有可能的选项同时应用的情况：
@Derive[Equatable, ToString]
@Derive[Hashable where A <: ToString, Comparable]
struct S<A, B> {
    let a: A

    @DeriveExclude
    let b: B
    init(a: A, b: B) {}

    @DeriveInclude
    prop x: Int {
        get() {}
    }
}
