// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: scan-not Expect Failed

import std.unittest.*
import std.unittest.testmacro.*
import std.ast.*

@Test
class F {
    public func f() {
        1
    }
    public static prop i: Int64 {
        get() {
            3
        }
    }
    var a: ?Int64 = 3
    var b: (Int32) = 1
    func getThis(): This {
        this
    }

    @TestCase
    public func test() {
        @Expect(i, 3)
        @Expect(a, 3)
        @Expect(f(), 1)
    }
}
