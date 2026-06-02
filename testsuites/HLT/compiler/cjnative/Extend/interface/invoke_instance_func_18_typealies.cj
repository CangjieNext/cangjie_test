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
    public A(let b!: Int32 = 0) {
    }

    public func aaa() {
        return b
    }
}

interface I {
    func foo() {
        return "a"
    }
}

extend TA <: I {
    public func me(a!: A = this()) {
    }
}

type TA = A

type TI = I

main(): Int64 {
    return 0
}

extend A <: TI {
    public func me(a!: A = this()) {
    }
}

// ASSERT: scan sema_extend_member_cannot_shadow
// ASSERT: scan sema_invalid_this_call_outside_ctor
// ASSERT: scan sema_extend_duplicate_interface
