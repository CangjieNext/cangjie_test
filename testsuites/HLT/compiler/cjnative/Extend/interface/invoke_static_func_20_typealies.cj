/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f -o %output 2>&1 | compare %f

type TA = A

type TI = I

class A {
    public A(let b!: Int32 = 0) {
    }

    public static func aaa() {
        return 0
    }
}

extend TA <: I {
    public static func me(a!: () -> Int32 = foo) {
    }
}

interface I {
    static func foo() {
    }
}

main(): Int64 {
    return 2
}

extend A <: TI {
    public static func me(a!: () -> Int32 = foo) {
    }
}

// ASSERT: scan sema_extend_member_cannot_shadow
// ASSERT: scan sema_mismatched_types
// ASSERT: scan sema_extend_duplicate_interface
