/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface Data {
    static func foo(a: Int64): Int64 {
        return 1
    }

    func fooo(a!: Int64): Int64 {
        return 1
    }
}

interface Data2 {
    static func foo(a!: Int64): Int64 {
        return 2
    }
}

class Test <: Data & Data2 {
    public static func foo(a: Int64): Int64 {
        return a
    }
}

main(): Int64 {
    var res1: Int64 = Test().fooo(a: 2)
    var res2: Int64 = Test.foo(2)
    if (res1 != 1 || res2 != 2) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_param_named_mismatched
