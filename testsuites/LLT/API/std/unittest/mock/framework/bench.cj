/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f --mock=on -o %output %cmp_utest_opt 2>&1
// RUN-EXEC-0: %run %run_opt %output %run_utest_opt --bench --no-color 2>&1

import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

class A {
    func bar(): Int64 { 1 }
}

class B {
    func bar(): Int64 { 1 }
}

class C {
    func bar(): Int64 { 1 }
}

var x = 0

@Test
class FooTest {
    @Bench
    @TestCase
    func test1(): Unit {
        let a = mock<A>()
        let b = mock<B>()
        let c = mock<C>()
        @On(a.bar()).returns(44)
        @On(b.bar()).returns(55)
        @On(c.bar()).returns(66)
        let ab = a.bar()
        let bb = b.bar()
        let cb = c.bar()
        @Expect(ab == 44)
        @Expect(bb == 55)
        @Expect(cb == 66)
    }
}
