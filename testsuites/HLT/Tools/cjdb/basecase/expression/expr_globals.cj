/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

var globals_i8: Int8 = 8
var globals_i16: Int16 = 16
var globals_i32: Int32 = 32
var globals_i64: Int64 = 64
var globals_in: IntNative = 100
var globals_ui8: UInt8 = 8
var globals_ui16: UInt16 = 16
var globals_ui32: UInt32 = 32
var globals_ui64: UInt64 = 64
var globals_uin: UIntNative = 100
var globals_arru8: Array<UInt8> = [1, 2, 3]
var globals_arru16: Array<UInt16> = [1, 2, 3]
var globals_arru32: Array<UInt32> = [1, 2, 3]
var globals_arru64: Array<UInt64> = [1, 2, 3]
var globals_arruin: Array<UIntNative> = [1, 2, 3]
var globals_arr8: Array<Int8> = [1, 2, 3]
var globals_arr16: Array<Int16> = [1, 2, 3]
var globals_arr32: Array<Int32> = [1, 2, 3]
var globals_arr64: Array<Int64> = [1, 2, 3]
var globals_arrin: Array<IntNative> = [1, 2, 3]
var globals_listi8: ArrayList<Int8> = ArrayList<Int8>([1, 2, 3])
var globals_listi16: ArrayList<Int16> = ArrayList<Int16>([1, 2, 3])
var globals_listi32: ArrayList<Int32> = ArrayList<Int32>([1, 2, 3])
var globals_listi64: ArrayList<Int64> = ArrayList<Int64>([1, 2, 3])
var globals_listin: ArrayList<IntNative> = ArrayList<IntNative>([1, 2, 3])
var globals_listui8: ArrayList<UInt8> = ArrayList<UInt8>([1, 2, 3])
var globals_listui16: ArrayList<UInt16> = ArrayList<UInt16>([1, 2, 3])
var globals_listui32: ArrayList<UInt32> = ArrayList<UInt32>([1, 2, 3])
var globals_listui64: ArrayList<UInt64> = ArrayList<UInt64>([1, 2, 3])
var globals_listuin: ArrayList<UIntNative> = ArrayList<UIntNative>([1, 2, 3])
var globals_hmu8 = HashMap<String, UInt8>([("a", 0), ("b", 1), ("c", 2)])
var globals_hmu16 = HashMap<String, UInt16>([("a", 0), ("b", 1), ("c", 2)])
var globals_hmu32 = HashMap<String, UInt32>([("a", 0), ("b", 1), ("c", 2)])
var globals_hmu64 = HashMap<String, UInt64>([("a", 0), ("b", 1), ("c", 2)])
var globals_hmuin = HashMap<String, UIntNative>([("a", 0), ("b", 1), ("c", 2)])
var globals_hm8 = HashMap<String, Int8>([("a", 0), ("b", 1), ("c", 2)])
var globals_hm16 = HashMap<String, Int16>([("a", 0), ("b", 1), ("c", 2)])
var globals_hm32 = HashMap<String, Int32>([("a", 0), ("b", 1), ("c", 2)])
var globals_hm64 = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
var globals_hmin = HashMap<String, IntNative>([("a", 0), ("b", 1), ("c", 2)])

class C1 {
    var width = 10
    var height = 20
    public func areas() {
        this.width * this.height
    }
}

struct S1 {
    var width = 10
    var height = 20
    public func areas() {
        this.width * this.height
    }
}

main(): Int64 {
    var c1 = C1()
    var s1 = S1()
	c1.areas()
    s1.areas()
    return 0
}
