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

foreign {
    func testfunc(n: Float64, pst: CPointer<teststruct>): CPointer<teststruct>

    func MallocWithZero(size: UIntNative): CPointer<Int8>

    func free(cp: CPointer<Unit>): Unit
}

unsafe main(): Int64 {
    var struct1 = teststruct(1.0, 2.0, 3.0, 4.0)

    var pa = CPointer<teststruct>(MallocWithZero(64))
    pa.write(struct1)

    var pb = testfunc(1.0, pa)

    if ((pb.read().f64a == 2.0) && (pb.read().f64b == 3.0) && (pb.read().f64c == 4.0) && (pb.read().f64d == 5.0)) {
        free(CPointer<Unit>(pb))
        return 0
    } else {
        return 1
    }
}
