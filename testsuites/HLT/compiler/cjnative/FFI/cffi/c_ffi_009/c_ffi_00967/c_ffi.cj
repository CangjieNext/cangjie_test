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

interface Number<T> {
    operator func +(that: T): T
}

extend Int64 <: Number<Int32> {
    @C
    public operator func +(that: Int32): Int32 {
        Int32(this) + that
    }
}

class TEST {
    var a: Int64

    init(a: Int64) {
        this.a = a
    }

    @C
    private func goo(a: Int64): Int64 {
        return a
    }
}

extend TEST {
    @C
    func hoo(a: Int64): Int64 {
        return a
    }
}

main() {}
// ASSERT: scan sema_illegal_scope_use_of_annotation
