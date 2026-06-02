// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main(): Int64 {
    var u8a: UInt8 = 0
    var u8b: UInt8 = 255
    var u8c: UInt8 = 127
    var u16a: UInt16 = 0
    var u16b: UInt16 = 65535
    var u16c: UInt16 = 32767
    var u32a: UInt32 = 0
    var u32b: UInt32 = 4294967295
    var u32c: UInt32 = 2147483647
    var u64a: UInt64 = 0
    var u64b: UInt64 = 18446744073709551615
    var u64c: UInt64 = 9223372036854775807

    // UInt 2 int
    // UInt8->Int8
    var ret0 = Int8(u8c) - 127
    if (ret0 != 0) {
        return 1
    }
    // UInt8->Int16
    var ret = Int16(u8b) + Int16(u8a) - 255
    if (ret != 0) {
        return 2
    }
    // UInt8->Int32, UInt16->Int32
    var ret2 = Int32(u8b) + Int32(u8a) - 255
    var ret3 = Int32(u16a) + Int32(u16b) - 65535
    if (ret2 != 0 || ret3 != 0) {
        return 3
    }
    // UInt8->Int64, UInt16->Int64 ,UInt32->Int64
    var ret4 = Int64(u8b) + Int64(u8a) - 255
    var ret5 = Int64(u16a) + Int64(u16b) - 65535
    var ret6 = Int64(u32a) + Int64(u32b) - 4294967295
    if (ret4 != 0 || ret5 != 0 || ret6 != 0) {
        return 4
    }
    return 0
}
