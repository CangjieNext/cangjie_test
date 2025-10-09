/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import std.collection.*

class Rectangle{
    var hm8 = HashMap<String, Int8>([("a", 0), ("b", 1), ("c", 2)])
    var hm16 = HashMap<String, Int16>([("a", 0), ("b", 1), ("c", 2)])
    var hm32 = HashMap<String, Int32>([("a", 0), ("b", 1), ("c", 2)])
    var hm64 = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
    var hmin = HashMap<String, IntNative>([("a", 0), ("b", 1), ("c", 2)])
}
main(): Int64 {
    var rec = Rectangle()
    println("hello world")
    return 0
}
