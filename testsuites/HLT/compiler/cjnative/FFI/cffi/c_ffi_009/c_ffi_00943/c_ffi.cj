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
// EXEC-PIPE-1: %compiler %cmp_opt %ffic_opt -o %output 2>&1 | compare %f

interface I {
    func foo(m: Float32, n: Float64) {
        return m + Float32(n)
    }
}

@C
struct teststruct <: I {
    public var i8: Int8 = 0
    public var ui8: UInt8 = 0
    public var ptr: CPointer<UInt8> = CPointer<UInt8>()

    func foo(m: Float32, n: Float64) {
        return m + Float32(n)
    }
}

foreign {
    func testfunc1(): teststruct

    func testfunc2(st: teststruct): Int8
}

unsafe main(): Int64 {
    var struct1 = testfunc1()
    testfunc2(struct1)

    return 0
}
// ASSERT: scan sema_weak_visibility
