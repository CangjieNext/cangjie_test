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
    public open func foo(): Int64 {
        1
    }
}

class A <: Base {
    public func foo(x: Int32): String {
        x.toString()
    }
    public func foo(x: Int64): Int64 {
        x + x
    }
    public override func foo(): Int64 {
        3
    }
}

main(): Int64 {
    var i1: Int16 = 2
    var i2: Int64 = 2
    var res = A()
    var res1 = res.foo(i1)
    var res2 = res.foo(i2)
    var res3 = res.foo()
    if (res1 == "2" && res2 == 4 && res3 == 3) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_mismatched_types
