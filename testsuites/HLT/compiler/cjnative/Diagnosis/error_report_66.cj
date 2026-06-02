/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

open class C1 {
    public static var foo = 1
}

class C2 <: C1 {
    public static var foo = 2
}

class D<T> where T <: C1 & C2 {
    public func foo() {
        return T.foo
    }
}

main() {
    let obj = D<C2>().foo()
    return 0
}
// ASSERT: scan sema_member_variable_can_not_shadow
