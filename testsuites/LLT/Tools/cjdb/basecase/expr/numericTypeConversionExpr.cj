// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main() {
    var c: Rune = 'a'
    var i8: Int8 = 1
    var i16: Int16 = 1
    var i32: Int32 = 1
    var i64: Int64 = 1
    var iN: IntNative = 1
    var u8: UInt8 = 1
    var u16: UInt16 = 1
    var u32: UInt32 = 1
    var u64: UInt64 = 1
    var uN: UIntNative = 1
    var f16: Float16 = 1.0
    var f32: Float32 = 1.0
    var f64: Float64 = 1.0
    // between sign integer
    Int64(i8)
    Int32(i16)
    // between unsign integer
    UInt64(u8)
    UInt32(u16)
    // between float 
    Float64(f16)
    Float32(f64)
    // sign integer -> unsign integer 
    Int64(u8)
    UInt64(i8)
    // sign integer -> float 
    Float64(i8)
    Int64(f16)
    // unsign integer -> float 
    // UInt64(f16)
    Float64(u16)
    // char ->UInt32
    UInt32(c)
    return 0
}
