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
    public var ptr: CPointer<CPointer<Int8>>

    public init(ptr: CPointer<CPointer<Int8>>) {
        this.ptr = ptr
    }

    public unsafe func foo(): CPointer<Int8> {
        var p1 = ptr.read(0)
        p1.write(0, 11)
        return p1
    }
}

foreign func testfunc(): CPointer<CPointer<Int8>>

foreign func free(cp: CPointer<CPointer<Int8>>): Unit

unsafe main(): Int64 {
    var count = 0

    var ptr1: CPointer<CPointer<Int8>> = testfunc()
    if (ptr1.isNull()) {
        return 2
    }
    var a1 = A(ptr1)

    if ((a1.ptr.read().read(0) == -128) && (a1.ptr.read().read(1) == 0) && (a1.ptr.read().read(2) == 127)) {
        count += 1
    }

    var ptr2 = a1.foo()
    if (ptr2.read() == 11) {
        count += 1
    }

    free(ptr1)
    free(CPointer<CPointer<Int8>>(ptr2))

    if (count == 2) {
        return 0
    } else {
        return 1
    }
}
