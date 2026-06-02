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
    public var f32: Float32
    public var pf32: CPointer<Float32>

    public init(f32: Float32, pf32: CPointer<Float32>) {
        this.f32 = f32
        this.pf32 = pf32
    }
}

foreign {
    func testfunc1(): teststruct

    func testfunc2(ts: teststruct): teststruct

    func free(cp: CPointer<Unit>): Unit
}

unsafe main(): Int64 {
    var count = 0

    var struct1 = testfunc1()
    if ((struct1.f32 == 1.0) && (struct1.pf32.read(0) == 1.0) && (struct1.pf32.read(1) == 2.0) && (struct1
        .pf32
        .read(2) == 3.0)) {
        count += 1
    }

    struct1.f32 = 2.0
    struct1.pf32.write(0, 4.0)
    struct1.pf32.write(1, 5.0)
    struct1.pf32.write(2, 6.0)

    var struct2 = testfunc2(struct1)
    if ((struct2.f32 == 3.0) && (struct2.pf32.read(0) == 5.0) && (struct2.pf32.read(1) == 6.0) && (struct2
        .pf32
        .read(2) == 7.0)) {
        count += 1
    }

    if (count == 2) {
        free(CPointer<Unit>(struct1.pf32))
        return 0
    } else {
        return 1
    }
}
