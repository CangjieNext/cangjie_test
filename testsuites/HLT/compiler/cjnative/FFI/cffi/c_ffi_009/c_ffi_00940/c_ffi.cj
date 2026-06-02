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
    public var pui8: CPointer<UInt8>

    public init(ui8: UInt8, pui8: CPointer<UInt8>) {
        this.ui8 = ui8
        this.pui8 = pui8
    }
}

foreign {
    func testfunc1(): teststruct

    func testfunc2(st: teststruct): teststruct

    func free(cp: CPointer<Unit>): Unit
}

unsafe main(): Int64 {
    var count = 0

    var struct1 = testfunc1()
    if ((struct1.ui8 == 123) && (struct1.pui8.read(0) == 4) && (struct1.pui8.read(1) == 5) && (struct1.pui8.read(2) == 6)) {
        count += 1
    }

    struct1.ui8 = 255
    struct1.pui8.write(0, 4)
    struct1.pui8.write(1, 5)
    struct1.pui8.write(2, 6)

    var struct2 = testfunc2(struct1)
    if ((struct2.ui8 == 124) && (struct2.pui8.read(0) == 5) && (struct2.pui8.read(1) == 6) && (struct2.pui8.read(2) == 7)) {
        count += 1
    }

    if (count == 2) {
        free(CPointer<Unit>(struct1.pui8))
        return 0
    } else {
        return 1
    }
}
