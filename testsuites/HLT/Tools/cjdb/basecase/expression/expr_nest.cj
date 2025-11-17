/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

class C1 {
    var lInt8: Int8 = 8
    var lInt16: Int16 = 16
    var lInt32: Int32 = 32
    var lInt64: Int64 = 64
	var lIntN: IntNative = 100
    var listi8: ArrayList<Int8> = ArrayList<Int8>([1, 2, 3])
    var listi16: ArrayList<Int16> = ArrayList<Int16>([1, 2, 3])
    var listi32: ArrayList<Int32> = ArrayList<Int32>([1, 2, 3])
    var listi64: ArrayList<Int64> = ArrayList<Int64>([1, 2, 3])
    var listin: ArrayList<IntNative> = ArrayList<IntNative>([1, 2, 3])
}
struct S1 {
    var arr8: Array<UInt8> = [1, 2, 3]
    var arr16: Array<UInt16> = [1, 2, 3]
    var arr32: Array<UInt32> = [1, 2, 3]
    var arr64: Array<UInt64> = [1, 2, 3]
    var arrN: Array<UIntNative> = [1, 2, 3]
    var hmu8 = HashMap<String, UInt8>([("a", 0), ("b", 1), ("c", 2)])
    var hmu16 = HashMap<String, UInt16>([("a", 0), ("b", 1), ("c", 2)])
    var hmu32 = HashMap<String, UInt32>([("a", 0), ("b", 1), ("c", 2)])
    var hmu64 = HashMap<String, UInt64>([("a", 0), ("b", 1), ("c", 2)])
    var hmuin = HashMap<String, UIntNative>([("a", 0), ("b", 1), ("c", 2)])
}

struct S2 {
    var width: Int64 = 10
    var height: Int64 = 10
    var c = C1()
}

class C2 {
    var width: Int64 = 10
    var height: Int64 = 10
    var s = S1()
}

main(): Int64 {
    var sret = S2()
    var cret = C2()
    return 0
}
