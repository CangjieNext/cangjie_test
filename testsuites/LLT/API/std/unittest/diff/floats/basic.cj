/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -Woff=all %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f

import std.unittest.*
import std.unittest.testmacro.*

@Test
public class TestA {
    @TestCase
    func case1() {
        let a = 0.2 + 0.1
        let b = 0.3
        @Assert(a, b)
    }
    @TestCase
    func case2() {
        let a = 0.2000001 + 0.1
        let b = 0.3
        @Assert(a, b)
    }
    @TestCase
    func case3() {
        let a = 100.1 + 200.0
        let b = 300.0
        @Assert(a, b)
    }
}

/* SCAN-IN
    Assert Failed: a != b
         a: 0.300000000000000044409
         b: 0.299999999999999988898
     delta: 5.55111512312578270212e-17
 */

/* SCAN-IN
    Assert Failed: a != b
         a: 0.3000001
         b: 0.3
     delta: 1e-07
 */

/* SCAN-IN
    Assert Failed: a != b
         a: 300.1
         b: 300.0
     delta: 0.1
 */
