/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface A {}

open class B <: A {
    public func foo1() {
        1
    }
}

class C <: B {
    public func foo2() {
        2
    }
}

main(): Int64 {
    let f = {
        a => a.foo1() + a.foo2()
    }
    if (f is (C) -> Int64) {
        return 0
    }
    return 1
}
