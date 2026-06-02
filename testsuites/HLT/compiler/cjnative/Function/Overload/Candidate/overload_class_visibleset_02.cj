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
    public static func foo(x: Int64): Int64 {
        return x ** 2
    }
    public func bar(x: Int32) {
        return x
    }
}

interface I {
    static func foo(x: Int64): String {
        x.toString()
    }
    func bar(x: Int32) {
        return x
    }
}

struct Data {
    public static func foo(): Int64 {
        3
    }
    public func bar(x: Int32) {
        return x
    }
}

main(): Int64 {
    var res1 = A.bar(2)
    var res2 = I.bar(2)
    var res3 = Data.bar(2)
    if (res == 2) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_illegal_access_non_static_member
// ASSERT: scan sema_undeclared_identifier
