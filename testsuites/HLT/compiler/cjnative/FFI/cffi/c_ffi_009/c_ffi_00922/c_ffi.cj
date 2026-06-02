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
    public var i32: Int32
    public var ui32b: UInt32
    public var i64: Int64

    public init(i32: Int32, ui32b: UInt32, i64: Int64) {
        this.i32 = i32
        this.ui32b = ui32b
        this.i64 = i64
    }
}

foreign {
    func testfunc(n: Int32, pst: CPointer<teststruct>): CPointer<teststruct>

    func MallocWithZero(size: UIntNative): CPointer<Int32>

    func free(cp: CPointer<Unit>): Unit
}

unsafe main(): Int64 {
    var struct1 = teststruct(2147483647, 4294967295, 9223372036854770000)

    var pa = CPointer<teststruct>(MallocWithZero(16))
    pa.write(struct1)

    var pb = testfunc(1, pa)

    if ((pb.read().i32 == 2147483646) && (pb.read().ui32b == 4294967294) && (pb.read().i64 == 9223372036854769999)) {
        free(CPointer<Unit>(pa))
        return 0
    } else {
        return 1
    }
}
