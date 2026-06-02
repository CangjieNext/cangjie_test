// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 属性
class Foo {
    private var a = 0

    mut prop b: Int64 {
        get() {
            print("get")
            a
        }
        set(value) {
            print("set")
            a = value
        }
    }
}

main() {
    var x = Foo()
    let y = x.b + 1 // get
    x.b = y // set
}

// 7.1 属性的语法
class Foo {
    prop a: Int64 {
        get() {
            0
        }
    }

    mut prop b: Int64 {
        get() {
            0
        }
        set(v) {}
    }
}

// 当使用 let 声明 struct 的实例时，不能为 struct 中的属性赋值，就像用 let 声明的字段一样。
struct A {
    var i1 = 0

    mut prop i2: Int64 {
        get() {
            i1
        }
        set(value) {
            i1 = value
        }
    }
}

main() {
    let x = A()
    x.i1 = 2 // error
    x.i2 = 2 // error
}

// 7.2 属性的声明
// 属性可以在 interface、class、struct、enum、extend 中声明。
class A {
    prop i: Int64 {
        get() {
            0
        }
    }
}

struct B {
    prop i: Int64 {
        get() {
            0
        }
    }
}

enum C {
    Year

    prop i: Int64 {
        get() {
            0
        }
    }
}

extend A {
    prop s: String {
        get() {
            ""
        }
    }
}

// 可以在 interface 和 abstract class 中声明抽象属性，它的定义体可以省略。在实现类型中实现抽象属性时，保持原有的名称、类型、mut 修饰符不变。
interface I {
    prop a: Int64
}

class A <: I {
    public prop a: Int64 {
        get() {
            0
        }
    }
}

interface I {
    prop a: Int64 { // ok
        get() {
            0
        }
    }
}

class A <: I {} // ok

class A {
    var x = 0

    mut prop X: Int64 {
        get() {
            x + y
        }
        set(v) {
            x = v + y
        }
    }

    static var y = 0

    static mut prop Y: Int64 {
        get() {
            y
        }
        set(v) {
            y = v
        }
    }
}

// 7.3 属性的实现
class Foo {
    mut prop a: Int64 {
        get() { // () -> Int64
            "123" // error
        }
        set(v) { // (Int64) -> Unit
            123
        }
    }
}

// 7.4 属性的修饰符
// 属性跟函数一样可以使用修饰符修饰，但只允许对整个属性修饰，不能对 getter 或 setter 独立修饰。
class Foo {
    public mut prop a: Int64 { // ok
        get() {
            0
        }
        set(v) {}
    }
}

// 属性可以使用访问控制修饰符有 private、protected、public。
class Foo {
    private prop a: Int64 { // ok
        get() {
            0
        }
    }

    protected prop b: Int64 { // ok
        get() {
            0
        }
    }

    public static prop c: Int64 { // ok
        get() {
            0
        }
    }
}

// 实例属性像实例函数一样，可以使用 open 和 override 修饰。
// 使用 open 修饰的属性，子类型可以使用 override 覆盖父类型的实现（override 是可选的）。
open class A {
    public open mut prop i: Int64 {
        get() {
            0
        }
        set(v) {}
    }
}

class B <: A {
    override mut prop i: Int64 {
        get() {
            1
        }
        set(v) {}
    }
}

// 静态属性像静态函数一样，可以使用 redef 修饰（redef 是可选的），子类型可以重新实现父类型的静态属性。
open class A {
    static mut prop i: Int64 {
        get() {
            0
        }
        set(v) {}
    }
}

class B <: A {
    static redef mut prop i: Int64 {
        get() {
            1
        }
        set(v) {}
    }
}

// 子类型 override/redef 使用 let 声明的实例属性必须要重新实现 getter。
// 子类型 override/redef 父类型中使用 mut 修饰符声明的的属性时，允许只重新实现 getter 或 setter，但不能均不重新实现。
open class A {
    public open mut prop i1: Int64 {
        get() {
            0
        }
        set(v) {}
    }

    static mut prop i2: Int64 {
        get() {
            0
        }
        set(v) {}
    }
}

// case 1
class B <: A {
    public override mut prop i1: Int64 {
        get() {
            1 // ok
        }
    }

    static redef mut prop i2: Int64 {
        get() {
            1 // ok
        }
    }
}

// case 2
class B <: A {
    public override mut prop i1: Int64 {
        set(v) {} // ok
    }

    static redef mut prop i2: Int64 {
        set(v) {} // ok
    }
}

// case 3
class B <: A {
    override mut prop i1: Int64 {
    } // error

    static redef mut prop i2: Int64 {
    } // error
}

// 子类型的属性 override/redef 必须与父类型保持相同的 mut 修饰符，并且还必须保持相同的类型。
class P {}

class S {}

open class A {
    open prop i1: P {
        get() {
            P()
        }
    }

    static prop i2: P {
        get() {
            P()
        }
    }
}

// case 1
class B <: A {
    override mut prop i1: P { // error
        set(v) {}
    }

    static redef mut prop i2: P { // error
        set(v) {}
    }
}

class B <: A {
    override prop i1: S { // error
        get() {
            S()
        }
    }

    static redef prop i2: S { // error
        get() {
            S()
        }
    }
}

// 子类型 override 父类型的属性时，可以使用 super 调用父类型的实例属性。
open class A {
    open prop v: Int64 {
        get() {
            1
        }
    }
}

class B <: A {
    override prop v: Int64 {
        get() {
            super.v + 1
        }
    }
}
