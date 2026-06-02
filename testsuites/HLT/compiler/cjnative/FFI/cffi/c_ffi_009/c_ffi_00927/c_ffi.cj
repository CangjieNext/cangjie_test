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
    public var ui64: UInt64
    public var f32: Float32

    public init(ui64: UInt64, f32: Float32) {
        this.ui64 = ui64
        this.f32 = f32
    }
}

foreign func testfunc(st: teststruct): Int8

unsafe main(): Int64 {
    var pass = 0
    var struct1 = teststruct(18446744073709500000, 34028235612225536.000000)

    if ((struct1.ui64 == 18446744073709500000) && (struct1.f32 == 34028235612225536.000000)) {
        pass += 1
    }

    testfunc(struct1)

    if (pass == 1) {
        return 0
    } else {
        return 1
    }
}
