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
    public var f32: Float32
    public var f64: Float64

    public init(i32: Int32, f32: Float32, f64: Float64) {
        this.i32 = i32
        this.f32 = f32
        this.f64 = f64
    }
}

foreign func testfunc(st: teststruct): Int8

unsafe main(): Int64 {
    var pass = 0
    var struct1 = teststruct(2147483647, 34028235612225536.000000, 175439769543232322308.8)

    if ((struct1.i32 == 2147483647) && (struct1.f32 == 34028235612225536.000000) && (struct1.f64 ==
        175439769543232322308.8)) {
        pass += 1
    }

    var struct2 = testfunc(struct1)

    if (pass == 1) {
        return 0
    } else {
        return 1
    }
}
