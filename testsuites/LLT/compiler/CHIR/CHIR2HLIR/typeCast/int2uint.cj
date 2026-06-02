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
    var i8c: Int8 = 0
    var i16a: Int16 = -32768
    var i16b: Int16 = 32767
    var i16c: Int16 = 0
    var i32a: Int32 = -2147483648
    var i32b: Int32 = 2147483647
    var i32c: Int32 = 0
    var i64a: Int64 = -9223372036854775808
    var i64b: Int64 = 9223372036854775807
    var i64c: Int64 = 0
    // int 2 UInt
    // Int8->UInt8
    var ret7 = UInt8(i8c) + UInt8(i8b) - 127
    if (ret7 != 0) {
        return 7
    }
    // Int8->UInt16, Int16-> UInt16
    var ret8 = UInt16(i8c) + UInt16(i8b) - 127
    var ret9 = UInt16(i16c) + UInt16(i16b) - 32767
    if (ret8 != 0 || ret9 != 0) {
        return 8
    }
    // Int8->UInt32, UInt16->Int32 ,UInt32->Int32
    var ret10 = UInt32(i8c) + UInt32(i8b) - 127
    var ret11 = UInt32(i16c) + UInt32(i16b) - 32767
    var ret12 = UInt32(i32c) + UInt32(i32b) - 2147483647
    if (ret10 != 0 || ret11 != 0 || ret12 != 0) {
        return 9
    }
    // Int8->UInt64, Int16->Int64 ,Int32->Int64 ,Int32->Int64
    var ret13 = UInt64(i8c) + UInt64(i8b) - 127
    var ret14 = UInt64(i16c) + UInt64(i16b) - 32767
    var ret15 = UInt64(i32c) + UInt64(i32b) - 2147483647
    var ret16 = UInt64(i64c) + UInt64(i64b) - 9223372036854775807
    if (ret13 != 0 || ret14 != 0 || ret15 != 0 || ret16 != 0) {
        return 10
    }
    return 0
}
