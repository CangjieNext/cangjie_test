/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

struct rect {
    private var s14:HashMap<Bool, UInt64> = HashMap<Bool, UInt64>([(true, 10), (false, 20)])
    protected let s09 = HashSet<UInt64>([0, 1, 2])
    let width: Int64 = 10
    var height: Int32 = 32
}
class testc {
    let structinvar09 = HashSet<Int64>([0, 1, 2])
    var structinvar10 = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
}

class student {
    public var hs:HashSet<Bool> = HashSet<Bool>([true, false])
    public var hm: HashMap<Int64, String> = HashMap<Int64, String>([(10, "aaaa"), (20, "bbb")])
    let structinvar09 = HashSet<Int64>([0, 1, 2])
    var structinvar10 = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
    var alhm: ArrayList<HashMap<String, Int64>> = ArrayList<HashMap<String, Int64>>([structinvar10, structinvar10])
    public var hsr:HashSet<Range<Int64>> = HashSet<Range<Int64>>([1..10:2, 1..10:2])
    public var tt: testc = testc()
    var aaa = 10
}
var globals_hsr:HashSet<Rune> = HashSet<Rune>([r'a', r'b'])
let globals_hashset: HashSet<Int64> = HashSet<Int64>([0, 1, 2])
var globals_hs:HashSet<Float64> = HashSet<Float64>([12.12, 13.13])
let globals_arrh: Array<HashSet<Int64>> = [globals_hashset, globals_hashset]
let globals_arrlah: ArrayList<Array<HashSet<Int64>>> = ArrayList<Array<HashSet<Int64>>>([globals_arrh, globals_arrh])
var globals_hm:HashMap<String, Float64> = HashMap<String, Float64>([("aaaa", 11.11), ("bbb", 22.22)])
main(): Int64 {
    let s10 = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
    let s09 = HashSet<Int64>([0, 1, 2])
    let s09s = HashSet<String>(["aa", "bb"])
    let rect1 = rect()
    let stu = student()
    println("hello world")
    return 0
}
