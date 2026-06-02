/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

package packageTest

class B {
    public func foo1() {
        5
    }
}

extend B {
    public func foo2() {
        true
    }
}

public struct A<T> {
    public func foo3(data: T) {
        return data
    }
}

public var a = A<B>()

main(): Int64 {
    if (a.foo3(B()).foo2()) {
        return A<B>().foo3(B()).foo1() - 5
    }
    return 1
}
// ASSERT: scan sema_accessibility_with_main_hint
