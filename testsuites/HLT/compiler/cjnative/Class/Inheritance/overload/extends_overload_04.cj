/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

interface BaseI {
    static func foo() {
        return 1
    }
}

open class BaseC {
    public func foo(a: Int64) {
        return a
    }
}

class Data <: BaseC & BaseI {
    public func foo(a: Int64, b: Int64) {
        return a + b
    }
}

main(): Int64 {
    var obj = BaseC()
    var obj1 = Data()

    var res1: Int64 = BaseI.foo()
    var res2: Int64 = obj.foo(2)
    var res3: Int64 = obj1.foo(1, 2)

    if (res1 != 1 || res2 != 2 || res3 != 3) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_static_and_non_static_member_cannot_have_same_name
