/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

func func1(): Int64 {
    var string  = "Hello Cangjie Lang"
    var var1 = 8
    var tuple1: (Int8,UInt16,Float32,Bool,Rune) = (-7, 255, 123.456, true, 'C')
    var tuple2: (Int8,UInt16,Float32,Bool,Rune) = (-7, 255, 123.456, true, 'C')
    var list1: Array<Int64> = Array<Int64>(100, repeat: 0)
    var list2: Array<Int64> = Array<Int64>(100, repeat: 0)
    func2(tuple1)
    0
}

func func2(): Int64 {
    var string  = "Hello Cangjie Lang"
    var tuple1: (Int8,UInt16,Float32,Bool,Rune) = (-7, 255, 123.456, true, 'C')
    var tuple2: (Int8,UInt16,Float32,Bool,Rune) = (-7, 255, 123.456, true, 'C')
    var list1: ArrayList<String> = ArrayList<String>(["helloworld", "helloworld"])
    var list2: ArrayList<String> = ArrayList<String>(["helloworld", "helloworld"])
    func3(tuple2)
    0
}

func func3(): Int64 {
    var string  = "Hello Cangjie Lang"
    var tuple1: (Int8,UInt16,Float32,Bool,Rune) = (-7, 255, 123.456, true, 'C')
    var tuple2: (Int8,UInt16,Float32,Bool,Rune) = (-7, 255, 123.456, true, 'C')
    var HashSet1: HashSet<Bool> = HashSet<Bool>([true, false])
    var HashSet2: HashSet<Bool> = HashSet<Bool>([true, false])
    func4(HashSet1)
    0
}

func func4(): Int64 {
    var string  = "Hello Cangjie Lang"
    var tuple1: (Int8,UInt16,Float32,Bool,Rune) = (-7, 255, 123.456, true, 'C')
    var tuple2: (Int8,UInt16,Float32,Bool,Rune) = (-7, 255, 123.456, true, 'C')
    var HashSet1: HashSet<Rune> = HashSet<Rune>(['a', 'b'])
    var HashSet2: HashSet<Rune> = HashSet<Rune>(['a', 'b'])
    func5(HashSet2)
    0
}

func func5(): Int64 {
    var string  = "Hello Cangjie Lang"
    var tuple1: (Int8,UInt16,Float32,Bool,Rune) = (-7, 255, 123.456, true, 'C')
    var tuple2: (Int8,UInt16,Float32,Bool,Rune) = (-7, 255, 123.456, true, 'C')
    var HashMap1: HashMap<Int64, Int64> = HashMap<Int64, Int64>([(1, 1), (2, 2)])
    var HashMap2: HashMap<Int64, Int64> = HashMap<Int64, Int64>([(1, 1), (2, 2)])
    func6(string)
    0
}

func func6(): Int64 {
    var string  = "Hello Cangjie Lang"
    var tuple1: (Int8,UInt16,Float32,Bool,Rune) = (-7, 255, 123.456, true, 'C')
    var tuple2: (Int8,UInt16,Float32,Bool,Rune) = (-7, 255, 123.456, true, 'C')
    var HashMap1: HashMap<String, Bool> = HashMap<String, Bool>([("AAA", true), ("BBB", false)])
    var HashMap2: HashMap<String, Bool> = HashMap<String, Bool>([("AAA", true), ("BBB", false)])
    0
}

main(): Int64 {
    func1("aaa")
    0
}
