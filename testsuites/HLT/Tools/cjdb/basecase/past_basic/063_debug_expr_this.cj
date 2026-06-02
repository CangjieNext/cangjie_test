/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

struct rect {
    private var s13a: ArrayList<Int64> = ArrayList<Int64>([64, 65])
    var a = testc()
    let bools: Bool = true
    public var ui8: UInt8 = 8
    let width: Int64 = 10
    var height: Int32 = 32
}

class testc {
    let age: Int64 = 10
    var scores: Float64 = 12.12
    public var dcore: Int32 = 32
    public var bool1: Bool = true
}

class student {
    var s12: Array<Int32> = [32, 33]
    private var ae = TimeUnit.Red
    let ar = rect()
    private var ain: Int32 = 10
    protected var af: Float32 = 32.32
    var aaa = 10
}

enum TimeUnit {
    Red
}

main(): Int64 {
    let stu = student()
    let rect1 = rect()
    println("hello world")
    return 0
}
