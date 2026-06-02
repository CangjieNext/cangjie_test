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

foreign {
    func AllocCStruct(): CPointer<teststruct>

    func testfunc(): CPointer<teststruct>
}

unsafe func foo() {
    var pts = testfunc()

    func foo1() {
        pts.write(0, teststruct(2, 2))
    }

    foo1()
}

unsafe main(): Int64 {
    foo()

    return 0
}
