/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1:%compiler %cmp_opt %f -o %output 2>&1 | compare %f

class A {
    public func foo(): Int64 {
        1
    }
}

class B {
    public func bar(): Int64 {
        1
    }
}

main(): Int64 {
    var a: A = A()
    var b: B = B()
    a = b
    if (a.bar() != 1) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_mismatched_types
// ASSERT: scan sema_not_member_of
