/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

import test.*
import java.lang.*
import std.ffi.java.*

@Java
class A <: InteropTest.InnerInterface {}

class Test<T> where t <: InteropTest.InnerInterface {
    public var t: T
    public init(t: T) {
        this.t = t
    }
}

main(): Int64 {
    var test: Test<A> = Test<A>(A())
    if (test.t.defaultFunc() == 2) {
        test.t.show<A>(JArray<A>([A(), A()]))
        return 0
    }
    return 1
}
// ASSERT: scan package_search_error
