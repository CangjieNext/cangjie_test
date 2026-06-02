// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 3.3.1 变量的声明
var `open` = 1 // Define a variable named `open` with value 1.
var `throw` = "throw" // Define a variable named `throw` with value "throw".
const d: Int64 = 0 // Define a const variable named d with value 0.

// 3.3.2.1 不可变变量和可变变量
func  f() {
    let a = 1 // Define and initialize immutable variable a.
    let b: Int32 // Define immutable variable b without initialization.
    b = 10 // Initialize variable b.
    var aa: Float32 = 3.14 // Define and initialize mutable variable aa.
}

func  f() {
    let a = 1 // Define and initialize immutable variable a.
    a = 2 // error: immutable variable a cannot be reassigned.
    var b: Float32 = 3.14 // Define and initialize mutable b.
    b = 3.1415 // ok: mutable variable b can be reassigned.
}
class  C {
    let m1: Int64
    init(a: Int64, b: Int64) {
        m1 = a
        if (b > 0) {
            m1 = a * b // OK: immutable variable can be reassigned in constructor.
        }
    }
}

// 3.3.2.2 全局变量及静态变量
class  Foo {
    static let x: Int64
    static let y = (x = 1) // it's forbidden
}

/* The initialization of the global variable cannot depend on the global
variables defined in other files of the same package. */
// a.cj
let x = 2
let y = z // OK, b.cj does not depend on this file directly or indirectly.
let a = x // OK.
let c = A()

/* c.f is an open function, the compiler cannot statically determine whether the
function meets the initialization rules of global variables, and an error may
be reported. */
let d = c.f()
open class A {
    // static var x = A.z // Error, A.z is used before its initialization.
    // static var y = B.f // Error, B.f is used before its initialization.
    static var z = 1
    public open func f(): Int64 {
        return 77
    }
}

class B {
    static var e = A.z // OK.
    static var f = x // OK.
}