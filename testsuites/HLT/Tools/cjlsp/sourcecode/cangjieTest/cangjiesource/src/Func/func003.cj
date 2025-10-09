/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Func

struct Data1 {
    var a: Int64
    var b: Int64
    init(x: Int64, y: Int64) {
        a = x
        b = y
    }
    func foo(x: Int64, y!: Int64, z!: Int64 = 3): Int64 {
        return x + y + z
    }

    func foo(x: Int64, y: (Int64) -> Int64): Int64 {
        return y(x)
    }

    func foo(): String {
        return "Nothing"
    }
    static func bar(x: Int64): Int64 {
        x
    }
}

func main3(): Int64 {
    var a = 1
    var b = 2
    var data = Data1(a, b)
    var bar = {x: Int64 => x}
    data.foo(a, bar)
    data.foo(a, y: b)
    data.foo(a, y: b, z: 4)
    data.foo()
    Data1.bar(3)
    return 0
}
