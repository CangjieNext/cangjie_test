/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -Woff=all %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

@Test
public class TestA {
    @TestCase
    func case2(): Unit {
        let x: Option<String> = Option<String>.None
        let y: Option<String> = "test12"
        @Assert(x, y)
    }
}

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}x{/COLOR} != {COLOR=YELLOW}y{/COLOR}
         left: None
        right: test12
 */
