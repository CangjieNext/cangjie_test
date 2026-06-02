/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

struct rect {
    private var s12: Array<String> = ["aaa", "bbb", "ccc"]
    private var s121: Array<Array<String>> = [s12, s12]
    public var s13: ArrayList<Rune> = ArrayList<Rune>([r'a', r'b'])
    let width: Int64 = 10
    var height: Int32 = 32
}

class student {
    var range1: Range<Int64> = 1..10 : 2
    var s07: Array<Int64> = [1, 2, 3]
    var s071: Array<Array<Int64>> = [s07, s07, s07]
    var s0711: Array<Array<Array<Int64>>> = [s071, s071, s071]
    public var s08: Array<Rune> = [r'a', r'b', r'c']
    private var alr: ArrayList<Range<Int64>> = ArrayList<Range<Int64>>([range1, range1])
}


var globals_arrbool: Array<Bool> = [false, true]
var globals_arrfloat64: Array<Float64> = [12.12, 22.22]
var globals_sa1: ArrayList<Float32> = ArrayList<Float32>([32.32, 12.12])

main(): Int64 {
    var arrl: ArrayList<Int64> = ArrayList<Int64>([0, 1, 2])
    let arrt: Array<ArrayList<Int64>> = [arrl, arrl, arrl]
    let arr1: Array<Int64> = [1, 2, 3]
    var range1: Range<Int64> = 1..10 : 2
    var s7: Array<Range<Int64>> = [range1, range1, range1]
    let stu = student()
    let rect1 = rect()
    println("hello world")
    return 0
}
