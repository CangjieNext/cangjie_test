/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class A {
    private static func foo(x: Int64): Int64 {
        return x ** 2
    }
    public func bar(x: Int32) {
        return A.foo(2)
    }
}

struct Data {
    private static func foo(): Int64 {
        3
    }
    public func bar(x: Int32) {
        return Data.foo()
    }
}

main(): Int64 {
    var res1 = A.foo(2)
    var res3 = Data.foo()
    if (res1 == 4 && res3 == 3) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_no_match_function_declaration_for_call
