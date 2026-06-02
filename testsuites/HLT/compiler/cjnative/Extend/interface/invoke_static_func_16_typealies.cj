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
    public A(let b!: Int32 = 0) {
    }
}

interface I {
    func foo() {
    }
}

type TA = A

type TI = I

extend TA <: I {
    public static func me(a!: Int32 = foo()) {
    }
}

main(): Int64 {
    if (A().me() == ()) {
        return 0
    }
    return 2
}

extend A <: TI {
    public static func me(a!: Int32 = foo()) {
    }
}

// ASSERT: scan sema_extend_member_cannot_shadow
// ASSERT: scan sema_static_function_cannot_access_non_static_member
// ASSERT: scan sema_mismatched_types
// ASSERT: scan sema_object_cannot_access_static_member
// ASSERT: scan sema_extend_duplicate_interface
