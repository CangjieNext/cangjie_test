/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: a.cj a.cfg
// EXEC: %compiler %cmp_opt %compile_lib_opt a.cj -o a.%middle
// EXEC: %compiler %cmp_opt %f a.%middle -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan inside
package pkg115

import a.*

open class A<T> {
    public func test(a: T) {
        print("inside")
    }
    public var i: T
    public init(a: T) {
        this.i = a
    }
    public func b() {
        test(i)
    }
}

main(): Int64 {
    A<Int64>(0).b()
    return 0
}
