/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../helpers
// EXEC: %compiler %cmp_opt -Woff=all -p helpers --mock=on %compile_lib_opt --output p.%middle
// EXEC: %compiler %cmp_opt -Woff=all p.%middle %n.cj -o %output %cmp_utest_opt --mock=on 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*
import std.collection.*

class Foo {
    func wrapper(): Int64 {
        this.bar(1)
    }
    func bar(i: Int64): Int64 {
        println("hello world!");
        return i
    }
}

@Test
class TestFoo {
    @TestCase
    func testFoo() {
        let originalFoo = Foo()
        let spiedInstance = spy<Foo>(originalFoo)
        @On(spiedInstance.bar(_)).returns(2)
        @Assert(spiedInstance.wrapper(), 2)
    }
}
