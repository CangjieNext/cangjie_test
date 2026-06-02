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
    public var b: Int32
    public A(b!: Int32 = 0) {
        this.b = b
    }
}

interface I {
    static func foo() {
    }
}

extend TA <: I {
    public static func me() {
        return this.b
    }
}

main(): Int64 {
    return Int64(A.me())
}

type TA = A

type TI = I

extend A <: TI {
    public static func me() {
        return this.b
    }
}

// ASSERT: scan sema_extend_member_cannot_shadow
// ASSERT: scan sema_static_members_cannot_call_members
// ASSERT: scan sema_ambiguous_match
// ASSERT: scan sema_extend_duplicate_interface
