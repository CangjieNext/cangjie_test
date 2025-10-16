/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

func test_int(a: Int64) {
    return a
}

func test_rune(a: Rune) {
    return a
}

func test_bool(a: Bool) {
    return a
}

var globals_int64: Int64 = 10

class C1 {
    var vc1: Int64 = 10
    var vc2: Int64 = 5
    var vc3: Array<Int64> = [1, 2, 3, 4, 5]
    var vc4: Float64 = 64.64
    var vc5: UInt64 = 50
    func areas() {
        return vc1 * vc2
    }
}

struct S1 {
    var vs1: Int64
    var vs2: Int64
    init(a: Int64, b: Int64) {
        vs1 = a
        vs2 = b
    }
}

main(): Int64 {
    var vi8: Int8 = 8
    var vi16: Int16 = 16
    var vi32: Int32 = 32
    var vi64: Int64 = 64
    var vu8: UInt8 = 8
    var vu16: UInt16 = 16
    var vu32: UInt32 = 32
    var vu64: UInt64 = 64
    var vf16: Float16 = 16.16
    var vf32: Float32 = 32.32
    var count = 10
    var arr1: Array<Int64> = [1, 2, 3]
    var arr2: Array<Array<Int64>> = [arr1, arr1, arr1]
    var list1 = ArrayList<Int64>([1, 2, 3])
    var hm = HashMap<String, Int64>([("a", 16), ("b", 32), ("c", 64)])
    var c = C1()
    var s = S1(10, 20)
    return 0
}
