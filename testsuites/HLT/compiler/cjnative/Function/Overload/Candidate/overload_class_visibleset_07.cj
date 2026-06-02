/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class Base {
    public let a: Int32 = 1
    public init(x: Int32) {
        this.a = x
    }
    public static func bar(): Int64 {
        1
    }
}

class A <: Base {
    public init(x: Int32) {
        super(x)
        super.bar()
    }
    public func foo(x: Int32): Int64 {
        super.foo2()
    }
    public func foo2() {
        2
    }
}

main(): Int64 {
    var res = A(2)
    var res1 = res.foo(1)
    if (res1 == 1 && res.a == 2) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_cannot_assign_to_immutable
// ASSERT: scan sema_object_cannot_access_static_member
// ASSERT: scan sema_not_member_of
