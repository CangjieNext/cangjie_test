/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2 
// EXEC-PIPE-1: %compiler %cmp_opt -Woff=all %n.cj -o %output %cmp_utest_opt 2>&1 | compare %f
// ASSERT: scan-2 sema_mock_wrong_static_decl

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.mockmacro.*
import std.unittest.mock.*

const c_test = 100

private class top_class {
    static func foo() {
        "cangjiestaticclass"
    }
}

@Test
public class Test_mock_toplevel_static_02 {
    @TestCase
    func test01(): Unit {
        @On(c_test).returns(10000)
        println(c_test)
    }

    @TestCase
    func test02(): Unit {
        @On(top_class.foo()).returns("hongmeng")
        println(top_class.foo())
    }
}
