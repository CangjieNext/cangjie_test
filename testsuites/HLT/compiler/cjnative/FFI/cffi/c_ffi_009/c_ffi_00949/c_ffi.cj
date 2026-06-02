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
    public var f64a: Float64
    public var f64b: Float64
    public var f64c: Float64
    public var f64d: Float64

    public init(f64a: Float64, f64b: Float64, f64c: Float64, f64d: Float64) {
        this.f64a = f64a
        this.f64b = f64b
        this.f64c = f64c
        this.f64d = f64d
    }
}

foreign func testfunc(ts: teststruct): Int8

unsafe main(): Int64 {
    var pass = 0

    var struct1 = teststruct(1.0, 2.0, 3.0, 4.0)
    if ((struct1.f64a == 1.0) && (struct1.f64b == 2.0) && (struct1.f64c == 3.0) && (struct1.f64d == 4.0)) {
        pass += 1
    }

    var result = testfunc(struct1)
    if (result == 0) {
        pass += 1
    }

    if (pass == 2) {
        return 0
    } else {
        return 1
    }
}
