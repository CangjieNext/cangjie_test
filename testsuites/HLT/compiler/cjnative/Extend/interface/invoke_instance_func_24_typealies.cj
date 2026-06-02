/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f -o %output 2>&1 | compare %f

class A {
    A(var a!: Int64 = 5) {
    }
}

interface I {
    func foo() {
        return "a"
    }
}

type TA = A

type TI = I

extend TA <: I {
    public func me() {
        return 0
    }

    public func me(): Int64 {
        return a
    }
}

extend A <: TI {
    public func me() {
        return 0
    }

    public func me(): Int64 {
        return a
    }
}

main(): Int64 {
    return 0
}

// ASSERT: scan sema_extend_member_cannot_shadow
// ASSERT: scan sema_overload_conflicts
// ASSERT: scan sema_extend_duplicate_interface
