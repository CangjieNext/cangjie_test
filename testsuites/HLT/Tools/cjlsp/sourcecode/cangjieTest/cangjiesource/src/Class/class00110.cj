/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Class

// 成员函数的定义调用
class A10 {
    var a: Int64 = 1
}
class B10 {
    var b: Int64 = 2
}

open class C10 {
    open func bar(x: Int64): Int64 {
        return x
    }
    func getC() {
        return 3
    }
}

class Data10 <: C10 {
    func foo(): A10 {
        return A10()
    }
    func foo(x: Int64): B10 {
        return B10()
    }
    func bar(): String {
        "bar"
    }
    override func bar(x: Int64): Int64 {
        return x + 2
    }
    static func data(): Int64 {
        7
    }
}

func test10() {
    var data = Data10()
    var dt = Data10.data() //  点击跳转到定义处
    var a = data.foo().a //  点击.foo()跳转到函数定义 点击.a跳转到类A的成员变量a
    let b = Data10().foo(1).b //  点击.foo(1)跳转到函数定义初 点击.b跳转到类B的成员变量b
    let bar1 = data.bar() // 跳转到子类的bar()函数处
    let bar2 = data.bar(1) // 跳转到子类的覆盖函数处
    let d = data.getC() // 跳转到父类的函数定义处
}
