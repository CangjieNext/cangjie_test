// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main(): Int64 {
    // uint2uint
    var u8a: UInt8 = 0
    var u8b: UInt8 = 255
    var u16a: UInt16 = 0
    var u16b: UInt16 = 65535
    var u32a: UInt32 = 0
    var u32b: UInt32 = 4294967295
    var u64a: UInt64 = 0
    var u64b: UInt64 = 18446744073709551615
    // uint2uint
    // UInt8->UInt8,UInt16->UInt8,UInt32->UInt8,UInt64->UInt8
    var ret17 = UInt8(u8a) + UInt8(u8b) - 255
    var ret18 = UInt8(UInt16(u8a)) + UInt8(UInt16(u8b)) - 255
    var ret19 = UInt8(UInt32(u8a)) + UInt8(UInt32(u8b)) - 255
    var ret20 = UInt8(UInt64(u8a)) + UInt8(UInt64(u8b)) - 255
    if (ret17 != 0 || ret18 != 0 || ret19 != 0 || ret20 != 0) {
        return 5
    }
    // UInt8->UInt16,UInt16->UInt16,UInt32->UInt16,UInt64->UInt16
    var ret21 = UInt16(u8a) + UInt16(u8b) - 255
    var ret22 = UInt16(UInt16(u16a)) + UInt16(UInt16(u16b)) - 65535
    var ret23 = UInt16(UInt32(u16a)) + UInt16(UInt32(u16b)) - 65535
    var ret24 = UInt16(UInt64(u16a)) + UInt16(UInt64(u16b)) - 65535
    if (ret21 != 0 || ret22 != 0 || ret23 != 0 || ret24 != 0) {
        return 6
    }
    // UInt8->UInt32,UInt16->UInt32,UInt32->UInt32,UInt64->UInt32
    var ret25 = UInt32(u8a) + UInt32(u8b) - 255
    var ret26 = UInt32(u16a) + UInt32(u16b) - 65535
    var ret27 = UInt32(u32a) + UInt32(u32b) - 4294967295
    var ret28 = UInt32(UInt64(u32a)) + UInt32(UInt64(u32b)) - 4294967295
    if (ret25 != 0 || ret26 != 0 || ret27 != 0 || ret28 != 0) {
        return 7
    }
    // UInt8->UInt64,UInt16->UInt64,UInt32->UInt64,UInt64->UInt64
    var ret29 = UInt64(u8a) + UInt64(u8b) - 255
    var ret30 = UInt64(u16a) + UInt64(u16b) - 65535
    var ret31 = UInt64(u32a) + UInt64(u32b) - 4294967295
    var ret32 = UInt64(u64a) + UInt64(u64b) - 18446744073709551615
    if (ret29 != 0 || ret30 != 0 || ret31 != 0 || ret32 != 0) {
        return 8
    }
    return 0
}
