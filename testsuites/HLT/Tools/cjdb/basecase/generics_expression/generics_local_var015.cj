/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

public interface I3 {
    static func fun_I2<T>(para1: T): Unit{
        var vcarrc2: Array<Int64> = [2]
        var vcptr = CPointer<Int8>()
    }
    static func f<T>(a:T): Unit
}
class Rect1<T> <: I3 {
    public static func f<T>(a:T): Unit {
        var aa:(Int64,T) = (1,a)
        var vhmc = HashMap<String, Int64>([("a", 1)])
        println("Foo")
    }
}

main(): Int64 {
    Rect1<Int64>.fun_I2(2)
    Rect1<Float64>.f<Int64>(2)
    return 0
}
