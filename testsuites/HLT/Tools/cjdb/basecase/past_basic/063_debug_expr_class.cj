/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

class testc {
    let age: Int64 = 10
    var scores: Float64 = 12.12
    public var dcore: Int32 = 32
    public var bool1: Bool = true
    private let str1: String = "aaa"
    let lrun: Rune = 'A'
    var range1: Range<Int64> = 1..10 : 2
    var structinvar07: Array<Range<Int64>> = [range1, range1, range1]
    private var arr: ArrayList<Int64> = ArrayList<Int64>([0, 1, 2])
    var structinvar11: (UInt8, Int64, Float32, Bool, String, Rune, UInt8) = (1, 32, 13.31, true, "hello", r'a', 10)
}
class student {
    let age: Int64 = 10
    var scores: Float64 = 12.12
    public var dcore: Int32 = 32
    public var bool1: Bool = true
    private let str1: String = "aaa"
    let lrun: Rune = 'A'
    var range1: Range<Int64> = 1..10 : 2
    var s12: Array<Int32> = [32, 33]
    var structinvar07: Array<Range<Int64>> = [range1, range1, range1]
    private var arr: ArrayList<Int64> = ArrayList<Int64>([0, 1, 2])
    var structinvar11:(UInt8, Int64,Float32,Bool,String) = (1,32,13.31,true,"hello")
    public var vara: VArray<Int64, $3> = [1, 2, 3]
    public var tt: testc = testc()
    var aaa = 10
}

main(): Int64 {
    let stu = student()
    println("hello world")
    return 0
}
