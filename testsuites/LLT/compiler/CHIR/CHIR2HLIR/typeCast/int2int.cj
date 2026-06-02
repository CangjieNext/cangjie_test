// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main(): Int64 {
    var i8a: Int8 = -128
    var i8b: Int8 = 127
    var i16a: Int16 = -32768
    var i16b: Int16 = 32767
    var i32a: Int32 = -2147483648
    var i32b: Int32 = 2147483647
    var i64a: Int64 = -9223372036854775808
    var i64b: Int64 = 9223372036854775807
    // int2int
    // Int8->Int8,Int16->Int8,Int32->Int8,Int64->Int8
    var ret1 = Int8(i8a) + Int8(i8b) + 1
    var ret2 = Int8(Int16(i8a)) + Int8(Int16(i8b)) + 1
    var ret3 = Int8(Int32(i8a)) + Int8(Int32(i8b)) + 1
    var ret4 = Int8(Int64(i8a)) + Int8(Int64(i8b)) + 1
    if (ret1 != 0 || ret2 != 0 || ret3 != 0 || ret4 != 0) {
        return 1
    }
    // Int8->Int16,Int16->Int16,Int32->Int16,Int64->Int16
    var ret5 = Int16(i8a) + Int16(i8b) + 1
    var ret6 = Int16(i16a) + Int16(i16b) + 1
    var ret7 = Int16(Int32(i16a)) + Int16(Int32(i16b)) + 1
    var ret8 = Int16(Int64(i16a)) + Int16(Int64(i16b)) + 1
    if (ret5 != 0 || ret6 != 0 || ret7 != 0 || ret8 != 0) {
        return 2
    }
    // Int8->Int32,Int16->Int32,Int32->Int32,Int64->Int32
    var ret9 = Int32(i8a) + Int32(i8b) + 1
    var ret10 = Int32(i16a) + Int32(i16b) + 1
    var ret11 = Int32(i32a) + Int32(i32b) + 1
    var ret12 = Int32(Int64(i32a)) + Int32(Int64(i32b)) + 1
    if (ret9 != 0 || ret10 != 0 || ret11 != 0 || ret12 != 0) {
        return 3
    }
    // Int8->Int64,Int16->Int64,Int32->Int64,Int64->Int64
    var ret13 = Int64(i8a) + Int64(i8b) + 1
    var ret14 = Int64(i16a) + Int64(i16b) + 1
    var ret15 = Int64(i32a) + Int64(i32b) + 1
    var ret16 = Int64(i64a) + Int64(i64b) + 1
    if (ret13 != 0 || ret14 != 0 || ret15 != 0 || ret16 != 0) {
        return 4
    }
    return 0
}
