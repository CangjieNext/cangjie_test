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
    public var btmp: Bool
    public var ctmp: Int8
    public var i8tmp: Int8
    public var ui8tmp: UInt8
    public var i16tmp: Int16
    public var ui16tmp: UInt16
    public var i32tmp: Int32
    public var ui32btmp: UInt32
    public var i64tmp: Int64
    public var ui64tmp: UInt64
    public var f32tmp: Float32
    public var f64tmp: Float64
    public init(btmp!: Bool, ctmp!: Rune, i8tmp!: Int8, ui8tmp!: UInt8, i16tmp!: Int16, ui16tmp!: UInt16,
        i32tmp!: Int32, ui32btmp!: UInt32, i64tmp!: Int64, ui64tmp!: UInt64, f32tmp!: Float32, f64tmp!: Float64) {
        this.btmp = btmp
        this.ctmp = Int8(UInt32(ctmp))
        this.i8tmp = i8tmp
        this.ui8tmp = ui8tmp
        this.i16tmp = i16tmp
        this.ui16tmp = ui16tmp
        this.i32tmp = i32tmp
        this.ui32btmp = ui32btmp
        this.i64tmp = i64tmp
        this.ui64tmp = ui64tmp
        this.f32tmp = f32tmp
        this.f64tmp = f64tmp
    }
}

foreign func testfunc(st: teststruct): Int8

unsafe main(): Int64 {
    var struct1 = teststruct(btmp: true, ctmp: r'a', i8tmp: -128, ui8tmp: 255, i16tmp: -32768, ui16tmp: 65535,
        i32tmp: -2147483648, ui32btmp: 4294967295, i64tmp: -9223372036854770000, ui64tmp: 18446744073709500000,
        f32tmp: 34028234663852886.8, f64tmp: 175439769543232322308.8)
    testfunc(struct1)

    if ((struct1.btmp == true) && (struct1.ctmp == Int8(UInt32(r'a'))) && (struct1.i8tmp == -128) && (struct1.ui8tmp ==
        255) && (struct1.i16tmp == -32768) && (struct1.ui16tmp == 65535) && (struct1.i32tmp == -2147483648) && (struct1
        .ui32btmp == 4294967295) && (struct1.i64tmp == -9223372036854770000) && (struct1.ui64tmp == 18446744073709500000) &&
        (struct1.f32tmp == 34028235612225536.000000) && (struct1.f64tmp == 175439769543232323584.000000)) {
        return 0
    } else {
        return 1
    }
}
