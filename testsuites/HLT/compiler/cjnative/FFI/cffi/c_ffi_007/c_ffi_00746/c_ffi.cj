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

type TS = teststruct

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
    public var pts: CPointer<TS>

    public init(pts: CPointer<TS>) {
        this.pts = pts
    }

    public func foo(l: Int8, r: Int8): Int8 {
        return unsafe { l + pts.read().i8 + r }
    }
}

foreign {
    func AllocCStruct(): CPointer<TS>

    func testfunc(): CPointer<TS>
}

foreign func free(cp: CPointer<TS>): Unit

unsafe main(): Int64 {
    var count = 0
    var pas = AllocCStruct()
    if (pas.isNull()) {
        return 2
    }

    var a1 = A(pas)
    var a2 = A(testfunc())

    if ((a1.pts.read(0).i8 == a2.pts.read(0).i8) && (a1.pts.read(0).ui8 == a2.pts.read(0).ui8)) {
        count += 1
    }

    if (a1.foo(1, 1) == 3) {
        count += 1
    }

    free(pas)
    if (count == 2) {
        return 0
    } else {
        return 1
    }
}
