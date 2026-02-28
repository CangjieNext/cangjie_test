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
    var t: Bool = true
    var f: Bool = false
    var c: String = "s"
    var i8: Int8 = 1
    var i16: Int16 = 1000
    var i32: Int32 = 2147483647 //Int32
    var i64: Int64 = 2147483648
    var u8: UInt8 = 0 //UInt8
    var u16: UInt16 = 65535 //UInt16
    var u32: UInt32 = 4294967290
    var u64: UInt64 = 18446744073709551615 //UInt64
    var f16: Float16 = -2.3
    var f32: Float32 = 6.104 * 10 ** -38 //Float32
    var f64: Float64 = 0x1.1p0 //Float64
    f = Int8(t)
    f = Int16(t)
    f = Int32(t)
    f = Int64(t)
    f = UInt8(t)
    f = UInt16(t)
    f = UInt32(t)
    f = UInt64(t)
    f = Float16(t)
    f = Float32(t)
    f = Float64(t)
    f = bigInt(t)
    f = bigFloat(t)
    t = i8
    f = i16
    t = i32
    f = i64
    t = u8
    f = u16
    t = u32
    f = u64
    t = f16
    f = f32
    t = f64
}
// (not target_ios) ASSERT: scan sema_unexpected_return_type_for_entry
// ASSERT: scan sema_invalid_binary_expr
// ASSERT: scan sema_numeric_convert_must_be_numeric
// ASSERT: scan sema_undeclared_identifier
// ASSERT: scan sema_mismatched_types
