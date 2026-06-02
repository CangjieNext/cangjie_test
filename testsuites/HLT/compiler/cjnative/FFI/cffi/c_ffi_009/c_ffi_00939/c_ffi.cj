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
    public var ptr: CPointer<UInt8>

    public init(ui8: UInt8, ptr: CPointer<UInt8>) {
        this.ui8 = ui8
        this.ptr = ptr
    }
}

foreign {
    func testfunc1(): teststruct

    func testfunc2(st: teststruct): teststruct

    func free(cp: CPointer<Unit>): Unit
}

unsafe main(): Int64 {
    var struct1 = testfunc1()

    if ((struct1.ui8 == 123) && (struct1.ptr.read(0) == 97) && (struct1.ptr.read(1) == 98) && (struct1.ptr.read(2) == 99)) {
        struct1.ui8 = 255
        struct1.ptr.write(0, 101)
        struct1.ptr.write(1, 102)
        struct1.ptr.write(2, 103)
        var struct2 = testfunc2(struct1)
    }

    if ((struct1.ui8 == 255) && (struct1.ptr.read(0) == 104) && (struct1.ptr.read(1) == 105) && (struct1.ptr.read(2) ==
        106)) {
        free(CPointer<Unit>(struct1.ptr))
        return 0
    } else {
        return 1
    }
}
