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
    public var i8: Int8

    public init(i8: Int8) {
        this.i8 = i8
    }
}

foreign {
    func testfunc(n: Int8, pst: CPointer<teststruct>): CPointer<teststruct>

    func MallocWithZero(size: UIntNative): CPointer<Int8>

    func free(cp: CPointer<Unit>): Unit
}

unsafe main(): Int64 {
    var struct1 = teststruct(3)

    var pa = CPointer<teststruct>(MallocWithZero(16))
    pa.write(struct1)

    var pb = testfunc(1, pa)

    if (pb.read().i8 == 2) {
        free(CPointer<Unit>(pb))
        return 0
    } else {
        return 1
    }
}
