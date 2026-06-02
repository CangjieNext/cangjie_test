/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

public interface I3<T> {
    func fun_I2(para1: T): Unit{
        var vcarrc2: Array<Int64> = [2]
        var vcptr = CPointer<Int8>()
    }
    func f(): Unit
}
class Rect1<T> <: I3<T> {
    public func f(): Unit {
        var vhmc = HashMap<String, Bool>([("a", true)])
        println("Foo")
    }
}

main(): Int64 {
    Rect1<Int64>().fun_I2(2)
    Rect1<Float64>().f()
    return 0
}
