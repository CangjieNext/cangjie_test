/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// DEPENDENCE: %n.c
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// RUN-EXEC: %run %run_opt %output %run_args

@C
struct teststruct {
    public var b: Bool
    public var c: Int8
    public var i8: Int8
    public var ui8: UInt8
    public var i16: Int16
    public var ui16: UInt16
    public var i32: Int32
    public var ui32b: UInt32
    public var i64: Int64
    public var ui64: UInt64
    public var f32: Float32
    public var f64: Float64
    public init(b!: Bool, c!: Rune, i8!: Int8, ui8!: UInt8, i16!: Int16, ui16!: UInt16, i32!: Int32, ui32b!: UInt32,
        i64!: Int64, ui64!: UInt64, f32!: Float32, f64!: Float64) {
        this.b = b
        this.c = Int8(UInt32(c))
        this.i8 = i8
        this.ui8 = ui8
        this.i16 = i16
        this.ui16 = ui16
        this.i32 = i32
        this.ui32b = ui32b
        this.i64 = i64
        this.ui64 = ui64
        this.f32 = f32
        this.f64 = f64
    }
}

foreign func testfunc(st: teststruct): Int8

var count = 0

unsafe main(): Int64 {
    var struct1 = teststruct(b: true, c: r'a', i8: 127, ui8: 255, i16: 32767, ui16: 65535, i32: 2147483647,
        ui32b: 4294967295, i64: 9223372036854770000, ui64: 18446744073709500000, f32: 34028234663852886.8,
        f64: 175439769543232322308.8)

    if ((struct1.b == true) && (struct1.c == Int8(UInt32(r'a'))) && (struct1.i8 == 127) && (struct1.ui8 == 255) && (struct1
        .i16 == 32767) && (struct1.ui16 == 65535) && (struct1.i32 == 2147483647) && (struct1.ui32b == 4294967295) && (struct1
        .i64 == 9223372036854770000) && (struct1.ui64 == 18446744073709500000) && (struct1.f32 == 34028234663852886.8) &&
        (struct1.f64 == 175439769543232322308.8)) {
        count += 1
    }

    if (testfunc(struct1) == 0) {
        count += 1
    }

    if (count == 2) {
        return 0
    } else {
        return 1
    }
}
