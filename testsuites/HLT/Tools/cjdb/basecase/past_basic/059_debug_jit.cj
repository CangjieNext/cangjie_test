/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

main() {
    var var_int8: Int8 = 1
    var f_int8: Int8 = var_int8 + 12
    var var_int16: Int16 = 1
    var f_int16: Int16 = 12 - var_int16
    var var_int32: Int32 = 1
    var f_int32: Int32 = var_int32 * 5
    var var_int64: Int64 = 2
    var f_int64: Int64 = 20 / var_int64
    var var_uint8: UInt8 = 1
    var f_uint8: UInt8 =  var_uint8 + 8
    var var_uint16: UInt16 = 1
    var f_uint16: UInt16 =  var_uint16 + 8
    var var_uint32: UInt32 = 1
    var f_uint32: UInt32 =  var_uint32 + 8
    var var_uint64: UInt64 = 1
    var f_uint64: UInt64 =  var_uint64 + 8
    var var_float16: Float16 = 1.0
    var f_float16: Float16 =  var_float16 + 8.0
    var var_float32: Float32 = 1.0
    var f_float32: Float32 =  var_float32 + 8.0
    var var_float64: Float64 = 1.0
    var f_float64: Float64 =  var_float64 + 8.0
    var arr:Array<Int64> = [10, 20, 30]
    var arrl:ArrayList<Float16> = ArrayList<Float16>([11.11, 22.22])
    var arrli:ArrayList<Int32> = ArrayList<Int32>([32,35])
    var hm1 = HashMap<String, Int64>([("a", 2), ("b", 3), ("c", 2)])
    var va:VArray<Float64, $3> = ([33.33, 44.44, 55.55])
    var va1:VArray<UInt64, $3> = ([2, 5, 3])
    var var_bool: Bool = true
    return 0
}
