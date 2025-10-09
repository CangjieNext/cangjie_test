/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Class

// 类中的成员继承
open class A6 {
    var a: Int64
    var c = 0
    A6(a: Int64, let b!: Int64 = 2) {
        this.a = a
    }
    init(x: Int64, y: String) {
        this.a = x
        this.b = x
    }
    func foo(): Int64 {
        return a + b
    }
}

class Data6<T> <: A6 {
    var d: Int64
    init(x: Int64) {
        super(x)
        d = x
        d = super.foo()
    }
}

var f1 = Data6<Int32>(3).c
