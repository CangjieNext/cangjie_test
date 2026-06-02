/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -Woff=all %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.mockmacro.*
import std.unittest.mock.*

public func foo(x: Int64, y: String): String {
    "111"
}

@Test
public class TestA {
    @TestCase
    func case2() {
        @On(foo(_, _)).returns("--- mocked value 1 ---")
        println(foo(1, "a"))
        println(foo(2, "g"))
    }
}

/* SCAN-IN
--- mocked value 1 ---
 */
