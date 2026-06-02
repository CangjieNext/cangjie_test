// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

import std.collection.*

class student {
    let i64: Int64 = 10
    var f64: Float64 = 12.12
    public var i32: Int32 = 32
    public var bool: Bool = true
    private let str1: String = "aaa"
    let rune: Rune = 'A'
    var rang: Range<Int64> = 1..10 : 2
    var structinvar07: Array<Range<Int64>> = [rang, rang, rang]
    private var arr: ArrayList<Int64> = ArrayList<Int64>([0, 1, 2])
    let set = HashSet<Int64>([0, 1, 2])
    var map = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
    var list_str: ArrayList<HashMap<String, Int64>> = ArrayList<HashMap<String, Int64>>([map])
    var list_set: ArrayList<HashSet<Int64>> = ArrayList<HashSet<Int64>>([set])
    var tup: (UInt8, Int64, Float32, Bool, String, Rune, UInt8) = (1, 32, 13.31, true, "hello", r'a', 111)
    public var varr: VArray<Int64, $3> = [1, 2, 3]
}

struct testc1 {
    let i64: Int64 = 10
    var f64: Float64 = 12.12
    public var i32: Int32 = 32
    public var bool: Bool = true
    private let str: String = "aaa"
    let rune: Rune = 'A'
    var rang: Range<Int64> = 1..10 : 2
    var arr: Array<Range<Int64>> = [rang, rang, rang]
    private var arrlist: ArrayList<Int64> = ArrayList<Int64>([0, 1, 2])
    let set = HashSet<Int64>([0, 1, 2])
    var map = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
    var tup: (UInt8, Int64, Float32, Bool, String, Rune, UInt8) = (1, 32, 13.31, true, "hello", r'a', 111)
}

struct Rect {
    let i64: Int64 = 10
    var f64: Float64 = 12.12
    public var i32: Int32 = 32
    public var bool: Bool = true
    private let str1: String = "aaa"
    let rune: Rune = 'A'
    var rang: Range<Int64> = 1..10 : 2
    var arr_rang: Array<Range<Int64>> = [rang, rang, rang]
    private var list: ArrayList<Int64> = ArrayList<Int64>([0, 1, 2])
    let set = HashSet<Int64>([0, 1, 2])
    var map = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
    var list_map: ArrayList<HashMap<String, Int64>> = ArrayList<HashMap<String, Int64>>.of(map)
    var tup: (UInt8, Int64, Float32, Bool, String, Rune, UInt8) = (1, 32, 13.31, true, "hello", r'a', 111)
    public var varr: VArray<Int64, $3> = [1, 2, 3]
    let stu = student()
    let bbbb = testc1()
}

main(): Int64 {
    let rr = Rect()
    return 0
}
