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
    public var ui8: UInt8
    public var i16: Int16
    public var ui16: UInt16
    public var pui16: CPointer<UInt16>

    public init(ui8: UInt8, i16: Int16, ui16: UInt16, pui16: CPointer<UInt16>) {
        this.ui8 = ui8
        this.i16 = i16
        this.ui16 = ui16
        this.pui16 = pui16
    }
}

foreign {
    func testfunc1(): teststruct

    func testfunc2(st: teststruct): teststruct

    func free(cp: CPointer<Unit>): Unit
}

unsafe main(): Int64 {
    var struct1 = testfunc1()

    if ((struct1.ui8 == 123) && (struct1.i16 == 456) && (struct1.ui16 == 789) && (struct1.pui16.read(0) == 4) && (struct1
        .pui16
        .read(1) == 5) && (struct1.pui16.read(2) == 6)) {
        struct1.ui8 = 255
        struct1.i16 = 111
        struct1.ui16 = 222
        struct1.pui16.write(0, 7)
        struct1.pui16.write(1, 8)
        struct1.pui16.write(2, 9)
    }

    var struct2 = testfunc2(struct1)
    if ((struct2.ui8 == 254) && (struct2.i16 == 112) && (struct2.ui16 == 223) && (struct2.pui16.read(0) == 8) && (struct2
        .pui16
        .read(1) == 9) && (struct2.pui16.read(2) == 10)) {
        free(CPointer<Unit>(struct1.pui16))
        return 0
    } else {
        return 1
    }
}
