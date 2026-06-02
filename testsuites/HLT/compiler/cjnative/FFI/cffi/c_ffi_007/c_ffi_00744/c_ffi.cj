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

interface I {
    func foo(m: Int8, n: UInt8) {
        return m + Int8(n)
    }
}

@C
struct teststruct {
    public var i8: Int8
    public var ui8: UInt8

    public init(i8: Int8, ui8: UInt8) {
        this.i8 = i8
        this.ui8 = ui8
    }
}

extend<T> CPointer<T> <: I {
    public func foo(m: Int8, n: UInt8) {
        return m + Int8(n)
    }
}

foreign {
    func AllocCStruct(): CPointer<teststruct>

    func testfunc(): CPointer<teststruct>
}

foreign func free(cp: CPointer<teststruct>): Unit

unsafe main(): Int64 {
    var count = 0

    var ptr1 = AllocCStruct()
    var ptr2 = testfunc()
    if (ptr1.isNull() || ptr2.isNull()) {
        return 2
    }

    if ((ptr1.read().i8 == 1) && (ptr1.foo(ptr1.read().i8, 1) == 2)) {
        count += 1
    }
    free(ptr1)
    if (count == 1) {
        return 0
    } else {
        return 1
    }
}
