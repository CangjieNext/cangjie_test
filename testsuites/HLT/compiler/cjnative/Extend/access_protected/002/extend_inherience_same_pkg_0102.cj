/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
open class A {
    protected func foo() {
        return 1
    }

    protected static func foo1() {
        return 1
    }
}

type TB = B

class B <: A {
    func foo_b() {
        foo() + foo1() + me()
    }
}

extend A {
    public func me() {
        foo() + foo1()
    }
}

main(): Int64 {
    return TB().me() + TB().foo_b() - 6
}
