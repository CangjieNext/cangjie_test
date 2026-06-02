/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    if (B().a != 1) {
        return 1
    }
    return 0
}

open class A1 {
    public func foo() {
        return 1
    }
}

interface A2 {
    func foo() {
        return 2
    }
}

class B <: A2 & A1 {
    public prop m: Int64 {
        get() {
            return foo()
        }
    }
}
// ASSERT: scan sema_not_member_of
// ASSERT: scan sema_superclass_must_be_placed_at_first
