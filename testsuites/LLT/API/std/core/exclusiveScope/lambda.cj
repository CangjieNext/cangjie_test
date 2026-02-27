/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.unittest.*

class F<T> where T <: ToString{
    F(let a: T) {}

    func foo() {
        exclusiveScope { =>
            a.toString()
        }
    }

    func bar<U>(b: U) where U <: Comparable<T> {
        exclusiveScope { =>
            b.compare(a)
        }
    }
}

@Test
class ExclusiveScopeTest {
    @TestCase
    func testLambda() {
        let f = F(18)
        @Assert(f.foo() == "18")
        @Assert(f.bar(17), LT)
    }
}