/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A1 {}

class A2 {}

interface I {
    static func foo(): A1 {
        return A1()
    }
}

class C1 <: I {
    public static func foo(): A2 {
        return A2()
    }
}

class D<T> where T <: C1 & I {
    public func foo() {
        return T.foo()
    }
}

main() {
    let obj = D<C1>().foo()
    return 0
}
// ASSERT: scan sema_return_type_incompatible
// ASSERT: scan sema_inherit_member_type_inconsistent
