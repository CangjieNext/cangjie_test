/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A {
    public static let b: Int32 = 0
}

extend A <: TI {
    public static func me(a: Int32) {
        b = Int32(foo())
    }
}

interface I {
    static func foo() {
        1
    }
}

extend TA <: I {
    public static func me(a: Int32) {
        b = Int32(foo())
    }
}

main(): Int64 {
    return 0
}

type TA = A

type TI = I

// ASSERT: scan sema_extend_member_cannot_shadow
// ASSERT: scan sema_cannot_assign_to_immutable
// ASSERT: scan sema_extend_duplicate_interface
