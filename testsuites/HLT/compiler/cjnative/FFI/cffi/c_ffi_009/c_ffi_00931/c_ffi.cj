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

    public init(f32a: Float32, f32b: Float32) {
        this.f32a = f32a
        this.f32b = f32b
    }
}

foreign {
    func testfunc(n: Int32, pst: CPointer<teststruct>): CPointer<teststruct>

    func MallocWithZero(size: UIntNative): CPointer<Int32>

    func free(cp: CPointer<Unit>): Unit
}

unsafe main(): Int64 {
    var struct1 = teststruct(34028235612225536.000000, 34028235612225536.000000)

    var pa = CPointer<teststruct>(MallocWithZero(16))
    pa.write(struct1)

    var pb = testfunc(1, pa)

    if ((pb.read().f32a == 34028235612225535.000000) && (pb.read().f32b == 34028235612225535.000000)) {
        free(CPointer<Unit>(pa))
        return 0
    } else {
        return 1
    }
}
