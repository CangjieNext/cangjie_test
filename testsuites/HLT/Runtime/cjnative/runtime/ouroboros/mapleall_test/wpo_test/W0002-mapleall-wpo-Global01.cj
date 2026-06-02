/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan passed

class Global01 {
    public var g: Object = Object()
    public var a: Object = Object()
    public func foo(o: Global01): Unit {
        o.a = Object()
        o.g = o.a
    }
    public func bar(): Unit {
        let x: Global01 = Global01()
        a = x
    }
}

main(): Int64 {
    let g: Global01 = Global01()
    g.foo(g)
    g.bar()
    print("passed")
    return 0
}
