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
    public var f32a: Float32
    public var f32b: Float32
    public var f32c: Float32
    public var f32d: Float32

    public init(f32a: Float32, f32b: Float32, f32c: Float32, f32d: Float32) {
        this.f32a = f32a
        this.f32b = f32b
        this.f32c = f32c
        this.f32d = f32d
    }
}

foreign func testfunc(ts: teststruct): Int8

unsafe main(): Int64 {
    var pass = 0

    var struct1 = teststruct(1.0, 2.0, 3.0, 4.0)
    if ((struct1.f32a == 1.0) && (struct1.f32b == 2.0) && (struct1.f32c == 3.0) && (struct1.f32d == 4.0)) {
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
