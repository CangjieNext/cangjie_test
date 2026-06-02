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

foreign func free(cp: CPointer<UInt8>): Unit

@C
struct teststruct {
    public var i8: Int8 = 0
    public var ui8: UInt8 = 0
    public var ptr: CPointer<UInt8> = CPointer<UInt8>()
}

foreign func testfunc1(): teststruct

foreign func testfunc2(st: teststruct): Int8

var count = 0

unsafe main(): Int64 {
    var struct1 = testfunc1()

    // 'a': 97; 'b': 98; 'c': 99
    if ((struct1.i8 == 123) && (struct1.ui8 == 123) && (struct1.ptr.read(0) == 97) && (struct1.ptr.read(1) == 98) && (struct1
        .ptr
        .read(2) == 99)) {
        count += 1
    }

    struct1.i8 = -128
    struct1.ui8 = 255
    struct1.ptr.write(0, 101) // 'e': 101
    struct1.ptr.write(1, 102) // 'f': 102
    struct1.ptr.write(2, 103) // 'g': 103

    if (testfunc2(struct1) == 0) {
        count += 1
    }
    free(struct1.ptr)

    if (count == 2) {
        return 0
    } else {
        return 1
    }
}
