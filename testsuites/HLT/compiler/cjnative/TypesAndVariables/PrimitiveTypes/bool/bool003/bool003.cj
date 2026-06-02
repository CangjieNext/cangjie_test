/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Bool {
    var c: String = "s" //string
    var i8: Int8 = 1
    var i16: Int16 = 1000 //Int16
    var i32: Int32 = 2147483647 //Int32
    var i64: Int64 = 2147483648 //Int64
    var u8: UInt8 = 0 //UInt8
    var u16: UInt16 = 65535 //UInt16
    var u32: UInt32 = 4294967295 //UInt32
    var u64: UInt64 = 18446744073709551615 //UInt64
    var f16: Float16 = -2.3 //Float16
    var f32: Float32 = 6.104 * 10 ** -38 //Float32
    var f64: Float64 = 0x1.1p0 //Float64
    var t: Bool = true
    var f: Bool = false
    c = t
    i8 = f
    i16 = t
    i32 = f
    i64 = t
    u8 = f
    u16 = t
    u32 = f
    u64 = t
    f16 = f
    f32 = t
    f64 = f
}
// (not iOS) ASSERT: scan sema_unexpected_return_type_for_entry
// ASSERT: scan sema_invalid_binary_expr
// ASSERT: scan sema_mismatched_types
