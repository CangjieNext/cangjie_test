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
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex pass

@C
struct teststruct {
    public var i32: Int32
    public var ui32b: UInt32
    public var i64: Int64

    public init(i32: Int32, ui32b: UInt32, i64: Int64) {
        this.i32 = i32
        this.ui32b = ui32b
        this.i64 = i64
    }
}

foreign func testfunc(st: teststruct): Int8

unsafe main(): Int64 {
    var pass = 0
    var struct1 = teststruct(2147483647, 4294967295, 9223372036854770000)

    if ((struct1.i32 == 2147483647) && (struct1.ui32b == 4294967295) && (struct1.i64 == 9223372036854770000)) {
        pass += 1
    }

    testfunc(struct1)

    if (pass == 1) {
        return 0
    } else {
        return 1
    }
}
