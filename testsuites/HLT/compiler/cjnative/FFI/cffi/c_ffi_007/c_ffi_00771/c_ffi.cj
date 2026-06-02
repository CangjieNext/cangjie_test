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

struct A {
    public var pstr: CPointer<UInt64>

    public init(pstr: CPointer<UInt64>) {
        this.pstr = pstr
    }

    public unsafe func foo(): UInt64 {
        pstr.write(0, 1)
        return pstr.read()
    }
}

foreign {
    func testfunc(): CPointer<UInt64>

    func free(cp: CPointer<UInt64>): Unit
}

unsafe main(): Int64 {
    var count = 0

    var p1: CPointer<UInt64> = testfunc()
    if (p1.isNull()) {
        return 2
    }
    var a1 = A(p1)

    if ((a1.pstr.read(0) == 3) && (a1.pstr.read(1) == 6) && (a1.pstr.read(2) == 9)) {
        count += 1
    }

    var ui64 = a1.foo()
    if (ui64 == 1) {
        count += 1
    }

    free(p1)
    p1 = CPointer<UInt64>()
    if (count == 2) {
        return 0
    } else {
        return 1
    }
}
