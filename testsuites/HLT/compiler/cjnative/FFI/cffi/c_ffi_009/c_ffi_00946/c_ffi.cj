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

foreign {
    func testfunc(n: Float32, pst: CPointer<teststruct>): CPointer<teststruct>

    func MallocWithZero(size: UIntNative): CPointer<Int8>

    func free(cp: CPointer<Unit>): Unit
}

unsafe main(): Int64 {
    var struct1 = teststruct(1.0, 2.0, 3.0, 4.0)

    var pa = CPointer<teststruct>(MallocWithZero(32))
    pa.write(struct1)

    var pb = testfunc(1.0, pa)

    if ((pb.read().f32a == 2.0) && (pb.read().f32b == 3.0) && (pb.read().f32c == 4.0) && (pb.read().f32d == 5.0)) {
        free(CPointer<Unit>(pb))
        return 0
    } else {
        return 1
    }
}
