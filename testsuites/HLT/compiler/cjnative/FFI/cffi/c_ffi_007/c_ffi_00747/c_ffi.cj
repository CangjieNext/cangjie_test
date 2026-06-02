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
    public var i8: Int8
    public var ui8: UInt8

    public init(i8: Int8, ui8: UInt8) {
        this.i8 = i8
        this.ui8 = ui8
    }
}

class A {
    public var pts: CPointer<teststruct>

    public init(pts: CPointer<teststruct>) {
        this.pts = pts
    }

    public func foo(l: Int8, r: Int8): Int8 {
        return unsafe { l + pts.read().i8 + r }
    }
}

foreign {
    func AllocCStruct(): CPointer<teststruct>

    func testfunc(): CPointer<teststruct>
}

foreign func free(cp: CPointer<teststruct>): Unit

unsafe main(): Int64 {
    var count = 0

    var pas = AllocCStruct()
    if (pas.isNull()) {
        return 2
    }
    var a1 = A(pas)
    var a2 = A(testfunc())

    var tuple1 = (a1, a2, count)

    if ((tuple1[0].pts.read(0).i8 == tuple1[1].pts.read(0).i8) && (tuple1[0].pts.read(0).ui8 == tuple1[1]
        .pts
        .read(0)
        .ui8)) {
        count += 1
    }

    if (tuple1[0].foo(1, 1) == 3) {
        count += 1
    }

    free(pas)
    if (count == 2) {
        return 0
    } else {
        return 1
    }
}
