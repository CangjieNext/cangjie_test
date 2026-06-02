/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    var a: B = B(1)
    var b = a.foo(a)
    if (b != 1) {
        return 1
    }
    return 0
}

open class A {
    public var a: Int32
    public init(x: Int32) {
        a = x + 1
    }
    public open func ioo(x: B) {
        return B(1)
    }
}

class B <: A {
    public var b: Int32
    public init(x: Int32) {
        super(x)
        b = x
    }
    public override func ioo(x: B) {
        return A(1)
    }
}
// ASSERT: scan sema_not_member_of
// ASSERT: scan sema_return_type_incompatible
