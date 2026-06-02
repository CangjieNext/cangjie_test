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

extend A <: TI {
    public static func me() {
        var a: () -> Int32 = foo
        a()
    }
}

type TA = A

type TI = I

interface I {
    static func foo() {
    }
}

extend TA <: I {
    public static func me() {
        var a: () -> Int32 = foo
        a()
    }
}

main(): Int64 {
    return 2
}

// ASSERT: scan sema_extend_member_cannot_shadow
// ASSERT: scan sema_mismatched_types
// ASSERT: scan sema_extend_duplicate_interface
